USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostQuartersSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,Quarter Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'Quarter'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[COST_Quarters].[Quarter]'
  SET @LGSQL = @LGSQL + ' FROM [COST_Quarters] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'Quarter' THEN '[COST_Quarters].[Quarter]'
                        WHEN 'Quarter DESC' THEN '[COST_Quarters].[Quarter] DESC'
                        WHEN 'Description' THEN '[COST_Quarters].[Description]'
                        WHEN 'Description DESC' THEN '[COST_Quarters].[Description] DESC'
                        ELSE '[COST_Quarters].[Quarter]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [COST_Quarters].*  
  FROM [COST_Quarters] 
      INNER JOIN #PageIndex
          ON [COST_Quarters].[Quarter] = #PageIndex.Quarter
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
