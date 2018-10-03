USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteIssRecDDelete]
  @Original_ProjectID NVarChar(6),
  @Original_IssueNo Int,
  @Original_IssueSrNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_SiteIssueD]
  WHERE
  [PAK_SiteIssueD].[ProjectID] = @Original_ProjectID
  AND [PAK_SiteIssueD].[IssueNo] = @Original_IssueNo
  AND [PAK_SiteIssueD].[IssueSrNo] = @Original_IssueSrNo
  SET @RowCount = @@RowCount
GO
