USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnApproverChangeRequestInsert]
  @UserID NVarChar(8),
  @VerificationRequired Bit,
  @VerifierID NVarChar(8),
  @ApprovalRequired Bit,
  @ApproverID NVarChar(8),
  @Requested Bit,
  @RequestedOn DateTime,
  @Return_RequestID Int = null OUTPUT
  AS
  INSERT [ATN_ApproverChangeRequest]
  (
   [UserID]
  ,[VerificationRequired]
  ,[VerifierID]
  ,[ApprovalRequired]
  ,[ApproverID]
  ,[Requested]
  ,[RequestedOn]
  )
  VALUES
  (
   @UserID
  ,@VerificationRequired
  ,@VerifierID
  ,@ApprovalRequired
  ,@ApproverID
  ,@Requested
  ,@RequestedOn
  )
  SET @Return_RequestID = Scope_Identity()
GO
