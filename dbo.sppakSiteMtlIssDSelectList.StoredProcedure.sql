USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteMtlIssDSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_SiteIssueD].* ,
    [IDM_Projects1].[Description] AS IDM_Projects1_Description,
    [PAK_SiteIssueH2].[RequesterRemarks] AS PAK_SiteIssueH2_RequesterRemarks,
    [PAK_SiteItemMaster3].[ItemDescription] AS PAK_SiteItemMaster3_ItemDescription,
    [PAK_Units4].[Description] AS PAK_Units4_Description 
  FROM [PAK_SiteIssueD] 
  INNER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [PAK_SiteIssueD].[ProjectID] = [IDM_Projects1].[ProjectID]
  INNER JOIN [PAK_SiteIssueH] AS [PAK_SiteIssueH2]
    ON [PAK_SiteIssueD].[ProjectID] = [PAK_SiteIssueH2].[ProjectID]
    AND [PAK_SiteIssueD].[IssueNo] = [PAK_SiteIssueH2].[IssueNo]
  INNER JOIN [PAK_SiteItemMaster] AS [PAK_SiteItemMaster3]
    ON [PAK_SiteIssueD].[ProjectID] = [PAK_SiteItemMaster3].[ProjectID]
    AND [PAK_SiteIssueD].[SiteMarkNo] = [PAK_SiteItemMaster3].[SiteMarkNo]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units4]
    ON [PAK_SiteIssueD].[UOMQuantity] = [PAK_Units4].[UnitID]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [PAK_SiteIssueD].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [PAK_SiteIssueD].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'IssueNo' THEN [PAK_SiteIssueD].[IssueNo] END,
     CASE @OrderBy WHEN 'IssueNo DESC' THEN [PAK_SiteIssueD].[IssueNo] END DESC,
     CASE @OrderBy WHEN 'IssueSrNo' THEN [PAK_SiteIssueD].[IssueSrNo] END,
     CASE @OrderBy WHEN 'IssueSrNo DESC' THEN [PAK_SiteIssueD].[IssueSrNo] END DESC,
     CASE @OrderBy WHEN 'SiteMarkNo' THEN [PAK_SiteIssueD].[SiteMarkNo] END,
     CASE @OrderBy WHEN 'SiteMarkNo DESC' THEN [PAK_SiteIssueD].[SiteMarkNo] END DESC,
     CASE @OrderBy WHEN 'QuantityRequired' THEN [PAK_SiteIssueD].[QuantityRequired] END,
     CASE @OrderBy WHEN 'QuantityRequired DESC' THEN [PAK_SiteIssueD].[QuantityRequired] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [PAK_SiteIssueD].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [PAK_SiteIssueD].[Remarks] END DESC,
     CASE @OrderBy WHEN 'IssuerRemarks' THEN [PAK_SiteIssueD].[IssuerRemarks] END,
     CASE @OrderBy WHEN 'IssuerRemarks DESC' THEN [PAK_SiteIssueD].[IssuerRemarks] END DESC,
     CASE @OrderBy WHEN 'UOMQuantity' THEN [PAK_SiteIssueD].[UOMQuantity] END,
     CASE @OrderBy WHEN 'UOMQuantity DESC' THEN [PAK_SiteIssueD].[UOMQuantity] END DESC,
     CASE @OrderBy WHEN 'QuantityIssued' THEN [PAK_SiteIssueD].[QuantityIssued] END,
     CASE @OrderBy WHEN 'QuantityIssued DESC' THEN [PAK_SiteIssueD].[QuantityIssued] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects1_Description' THEN [IDM_Projects1].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects1_Description DESC' THEN [IDM_Projects1].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_SiteIssueH2_RequesterRemarks' THEN [PAK_SiteIssueH2].[RequesterRemarks] END,
     CASE @OrderBy WHEN 'PAK_SiteIssueH2_RequesterRemarks DESC' THEN [PAK_SiteIssueH2].[RequesterRemarks] END DESC,
     CASE @OrderBy WHEN 'PAK_SiteItemMaster3_ItemDescription' THEN [PAK_SiteItemMaster3].[ItemDescription] END,
     CASE @OrderBy WHEN 'PAK_SiteItemMaster3_ItemDescription DESC' THEN [PAK_SiteItemMaster3].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'PAK_Units4_Description' THEN [PAK_Units4].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units4_Description DESC' THEN [PAK_Units4].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
