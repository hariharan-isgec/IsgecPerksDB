USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakItemsSelectListFilteres]
  @Filter_RootItem Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @Root Bit,
  @DivisionID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ItemNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ItemNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_Items].[ItemNo]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_Items] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Divisions] AS [PAK_Divisions1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_Items].[DivisionID] = [PAK_Divisions1].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Documents] AS [PAK_Documents2]'
  SET @LGSQL = @LGSQL + '    ON [PAK_Items].[DocumentNo] = [PAK_Documents2].[DocumentNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Elements] AS [PAK_Elements3]'
  SET @LGSQL = @LGSQL + '    ON [PAK_Items].[ElementID] = [PAK_Elements3].[ElementID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Items] AS [PAK_Items4]'
  SET @LGSQL = @LGSQL + '    ON [PAK_Items].[ParentItemNo] = [PAK_Items4].[ItemNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units5]'
  SET @LGSQL = @LGSQL + '    ON [PAK_Items].[UOMQuantity] = [PAK_Units5].[UnitID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units6]'
  SET @LGSQL = @LGSQL + '    ON [PAK_Items].[UOMWeight] = [PAK_Units6].[UnitID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Items] AS [PAK_Items7]'
  SET @LGSQL = @LGSQL + '    ON [PAK_Items].[RootItem] = [PAK_Items7].[ItemNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [PAK_Items].[Root] = ''' + CONVERT(NVarChar(10), @Root) + ''''
  IF (@DivisionID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_Items].[DivisionID] = ''' + STR(@DivisionID) + '''' 
  IF (@Filter_RootItem > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_Items].[RootItem] = ' + STR(@Filter_RootItem)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ItemNo' THEN '[PAK_Items].[ItemNo]'
                        WHEN 'ItemNo DESC' THEN '[PAK_Items].[ItemNo] DESC'
                        WHEN 'ItemCode' THEN '[PAK_Items].[ItemCode]'
                        WHEN 'ItemCode DESC' THEN '[PAK_Items].[ItemCode] DESC'
                        WHEN 'ItemDescription' THEN '[PAK_Items].[ItemDescription]'
                        WHEN 'ItemDescription DESC' THEN '[PAK_Items].[ItemDescription] DESC'
                        WHEN 'ElementID' THEN '[PAK_Items].[ElementID]'
                        WHEN 'ElementID DESC' THEN '[PAK_Items].[ElementID] DESC'
                        WHEN 'Active' THEN '[PAK_Items].[Active]'
                        WHEN 'Active DESC' THEN '[PAK_Items].[Active] DESC'
                        WHEN 'Quantity' THEN '[PAK_Items].[Quantity]'
                        WHEN 'Quantity DESC' THEN '[PAK_Items].[Quantity] DESC'
                        WHEN 'UOMWeight' THEN '[PAK_Items].[UOMWeight]'
                        WHEN 'UOMWeight DESC' THEN '[PAK_Items].[UOMWeight] DESC'
                        WHEN 'Root' THEN '[PAK_Items].[Root]'
                        WHEN 'Root DESC' THEN '[PAK_Items].[Root] DESC'
                        WHEN 'UOMQuantity' THEN '[PAK_Items].[UOMQuantity]'
                        WHEN 'UOMQuantity DESC' THEN '[PAK_Items].[UOMQuantity] DESC'
                        WHEN 'ParentItemNo' THEN '[PAK_Items].[ParentItemNo]'
                        WHEN 'ParentItemNo DESC' THEN '[PAK_Items].[ParentItemNo] DESC'
                        WHEN 'WeightPerUnit' THEN '[PAK_Items].[WeightPerUnit]'
                        WHEN 'WeightPerUnit DESC' THEN '[PAK_Items].[WeightPerUnit] DESC'
                        WHEN 'Bottom' THEN '[PAK_Items].[Bottom]'
                        WHEN 'Bottom DESC' THEN '[PAK_Items].[Bottom] DESC'
                        WHEN 'Middle' THEN '[PAK_Items].[Middle]'
                        WHEN 'Middle DESC' THEN '[PAK_Items].[Middle] DESC'
                        WHEN 'RootItem' THEN '[PAK_Items].[RootItem]'
                        WHEN 'RootItem DESC' THEN '[PAK_Items].[RootItem] DESC'
                        WHEN 'DivisionID' THEN '[PAK_Items].[DivisionID]'
                        WHEN 'DivisionID DESC' THEN '[PAK_Items].[DivisionID] DESC'
                        WHEN 'Free' THEN '[PAK_Items].[Free]'
                        WHEN 'Free DESC' THEN '[PAK_Items].[Free] DESC'
                        WHEN 'ItemLevel' THEN '[PAK_Items].[ItemLevel]'
                        WHEN 'ItemLevel DESC' THEN '[PAK_Items].[ItemLevel] DESC'
                        WHEN 'Prefix' THEN '[PAK_Items].[Prefix]'
                        WHEN 'Prefix DESC' THEN '[PAK_Items].[Prefix] DESC'
                        WHEN 'DocumentNo' THEN '[PAK_Items].[DocumentNo]'
                        WHEN 'DocumentNo DESC' THEN '[PAK_Items].[DocumentNo] DESC'
                        WHEN 'PAK_Divisions1_Description' THEN '[PAK_Divisions1].[Description]'
                        WHEN 'PAK_Divisions1_Description DESC' THEN '[PAK_Divisions1].[Description] DESC'
                        WHEN 'PAK_Documents2_cmba' THEN '[PAK_Documents2].[cmba]'
                        WHEN 'PAK_Documents2_cmba DESC' THEN '[PAK_Documents2].[cmba] DESC'
                        WHEN 'PAK_Elements3_Description' THEN '[PAK_Elements3].[Description]'
                        WHEN 'PAK_Elements3_Description DESC' THEN '[PAK_Elements3].[Description] DESC'
                        WHEN 'PAK_Items4_ItemDescription' THEN '[PAK_Items4].[ItemDescription]'
                        WHEN 'PAK_Items4_ItemDescription DESC' THEN '[PAK_Items4].[ItemDescription] DESC'
                        WHEN 'PAK_Units5_Description' THEN '[PAK_Units5].[Description]'
                        WHEN 'PAK_Units5_Description DESC' THEN '[PAK_Units5].[Description] DESC'
                        WHEN 'PAK_Units6_Description' THEN '[PAK_Units6].[Description]'
                        WHEN 'PAK_Units6_Description DESC' THEN '[PAK_Units6].[Description] DESC'
                        WHEN 'PAK_Items7_ItemDescription' THEN '[PAK_Items7].[ItemDescription]'
                        WHEN 'PAK_Items7_ItemDescription DESC' THEN '[PAK_Items7].[ItemDescription] DESC'
                        ELSE '[PAK_Items].[ItemNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_Items].* ,
    [PAK_Divisions1].[Description] AS PAK_Divisions1_Description,
    [PAK_Documents2].[cmba] AS PAK_Documents2_cmba,
    [PAK_Elements3].[Description] AS PAK_Elements3_Description,
    [PAK_Items4].[ItemDescription] AS PAK_Items4_ItemDescription,
    [PAK_Units5].[Description] AS PAK_Units5_Description,
    [PAK_Units6].[Description] AS PAK_Units6_Description,
    [PAK_Items7].[ItemDescription] AS PAK_Items7_ItemDescription 
  FROM [PAK_Items] 
      INNER JOIN #PageIndex
          ON [PAK_Items].[ItemNo] = #PageIndex.ItemNo
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
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
