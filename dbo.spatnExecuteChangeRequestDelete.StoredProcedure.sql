USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnExecuteChangeRequestDelete]
  @Original_RequestID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_ApproverChangeRequest]
  WHERE
  [ATN_ApproverChangeRequest].[RequestID] = @Original_RequestID
  SET @RowCount = @@RowCount
GO
