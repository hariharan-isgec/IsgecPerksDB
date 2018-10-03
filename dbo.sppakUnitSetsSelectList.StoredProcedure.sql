USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakUnitSetsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_UnitSets].* ,
    [PAK_Units1].[Description] AS PAK_Units1_Description 
  FROM [PAK_UnitSets] 
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units1]
    ON [PAK_UnitSets].[BaseUnitID] = [PAK_Units1].[UnitID]
  WHERE 1 = 1  
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
GO
