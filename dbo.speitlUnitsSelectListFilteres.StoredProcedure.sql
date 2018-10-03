USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlUnitsSelectListFilteres]
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
 ,UnitID NVarChar(3) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'UnitID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[EITL_Units].[UnitID]'
  SET @LGSQL = @LGSQL + ' FROM [EITL_Units] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UnitID' THEN '[EITL_Units].[UnitID]'
                        WHEN 'UnitID DESC' THEN '[EITL_Units].[UnitID] DESC'
                        WHEN 'Description' THEN '[EITL_Units].[Description]'
                        WHEN 'Description DESC' THEN '[EITL_Units].[Description] DESC'
                        ELSE '[EITL_Units].[UnitID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[EITL_Units].[UnitID] ,
		[EITL_Units].[Description]  
  FROM [EITL_Units] 
    	INNER JOIN #PageIndex
          ON [EITL_Units].[UnitID] = #PageIndex.UnitID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
