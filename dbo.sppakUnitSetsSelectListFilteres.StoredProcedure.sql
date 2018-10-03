USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakUnitSetsSelectListFilteres]
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
 ,UnitSetID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'UnitSetID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_UnitSets].[UnitSetID]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_UnitSets] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_UnitSets].[BaseUnitID] = [PAK_Units1].[UnitID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UnitSetID' THEN '[PAK_UnitSets].[UnitSetID]'
                        WHEN 'UnitSetID DESC' THEN '[PAK_UnitSets].[UnitSetID] DESC'
                        WHEN 'Description' THEN '[PAK_UnitSets].[Description]'
                        WHEN 'Description DESC' THEN '[PAK_UnitSets].[Description] DESC'
                        WHEN 'BaseUnitID' THEN '[PAK_UnitSets].[BaseUnitID]'
                        WHEN 'BaseUnitID DESC' THEN '[PAK_UnitSets].[BaseUnitID] DESC'
                        WHEN 'PAK_Units1_Description' THEN '[PAK_Units1].[Description]'
                        WHEN 'PAK_Units1_Description DESC' THEN '[PAK_Units1].[Description] DESC'
                        ELSE '[PAK_UnitSets].[UnitSetID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_UnitSets].* ,
    [PAK_Units1].[Description] AS PAK_Units1_Description 
  FROM [PAK_UnitSets] 
      INNER JOIN #PageIndex
          ON [PAK_UnitSets].[UnitSetID] = #PageIndex.UnitSetID
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units1]
    ON [PAK_UnitSets].[BaseUnitID] = [PAK_Units1].[UnitID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
