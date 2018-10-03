USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteMtlIssDLDelete]
  @Original_ProjectID NVarChar(6),
  @Original_IssueNo Int,
  @Original_IssueSrNo Int,
  @Original_IssueSrLNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_SiteIssueDLocation]
  WHERE
  [PAK_SiteIssueDLocation].[ProjectID] = @Original_ProjectID
  AND [PAK_SiteIssueDLocation].[IssueNo] = @Original_IssueNo
  AND [PAK_SiteIssueDLocation].[IssueSrNo] = @Original_IssueSrNo
  AND [PAK_SiteIssueDLocation].[IssueSrLNo] = @Original_IssueSrLNo
  SET @RowCount = @@RowCount
GO
