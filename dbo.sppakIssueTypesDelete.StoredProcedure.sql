USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakIssueTypesDelete]
  @Original_IssueTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_IssueTypes]
  WHERE
  [PAK_IssueTypes].[IssueTypeID] = @Original_IssueTypeID
  SET @RowCount = @@RowCount
GO
