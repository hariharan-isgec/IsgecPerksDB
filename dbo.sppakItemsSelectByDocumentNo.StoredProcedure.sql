USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakItemsSelectByDocumentNo]
  @DocumentNo Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_Items].* ,
    [PAK_Divisions1].[Description] AS PAK_Divisions1_Description,
    [PAK_Documents2].[Description] AS PAK_Documents2_Description,
    [PAK_Elements3].[Description] AS PAK_Elements3_Description,
    [PAK_Units5].[Description] AS PAK_Units5_Description,
    [PAK_Units6].[Description] AS PAK_Units6_Description 
  FROM [PAK_Items] 
  LEFT OUTER JOIN [PAK_Divisions] AS [PAK_Divisions1]
    ON [PAK_Items].[DivisionID] = [PAK_Divisions1].[DivisionID]
  LEFT OUTER JOIN [PAK_Documents] AS [PAK_Documents2]
    ON [PAK_Items].[DocumentNo] = [PAK_Documents2].[DocumentNo]
  LEFT OUTER JOIN [PAK_Elements] AS [PAK_Elements3]
    ON [PAK_Items].[ElementID] = [PAK_Elements3].[ElementID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units5]
    ON [PAK_Items].[UOMQuantity] = [PAK_Units5].[UnitID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units6]
    ON [PAK_Items].[UOMWeight] = [PAK_Units6].[UnitID]
  WHERE
  [PAK_Items].[DocumentNo] = @DocumentNo
  ORDER BY
     CASE @OrderBy WHEN 'ItemNo' THEN [PAK_Items].[ItemNo] END,
     CASE @OrderBy WHEN 'ItemNo DESC' THEN [PAK_Items].[ItemNo] END DESC,
     CASE @OrderBy WHEN 'ItemCode' THEN [PAK_Items].[ItemCode] END,
     CASE @OrderBy WHEN 'ItemCode DESC' THEN [PAK_Items].[ItemCode] END DESC,
     CASE @OrderBy WHEN 'ItemDescription' THEN [PAK_Items].[ItemDescription] END,
     CASE @OrderBy WHEN 'ItemDescription DESC' THEN [PAK_Items].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'DivisionID' THEN [PAK_Items].[DivisionID] END,
     CASE @OrderBy WHEN 'DivisionID DESC' THEN [PAK_Items].[DivisionID] END DESC,
     CASE @OrderBy WHEN 'ElementID' THEN [PAK_Items].[ElementID] END,
     CASE @OrderBy WHEN 'ElementID DESC' THEN [PAK_Items].[ElementID] END DESC,
     CASE @OrderBy WHEN 'UOMQuantity' THEN [PAK_Items].[UOMQuantity] END,
     CASE @OrderBy WHEN 'UOMQuantity DESC' THEN [PAK_Items].[UOMQuantity] END DESC,
     CASE @OrderBy WHEN 'Quantity' THEN [PAK_Items].[Quantity] END,
     CASE @OrderBy WHEN 'Quantity DESC' THEN [PAK_Items].[Quantity] END DESC,
     CASE @OrderBy WHEN 'UOMWeight' THEN [PAK_Items].[UOMWeight] END,
     CASE @OrderBy WHEN 'UOMWeight DESC' THEN [PAK_Items].[UOMWeight] END DESC,
     CASE @OrderBy WHEN 'WeightPerUnit' THEN [PAK_Items].[WeightPerUnit] END,
     CASE @OrderBy WHEN 'WeightPerUnit DESC' THEN [PAK_Items].[WeightPerUnit] END DESC,
     CASE @OrderBy WHEN 'DocumentNo' THEN [PAK_Items].[DocumentNo] END,
     CASE @OrderBy WHEN 'DocumentNo DESC' THEN [PAK_Items].[DocumentNo] END DESC,
     CASE @OrderBy WHEN 'ParentItemNo' THEN [PAK_Items].[ParentItemNo] END,
     CASE @OrderBy WHEN 'ParentItemNo DESC' THEN [PAK_Items].[ParentItemNo] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [PAK_Items].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [PAK_Items].[Active] END DESC,
     CASE @OrderBy WHEN 'Root' THEN [PAK_Items].[Root] END,
     CASE @OrderBy WHEN 'Root DESC' THEN [PAK_Items].[Root] END DESC,
     CASE @OrderBy WHEN 'Middle' THEN [PAK_Items].[Middle] END,
     CASE @OrderBy WHEN 'Middle DESC' THEN [PAK_Items].[Middle] END DESC,
     CASE @OrderBy WHEN 'Bottom' THEN [PAK_Items].[Bottom] END,
     CASE @OrderBy WHEN 'Bottom DESC' THEN [PAK_Items].[Bottom] END DESC,
     CASE @OrderBy WHEN 'Free' THEN [PAK_Items].[Free] END,
     CASE @OrderBy WHEN 'Free DESC' THEN [PAK_Items].[Free] END DESC,
     CASE @OrderBy WHEN 'ItemLevel' THEN [PAK_Items].[ItemLevel] END,
     CASE @OrderBy WHEN 'ItemLevel DESC' THEN [PAK_Items].[ItemLevel] END DESC,
     CASE @OrderBy WHEN 'Prefix' THEN [PAK_Items].[Prefix] END,
     CASE @OrderBy WHEN 'Prefix DESC' THEN [PAK_Items].[Prefix] END DESC,
     CASE @OrderBy WHEN 'PAK_Divisions1_Description' THEN [PAK_Divisions1].[Description] END,
     CASE @OrderBy WHEN 'PAK_Divisions1_Description DESC' THEN [PAK_Divisions1].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Documents2_Description' THEN [PAK_Documents2].[Description] END,
     CASE @OrderBy WHEN 'PAK_Documents2_Description DESC' THEN [PAK_Documents2].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Elements3_Description' THEN [PAK_Elements3].[Description] END,
     CASE @OrderBy WHEN 'PAK_Elements3_Description DESC' THEN [PAK_Elements3].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Units5_Description' THEN [PAK_Units5].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units5_Description DESC' THEN [PAK_Units5].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Units6_Description' THEN [PAK_Units6].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units6_Description DESC' THEN [PAK_Units6].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
