USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteMtlIssDLSelectByID]
  @LoginID NVarChar(8),
  @ProjectID NVarChar(6),
  @IssueNo Int,
  @IssueSrNo Int,
  @IssueSrLNo Int 
  AS
  SELECT
    [PAK_SiteIssueDLocation].* ,
    [IDM_Projects1].[Description] AS IDM_Projects1_Description,
    [PAK_SiteIssueD2].[SiteMarkNo] AS PAK_SiteIssueD2_SiteMarkNo,
    [PAK_SiteIssueH3].[RequesterRemarks] AS PAK_SiteIssueH3_RequesterRemarks,
    [PAK_SiteItemMaster4].[ItemDescription] AS PAK_SiteItemMaster4_ItemDescription,
    [PAK_SiteLocations5].[Description] AS PAK_SiteLocations5_Description,
    [PAK_Units6].[Description] AS PAK_Units6_Description 
  FROM [PAK_SiteIssueDLocation] 
  INNER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [PAK_SiteIssueDLocation].[ProjectID] = [IDM_Projects1].[ProjectID]
  INNER JOIN [PAK_SiteIssueD] AS [PAK_SiteIssueD2]
    ON [PAK_SiteIssueDLocation].[ProjectID] = [PAK_SiteIssueD2].[ProjectID]
    AND [PAK_SiteIssueDLocation].[IssueNo] = [PAK_SiteIssueD2].[IssueNo]
    AND [PAK_SiteIssueDLocation].[IssueSrNo] = [PAK_SiteIssueD2].[IssueSrNo]
  INNER JOIN [PAK_SiteIssueH] AS [PAK_SiteIssueH3]
    ON [PAK_SiteIssueDLocation].[ProjectID] = [PAK_SiteIssueH3].[ProjectID]
    AND [PAK_SiteIssueDLocation].[IssueNo] = [PAK_SiteIssueH3].[IssueNo]
  INNER JOIN [PAK_SiteItemMaster] AS [PAK_SiteItemMaster4]
    ON [PAK_SiteIssueDLocation].[ProjectID] = [PAK_SiteItemMaster4].[ProjectID]
    AND [PAK_SiteIssueDLocation].[SiteMarkNo] = [PAK_SiteItemMaster4].[SiteMarkNo]
  INNER JOIN [PAK_SiteLocations] AS [PAK_SiteLocations5]
    ON [PAK_SiteIssueDLocation].[LocationID] = [PAK_SiteLocations5].[LocationID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units6]
    ON [PAK_SiteIssueDLocation].[UOMQuantity] = [PAK_Units6].[UnitID]
  WHERE
  [PAK_SiteIssueDLocation].[ProjectID] = @ProjectID
  AND [PAK_SiteIssueDLocation].[IssueNo] = @IssueNo
  AND [PAK_SiteIssueDLocation].[IssueSrNo] = @IssueSrNo
  AND [PAK_SiteIssueDLocation].[IssueSrLNo] = @IssueSrLNo
GO
