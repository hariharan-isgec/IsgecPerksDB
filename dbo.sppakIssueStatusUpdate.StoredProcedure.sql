USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakIssueStatusUpdate]
  @Original_IssueStatusID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_IssueStatus] SET 
   [Description] = @Description
  WHERE
  [IssueStatusID] = @Original_IssueStatusID
  SET @RowCount = @@RowCount
GO
