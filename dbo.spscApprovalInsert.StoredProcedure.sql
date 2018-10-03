USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscApprovalInsert]
  @RequestID Int,
  @ApproverID NVarChar(8),
  @StatusID NVarChar(2),
  @ApproverRemarks NVarChar(500),
  @ApprovedOn DateTime,
  @Return_RequestID Int = null OUTPUT, 
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [SC_Approval]
  (
   [RequestID]
  ,[ApproverID]
  ,[StatusID]
  ,[ApproverRemarks]
  ,[ApprovedOn]
  )
  VALUES
  (
   @RequestID
  ,@ApproverID
  ,@StatusID
  ,@ApproverRemarks
  ,@ApprovedOn
  )
  SET @Return_RequestID = @RequestID
  SET @Return_SerialNo = Scope_Identity()
GO
