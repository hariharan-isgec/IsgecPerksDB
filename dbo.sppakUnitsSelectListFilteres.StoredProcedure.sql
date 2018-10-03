USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakUnitsSelectListFilteres]
  @Filter_UnitSetID Int,
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
 ,UnitID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'UnitID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_Units].[UnitID]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_Units] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_UnitSets] AS [PAK_UnitSets1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_Units].[UnitSetID] = [PAK_UnitSets1].[UnitSetID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_UnitSetID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_Units].[UnitSetID] = ' + STR(@Filter_UnitSetID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UnitID' THEN '[PAK_Units].[UnitID]'
                        WHEN 'UnitID DESC' THEN '[PAK_Units].[UnitID] DESC'
                        WHEN 'Description' THEN '[PAK_Units].[Description]'
                        WHEN 'Description DESC' THEN '[PAK_Units].[Description] DESC'
                        WHEN 'UnitSetID' THEN '[PAK_Units].[UnitSetID]'
                        WHEN 'UnitSetID DESC' THEN '[PAK_Units].[UnitSetID] DESC'
                        WHEN 'ConversionFactor' THEN '[PAK_Units].[ConversionFactor]'
                        WHEN 'ConversionFactor DESC' THEN '[PAK_Units].[ConversionFactor] DESC'
                        WHEN 'PAK_UnitSets1_Description' THEN '[PAK_UnitSets1].[Description]'
                        WHEN 'PAK_UnitSets1_Description DESC' THEN '[PAK_UnitSets1].[Description] DESC'
                        ELSE '[PAK_Units].[UnitID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_Units].* ,
    [PAK_UnitSets1].[Description] AS PAK_UnitSets1_Description 
  FROM [PAK_Units] 
      INNER JOIN #PageIndex
          ON [PAK_Units].[UnitID] = #PageIndex.UnitID
  LEFT OUTER JOIN [PAK_UnitSets] AS [PAK_UnitSets1]
    ON [PAK_Units].[UnitSetID] = [PAK_UnitSets1].[UnitSetID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
