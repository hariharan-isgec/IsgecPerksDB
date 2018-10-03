USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sppak_LG_1HItemsSelectByRootItem]
  @RootItem Int,
  @RecordCount Int = 0 OUTPUT
  AS

SET NOCOUNT ON

CREATE TABLE #CHILDREN(SN int Identity, ItemNo int )

DECLARE @NewInsertCount int

INSERT INTO #CHILDREN(ItemNo)
SELECT ItemNo FROM PAK_Items WHERE ItemNo = @RootItem

SET @NewInsertCount = @@ROWCOUNT


WHILE @NewInsertCount > 0
BEGIN
    INSERT INTO #CHILDREN(ItemNo) 
        SELECT ItemNo FROM PAK_Items WHERE EXISTS
               (SELECT ItemNo  FROM #CHILDREN
                WHERE PAK_Items.ParentItemNo = #CHILDREN.ItemNo)
         AND  NOT EXISTS
              (SELECT ItemNo FROM #CHILDREN
               WHERE PAK_Items.ItemNo = #CHILDREN.ItemNo)   
    
         SET @NewInsertCount = @@ROWCOUNT;
END


  SELECT  
    ltrim(pak_items.prefix)+PAK_Items.ItemDescription as hc, 
    [PAK_Items].* ,
    [PAK_Divisions1].[Description] AS PAK_Divisions1_Description,
    [PAK_Documents2].[cmba] AS PAK_Documents2_cmba,
    [PAK_Elements3].[Description] AS PAK_Elements3_Description,
    [PAK_Items4].[ItemDescription] AS PAK_Items4_ItemDescription,
    [PAK_Units5].[Description] AS PAK_Units5_Description,
    [PAK_Units6].[Description] AS PAK_Units6_Description,
    [PAK_Items7].[ItemDescription] AS PAK_Items7_ItemDescription 
  FROM [PAK_Items] 
  INNER JOIN #CHILDREN ON PAK_Items.ItemNo = #CHILDREN.ItemNo  
  LEFT OUTER JOIN [PAK_Divisions] AS [PAK_Divisions1]
    ON [PAK_Items].[DivisionID] = [PAK_Divisions1].[DivisionID]
  LEFT OUTER JOIN [PAK_Documents] AS [PAK_Documents2]
    ON [PAK_Items].[DocumentNo] = [PAK_Documents2].[DocumentNo]
  LEFT OUTER JOIN [PAK_Elements] AS [PAK_Elements3]
    ON [PAK_Items].[ElementID] = [PAK_Elements3].[ElementID]
  LEFT OUTER JOIN [PAK_Items] AS [PAK_Items4]
    ON [PAK_Items].[ParentItemNo] = [PAK_Items4].[ItemNo]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units5]
    ON [PAK_Items].[UOMQuantity] = [PAK_Units5].[UnitID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units6]
    ON [PAK_Items].[UOMWeight] = [PAK_Units6].[UnitID]
  LEFT OUTER JOIN [PAK_Items] AS [PAK_Items7]
    ON [PAK_Items].[RootItem] = [PAK_Items7].[ItemNo]
  ORDER BY SN
  SET @RecordCount = @@RowCount
GO
