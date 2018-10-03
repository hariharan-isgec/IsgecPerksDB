USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteIssRecDSelectByID]
  @LoginID NVarChar(8),
  @ProjectID NVarChar(6),
  @IssueNo Int,
  @IssueSrNo Int 
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
  WHERE
  [PAK_SiteIssueD].[ProjectID] = @ProjectID
  AND [PAK_SiteIssueD].[IssueNo] = @IssueNo
  AND [PAK_SiteIssueD].[IssueSrNo] = @IssueSrNo
GO
