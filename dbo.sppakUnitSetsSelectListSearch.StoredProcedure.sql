USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakUnitSetsSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,UnitSetID Int NOT NULL
  )
  INSERT INTO #PageIndex (UnitSetID)
  SELECT [PAK_UnitSets].[UnitSetID] FROM [PAK_UnitSets]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units1]
    ON [PAK_UnitSets].[BaseUnitID] = [PAK_Units1].[UnitID]
 WHERE  
   ( 
         STR(ISNULL([PAK_UnitSets].[UnitSetID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_UnitSets].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_UnitSets].[BaseUnitID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'UnitSetID' THEN [PAK_UnitSets].[UnitSetID] END,
     CASE @OrderBy WHEN 'UnitSetID DESC' THEN [PAK_UnitSets].[UnitSetID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_UnitSets].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_UnitSets].[Description] END DESC,
     CASE @OrderBy WHEN 'BaseUnitID' THEN [PAK_UnitSets].[BaseUnitID] END,
     CASE @OrderBy WHEN 'BaseUnitID DESC' THEN [PAK_UnitSets].[BaseUnitID] END DESC,
     CASE @OrderBy WHEN 'PAK_Units1_Description' THEN [PAK_Units1].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units1_Description DESC' THEN [PAK_Units1].[Description] END DESC 

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
