USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteIssRecDSelectListFilteres]
  @Filter_IssueNo Int,
  @Filter_ProjectID NVarChar(6),
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
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ', IssueNo'
  SET @LGSQL = @LGSQL + ', IssueSrNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_SiteIssueD].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [PAK_SiteIssueD].[IssueNo]'
  SET @LGSQL = @LGSQL + ', [PAK_SiteIssueD].[IssueSrNo]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_SiteIssueD] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteIssueD].[ProjectID] = [IDM_Projects1].[ProjectID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_SiteIssueH] AS [PAK_SiteIssueH2]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteIssueD].[ProjectID] = [PAK_SiteIssueH2].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SiteIssueD].[IssueNo] = [PAK_SiteIssueH2].[IssueNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_SiteItemMaster] AS [PAK_SiteItemMaster3]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteIssueD].[ProjectID] = [PAK_SiteItemMaster3].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SiteIssueD].[SiteMarkNo] = [PAK_SiteItemMaster3].[SiteMarkNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units4]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteIssueD].[UOMQuantity] = [PAK_Units4].[UnitID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_IssueNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_SiteIssueD].[IssueNo] = ' + STR(@Filter_IssueNo)
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [PAK_SiteIssueD].[ProjectID] = ''' + @Filter_ProjectID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[PAK_SiteIssueD].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[PAK_SiteIssueD].[ProjectID] DESC'
                        WHEN 'IssueNo' THEN '[PAK_SiteIssueD].[IssueNo]'
                        WHEN 'IssueNo DESC' THEN '[PAK_SiteIssueD].[IssueNo] DESC'
                        WHEN 'IssueSrNo' THEN '[PAK_SiteIssueD].[IssueSrNo]'
                        WHEN 'IssueSrNo DESC' THEN '[PAK_SiteIssueD].[IssueSrNo] DESC'
                        WHEN 'SiteMarkNo' THEN '[PAK_SiteIssueD].[SiteMarkNo]'
                        WHEN 'SiteMarkNo DESC' THEN '[PAK_SiteIssueD].[SiteMarkNo] DESC'
                        WHEN 'QuantityRequired' THEN '[PAK_SiteIssueD].[QuantityRequired]'
                        WHEN 'QuantityRequired DESC' THEN '[PAK_SiteIssueD].[QuantityRequired] DESC'
                        WHEN 'Remarks' THEN '[PAK_SiteIssueD].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[PAK_SiteIssueD].[Remarks] DESC'
                        WHEN 'IssuerRemarks' THEN '[PAK_SiteIssueD].[IssuerRemarks]'
                        WHEN 'IssuerRemarks DESC' THEN '[PAK_SiteIssueD].[IssuerRemarks] DESC'
                        WHEN 'UOMQuantity' THEN '[PAK_SiteIssueD].[UOMQuantity]'
                        WHEN 'UOMQuantity DESC' THEN '[PAK_SiteIssueD].[UOMQuantity] DESC'
                        WHEN 'QuantityIssued' THEN '[PAK_SiteIssueD].[QuantityIssued]'
                        WHEN 'QuantityIssued DESC' THEN '[PAK_SiteIssueD].[QuantityIssued] DESC'
                        WHEN 'IDM_Projects1_Description' THEN '[IDM_Projects1].[Description]'
                        WHEN 'IDM_Projects1_Description DESC' THEN '[IDM_Projects1].[Description] DESC'
                        WHEN 'PAK_SiteIssueH2_RequesterRemarks' THEN '[PAK_SiteIssueH2].[RequesterRemarks]'
                        WHEN 'PAK_SiteIssueH2_RequesterRemarks DESC' THEN '[PAK_SiteIssueH2].[RequesterRemarks] DESC'
                        WHEN 'PAK_SiteItemMaster3_ItemDescription' THEN '[PAK_SiteItemMaster3].[ItemDescription]'
                        WHEN 'PAK_SiteItemMaster3_ItemDescription DESC' THEN '[PAK_SiteItemMaster3].[ItemDescription] DESC'
                        WHEN 'PAK_Units4_Description' THEN '[PAK_Units4].[Description]'
                        WHEN 'PAK_Units4_Description DESC' THEN '[PAK_Units4].[Description] DESC'
                        ELSE '[PAK_SiteIssueD].[ProjectID],[PAK_SiteIssueD].[IssueNo],[PAK_SiteIssueD].[IssueSrNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_SiteIssueD].* ,
    [IDM_Projects1].[Description] AS IDM_Projects1_Description,
    [PAK_SiteIssueH2].[RequesterRemarks] AS PAK_SiteIssueH2_RequesterRemarks,
    [PAK_SiteItemMaster3].[ItemDescription] AS PAK_SiteItemMaster3_ItemDescription,
    [PAK_Units4].[Description] AS PAK_Units4_Description 
  FROM [PAK_SiteIssueD] 
      INNER JOIN #PageIndex
          ON [PAK_SiteIssueD].[ProjectID] = #PageIndex.ProjectID
          AND [PAK_SiteIssueD].[IssueNo] = #PageIndex.IssueNo
          AND [PAK_SiteIssueD].[IssueSrNo] = #PageIndex.IssueSrNo
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
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
