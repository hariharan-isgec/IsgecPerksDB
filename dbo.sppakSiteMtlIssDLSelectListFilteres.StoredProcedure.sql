USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteMtlIssDLSelectListFilteres]
  @Filter_IssueNo Int,
  @Filter_ProjectID NVarChar(6),
  @Filter_IssueSrNo Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,IssueNo Int NOT NULL
 ,IssueSrNo Int NOT NULL
 ,IssueSrLNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ', IssueNo'
  SET @LGSQL = @LGSQL + ', IssueSrNo'
  SET @LGSQL = @LGSQL + ', IssueSrLNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_SiteIssueDLocation].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [PAK_SiteIssueDLocation].[IssueNo]'
  SET @LGSQL = @LGSQL + ', [PAK_SiteIssueDLocation].[IssueSrNo]'
  SET @LGSQL = @LGSQL + ', [PAK_SiteIssueDLocation].[IssueSrLNo]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_SiteIssueDLocation] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteIssueDLocation].[ProjectID] = [IDM_Projects1].[ProjectID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_SiteIssueD] AS [PAK_SiteIssueD2]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteIssueDLocation].[ProjectID] = [PAK_SiteIssueD2].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SiteIssueDLocation].[IssueNo] = [PAK_SiteIssueD2].[IssueNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SiteIssueDLocation].[IssueSrNo] = [PAK_SiteIssueD2].[IssueSrNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_SiteIssueH] AS [PAK_SiteIssueH3]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteIssueDLocation].[ProjectID] = [PAK_SiteIssueH3].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SiteIssueDLocation].[IssueNo] = [PAK_SiteIssueH3].[IssueNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_SiteItemMaster] AS [PAK_SiteItemMaster4]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteIssueDLocation].[ProjectID] = [PAK_SiteItemMaster4].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SiteIssueDLocation].[SiteMarkNo] = [PAK_SiteItemMaster4].[SiteMarkNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_SiteLocations] AS [PAK_SiteLocations5]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteIssueDLocation].[LocationID] = [PAK_SiteLocations5].[LocationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units6]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteIssueDLocation].[UOMQuantity] = [PAK_Units6].[UnitID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_IssueNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_SiteIssueDLocation].[IssueNo] = ' + STR(@Filter_IssueNo)
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [PAK_SiteIssueDLocation].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_IssueSrNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_SiteIssueDLocation].[IssueSrNo] = ' + STR(@Filter_IssueSrNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[PAK_SiteIssueDLocation].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[PAK_SiteIssueDLocation].[ProjectID] DESC'
                        WHEN 'IssueNo' THEN '[PAK_SiteIssueDLocation].[IssueNo]'
                        WHEN 'IssueNo DESC' THEN '[PAK_SiteIssueDLocation].[IssueNo] DESC'
                        WHEN 'IssueSrNo' THEN '[PAK_SiteIssueDLocation].[IssueSrNo]'
                        WHEN 'IssueSrNo DESC' THEN '[PAK_SiteIssueDLocation].[IssueSrNo] DESC'
                        WHEN 'IssueSrLNo' THEN '[PAK_SiteIssueDLocation].[IssueSrLNo]'
                        WHEN 'IssueSrLNo DESC' THEN '[PAK_SiteIssueDLocation].[IssueSrLNo] DESC'
                        WHEN 'SiteMarkNo' THEN '[PAK_SiteIssueDLocation].[SiteMarkNo]'
                        WHEN 'SiteMarkNo DESC' THEN '[PAK_SiteIssueDLocation].[SiteMarkNo] DESC'
                        WHEN 'QuantityIssued' THEN '[PAK_SiteIssueDLocation].[QuantityIssued]'
                        WHEN 'QuantityIssued DESC' THEN '[PAK_SiteIssueDLocation].[QuantityIssued] DESC'
                        WHEN 'LocationID' THEN '[PAK_SiteIssueDLocation].[LocationID]'
                        WHEN 'LocationID DESC' THEN '[PAK_SiteIssueDLocation].[LocationID] DESC'
                        WHEN 'Remarks' THEN '[PAK_SiteIssueDLocation].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[PAK_SiteIssueDLocation].[Remarks] DESC'
                        WHEN 'Support' THEN '[PAK_SiteIssueDLocation].[Support]'
                        WHEN 'Support DESC' THEN '[PAK_SiteIssueDLocation].[Support] DESC'
                        WHEN 'UOMQuantity' THEN '[PAK_SiteIssueDLocation].[UOMQuantity]'
                        WHEN 'UOMQuantity DESC' THEN '[PAK_SiteIssueDLocation].[UOMQuantity] DESC'
                        WHEN 'QuantityAvailable' THEN '[PAK_SiteIssueDLocation].[QuantityAvailable]'
                        WHEN 'QuantityAvailable DESC' THEN '[PAK_SiteIssueDLocation].[QuantityAvailable] DESC'
                        WHEN 'IDM_Projects1_Description' THEN '[IDM_Projects1].[Description]'
                        WHEN 'IDM_Projects1_Description DESC' THEN '[IDM_Projects1].[Description] DESC'
                        WHEN 'PAK_SiteIssueD2_SiteMarkNo' THEN '[PAK_SiteIssueD2].[SiteMarkNo]'
                        WHEN 'PAK_SiteIssueD2_SiteMarkNo DESC' THEN '[PAK_SiteIssueD2].[SiteMarkNo] DESC'
                        WHEN 'PAK_SiteIssueH3_RequesterRemarks' THEN '[PAK_SiteIssueH3].[RequesterRemarks]'
                        WHEN 'PAK_SiteIssueH3_RequesterRemarks DESC' THEN '[PAK_SiteIssueH3].[RequesterRemarks] DESC'
                        WHEN 'PAK_SiteItemMaster4_ItemDescription' THEN '[PAK_SiteItemMaster4].[ItemDescription]'
                        WHEN 'PAK_SiteItemMaster4_ItemDescription DESC' THEN '[PAK_SiteItemMaster4].[ItemDescription] DESC'
                        WHEN 'PAK_SiteLocations5_Description' THEN '[PAK_SiteLocations5].[Description]'
                        WHEN 'PAK_SiteLocations5_Description DESC' THEN '[PAK_SiteLocations5].[Description] DESC'
                        WHEN 'PAK_Units6_Description' THEN '[PAK_Units6].[Description]'
                        WHEN 'PAK_Units6_Description DESC' THEN '[PAK_Units6].[Description] DESC'
                        ELSE '[PAK_SiteIssueDLocation].[ProjectID],[PAK_SiteIssueDLocation].[IssueNo],[PAK_SiteIssueDLocation].[IssueSrNo],[PAK_SiteIssueDLocation].[IssueSrLNo]'
                    END
  EXEC (@LGSQL)

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
