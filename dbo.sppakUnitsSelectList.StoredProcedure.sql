USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakUnitsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_Units].* ,
    [PAK_UnitSets1].[Description] AS PAK_UnitSets1_Description 
  FROM [PAK_Units] 
  LEFT OUTER JOIN [PAK_UnitSets] AS [PAK_UnitSets1]
    ON [PAK_Units].[UnitSetID] = [PAK_UnitSets1].[UnitSetID]
  WHERE 1 = 1  
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
GO
