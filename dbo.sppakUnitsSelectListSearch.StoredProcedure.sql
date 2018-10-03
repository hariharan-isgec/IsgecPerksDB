USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakUnitsSelectListSearch]
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
 ,UnitID Int NOT NULL
  )
  INSERT INTO #PageIndex (UnitID)
  SELECT [PAK_Units].[UnitID] FROM [PAK_Units]
  LEFT OUTER JOIN [PAK_UnitSets] AS [PAK_UnitSets1]
    ON [PAK_Units].[UnitSetID] = [PAK_UnitSets1].[UnitSetID]
 WHERE  
   ( 
         STR(ISNULL([PAK_Units].[UnitID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_Units].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_Units].[UnitSetID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_Units].[ConversionFactor], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'UnitID' THEN [PAK_Units].[UnitID] END,
     CASE @OrderBy WHEN 'UnitID DESC' THEN [PAK_Units].[UnitID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_Units].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_Units].[Description] END DESC,
     CASE @OrderBy WHEN 'UnitSetID' THEN [PAK_Units].[UnitSetID] END,
     CASE @OrderBy WHEN 'UnitSetID DESC' THEN [PAK_Units].[UnitSetID] END DESC,
     CASE @OrderBy WHEN 'ConversionFactor' THEN [PAK_Units].[ConversionFactor] END,
     CASE @OrderBy WHEN 'ConversionFactor DESC' THEN [PAK_Units].[ConversionFactor] END DESC,
     CASE @OrderBy WHEN 'PAK_UnitSets1_Description' THEN [PAK_UnitSets1].[Description] END,
     CASE @OrderBy WHEN 'PAK_UnitSets1_Description DESC' THEN [PAK_UnitSets1].[Description] END DESC 

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
