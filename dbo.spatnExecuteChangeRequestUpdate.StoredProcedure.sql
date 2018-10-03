USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnExecuteChangeRequestUpdate]
  @Executed Bit,
  @ExecutedOn DateTime,
  @Original_RequestID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_ApproverChangeRequest] SET 
   [Executed] = @Executed
  ,[ExecutedOn] = @ExecutedOn
  WHERE
  [RequestID] = @Original_RequestID
  SET @RowCount = @@RowCount
GO
