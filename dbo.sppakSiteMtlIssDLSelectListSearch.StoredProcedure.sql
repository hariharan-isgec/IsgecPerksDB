USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteMtlIssDLSelectListSearch]
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
 ,ProjectID NVarChar(6) NOT NULL
 ,IssueNo Int NOT NULL
 ,IssueSrNo Int NOT NULL
 ,IssueSrLNo Int NOT NULL
  )
  INSERT INTO #PageIndex (ProjectID, IssueNo, IssueSrNo, IssueSrLNo)
  SELECT [PAK_SiteIssueDLocation].[ProjectID], [PAK_SiteIssueDLocation].[IssueNo], [PAK_SiteIssueDLocation].[IssueSrNo], [PAK_SiteIssueDLocation].[IssueSrLNo] FROM [PAK_SiteIssueDLocation]
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
   ( 
         STR(ISNULL([PAK_SiteIssueDLocation].[IssueSrLNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_SiteIssueDLocation].[SiteMarkNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SiteIssueDLocation].[LocationID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SiteIssueDLocation].[UOMQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SiteIssueDLocation].[QuantityAvailable], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SiteIssueDLocation].[QuantityIssued], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SiteIssueDLocation].[IssueNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_SiteIssueDLocation].[ProjectID],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SiteIssueDLocation].[IssueSrNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_SiteIssueDLocation].[Remarks],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [PAK_SiteIssueDLocation].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [PAK_SiteIssueDLocation].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'IssueNo' THEN [PAK_SiteIssueDLocation].[IssueNo] END,
     CASE @OrderBy WHEN 'IssueNo DESC' THEN [PAK_SiteIssueDLocation].[IssueNo] END DESC,
     CASE @OrderBy WHEN 'IssueSrNo' THEN [PAK_SiteIssueDLocation].[IssueSrNo] END,
     CASE @OrderBy WHEN 'IssueSrNo DESC' THEN [PAK_SiteIssueDLocation].[IssueSrNo] END DESC,
     CASE @OrderBy WHEN 'IssueSrLNo' THEN [PAK_SiteIssueDLocation].[IssueSrLNo] END,
     CASE @OrderBy WHEN 'IssueSrLNo DESC' THEN [PAK_SiteIssueDLocation].[IssueSrLNo] END DESC,
     CASE @OrderBy WHEN 'SiteMarkNo' THEN [PAK_SiteIssueDLocation].[SiteMarkNo] END,
     CASE @OrderBy WHEN 'SiteMarkNo DESC' THEN [PAK_SiteIssueDLocation].[SiteMarkNo] END DESC,
     CASE @OrderBy WHEN 'QuantityIssued' THEN [PAK_SiteIssueDLocation].[QuantityIssued] END,
     CASE @OrderBy WHEN 'QuantityIssued DESC' THEN [PAK_SiteIssueDLocation].[QuantityIssued] END DESC,
     CASE @OrderBy WHEN 'LocationID' THEN [PAK_SiteIssueDLocation].[LocationID] END,
     CASE @OrderBy WHEN 'LocationID DESC' THEN [PAK_SiteIssueDLocation].[LocationID] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [PAK_SiteIssueDLocation].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [PAK_SiteIssueDLocation].[Remarks] END DESC,
     CASE @OrderBy WHEN 'Support' THEN [PAK_SiteIssueDLocation].[Support] END,
     CASE @OrderBy WHEN 'Support DESC' THEN [PAK_SiteIssueDLocation].[Support] END DESC,
     CASE @OrderBy WHEN 'UOMQuantity' THEN [PAK_SiteIssueDLocation].[UOMQuantity] END,
     CASE @OrderBy WHEN 'UOMQuantity DESC' THEN [PAK_SiteIssueDLocation].[UOMQuantity] END DESC,
     CASE @OrderBy WHEN 'QuantityAvailable' THEN [PAK_SiteIssueDLocation].[QuantityAvailable] END,
     CASE @OrderBy WHEN 'QuantityAvailable DESC' THEN [PAK_SiteIssueDLocation].[QuantityAvailable] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects1_Description' THEN [IDM_Projects1].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects1_Description DESC' THEN [IDM_Projects1].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_SiteIssueD2_SiteMarkNo' THEN [PAK_SiteIssueD2].[SiteMarkNo] END,
     CASE @OrderBy WHEN 'PAK_SiteIssueD2_SiteMarkNo DESC' THEN [PAK_SiteIssueD2].[SiteMarkNo] END DESC,
     CASE @OrderBy WHEN 'PAK_SiteIssueH3_RequesterRemarks' THEN [PAK_SiteIssueH3].[RequesterRemarks] END,
     CASE @OrderBy WHEN 'PAK_SiteIssueH3_RequesterRemarks DESC' THEN [PAK_SiteIssueH3].[RequesterRemarks] END DESC,
     CASE @OrderBy WHEN 'PAK_SiteItemMaster4_ItemDescription' THEN [PAK_SiteItemMaster4].[ItemDescription] END,
     CASE @OrderBy WHEN 'PAK_SiteItemMaster4_ItemDescription DESC' THEN [PAK_SiteItemMaster4].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'PAK_SiteLocations5_Description' THEN [PAK_SiteLocations5].[Description] END,
     CASE @OrderBy WHEN 'PAK_SiteLocations5_Description DESC' THEN [PAK_SiteLocations5].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Units6_Description' THEN [PAK_Units6].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units6_Description DESC' THEN [PAK_Units6].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PAK_SiteIssueDLocation].* ,
    [IDM_Projects1].[Description] AS IDM_Projects1_Description,
    [PAK_SiteIssueD2].[SiteMarkNo] AS PAK_SiteIssueD2_SiteMarkNo,
    [PAK_SiteIssueH3].[RequesterRemarks] AS PAK_SiteIssueH3_RequesterRemarks,
    [PAK_SiteItemMaster4].[ItemDescription] AS PAK_SiteItemMaster4_ItemDescription,
    [PAK_SiteLocations5].[Description] AS PAK_SiteLocations5_Description,
    [PAK_Units6].[Description] AS PAK_Units6_Description 
  FROM [PAK_SiteIssueDLocation] 
      INNER JOIN #PageIndex
          ON [PAK_SiteIssueDLocation].[ProjectID] = #PageIndex.ProjectID
          AND [PAK_SiteIssueDLocation].[IssueNo] = #PageIndex.IssueNo
          AND [PAK_SiteIssueDLocation].[IssueSrNo] = #PageIndex.IssueSrNo
          AND [PAK_SiteIssueDLocation].[IssueSrLNo] = #PageIndex.IssueSrLNo
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
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
