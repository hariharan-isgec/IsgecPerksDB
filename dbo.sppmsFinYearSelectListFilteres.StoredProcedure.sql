USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFinYearSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,FinYear NVarChar(4) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'FinYear'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PMS_FinYear].[FinYear]'
  SET @LGSQL = @LGSQL + ' FROM [PMS_FinYear] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'FinYear' THEN '[PMS_FinYear].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[PMS_FinYear].[FinYear] DESC'
                        WHEN 'Description' THEN '[PMS_FinYear].[Description]'
                        WHEN 'Description DESC' THEN '[PMS_FinYear].[Description] DESC'
                        WHEN 'Active' THEN '[PMS_FinYear].[Active]'
                        WHEN 'Active DESC' THEN '[PMS_FinYear].[Active] DESC'
                        WHEN 'PlanningOpen' THEN '[PMS_FinYear].[PlanningOpen]'
                        WHEN 'PlanningOpen DESC' THEN '[PMS_FinYear].[PlanningOpen] DESC'
                        WHEN 'MidTermOpen' THEN '[PMS_FinYear].[MidTermOpen]'
                        WHEN 'MidTermOpen DESC' THEN '[PMS_FinYear].[MidTermOpen] DESC'
                        WHEN 'FinalOpen' THEN '[PMS_FinYear].[FinalOpen]'
                        WHEN 'FinalOpen DESC' THEN '[PMS_FinYear].[FinalOpen] DESC'
                        ELSE '[PMS_FinYear].[FinYear]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[PMS_FinYear].[FinYear] ,
		[PMS_FinYear].[Description] ,
		[PMS_FinYear].[Active] ,
		[PMS_FinYear].[PlanningOpen] ,
		[PMS_FinYear].[MidTermOpen] ,
		[PMS_FinYear].[FinalOpen]  
  FROM [PMS_FinYear] 
    	INNER JOIN #PageIndex
          ON [PMS_FinYear].[FinYear] = #PageIndex.FinYear
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
