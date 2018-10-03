USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakIssueStatusDelete]
  @Original_IssueStatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_IssueStatus]
  WHERE
  [PAK_IssueStatus].[IssueStatusID] = @Original_IssueStatusID
  SET @RowCount = @@RowCount
GO
