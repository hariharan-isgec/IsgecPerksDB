USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnApproverChangeRequestUpdate]
  @VerificationRequired Bit,
  @VerifierID NVarChar(8),
  @ApprovalRequired Bit,
  @ApproverID NVarChar(8),
  @Requested Bit,
  @RequestedOn DateTime,
  @Original_RequestID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_ApproverChangeRequest] SET 
   [VerificationRequired] = @VerificationRequired
  ,[VerifierID] = @VerifierID
  ,[ApprovalRequired] = @ApprovalRequired
  ,[ApproverID] = @ApproverID
  ,[Requested] = @Requested
  ,[RequestedOn] = @RequestedOn
  WHERE
  [RequestID] = @Original_RequestID
  SET @RowCount = @@RowCount
GO
