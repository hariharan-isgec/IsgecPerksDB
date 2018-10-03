USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakIssueTypesUpdate]
  @Original_IssueTypeID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_IssueTypes] SET 
   [Description] = @Description
  WHERE
  [IssueTypeID] = @Original_IssueTypeID
  SET @RowCount = @@RowCount
GO
