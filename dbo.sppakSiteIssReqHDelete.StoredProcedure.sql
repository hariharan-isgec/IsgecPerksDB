USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteIssReqHDelete]
  @Original_ProjectID NVarChar(6),
  @Original_IssueNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_SiteIssueH]
  WHERE
  [PAK_SiteIssueH].[ProjectID] = @Original_ProjectID
  AND [PAK_SiteIssueH].[IssueNo] = @Original_IssueNo
  SET @RowCount = @@RowCount
GO
