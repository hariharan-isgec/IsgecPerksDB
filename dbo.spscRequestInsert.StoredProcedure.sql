USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscRequestInsert]
  @CommitteeApprovalRequired Bit,
  @AuditApprovalRequired Bit,
  @PHApprovalRequired Bit,
  @PHApprovalOn DateTime,
  @PHApprovalBy NVarChar(8),
  @PHRemarks NVarChar(500),
  @BHApprovalRequired Bit,
  @BHApprovalOn DateTime,
  @BHApprovalBy NVarChar(8),
  @BHRemarks NVarChar(500),
  @UnitLevelCommittee Bit,
  @Remarks NVarChar(500),
  @MDApprovalRequired Bit,
  @AuditedOn DateTime,
  @RequestRefNo NVarChar(50),
  @MDRemarks NVarChar(500),
  @MDFileName NVarChar(250),
  @FileName NVarChar(250),
  @SubmittedBy NVarChar(8),
  @SubmittedOn DateTime,
  @StatusID NVarChar(2),
  @DiskFileName NVarChar(250),
  @AuditorRemarks NVarChar(500),
  @AuditedBy NVarChar(8),
  @MDDiskFileName NVarChar(250),
  @MDApprovalOn DateTime,
  @MDApprovalBy NVarChar(8),
  @DivisionLevelCommittee Bit,
  @MannualCommittee Bit,
  @Return_RequestID Int = null OUTPUT 
  AS
  INSERT [SC_Request]
  (
   [CommitteeApprovalRequired]
  ,[AuditApprovalRequired]
  ,[PHApprovalRequired]
  ,[PHApprovalOn]
  ,[PHApprovalBy]
  ,[PHRemarks]
  ,[BHApprovalRequired]
  ,[BHApprovalOn]
  ,[BHApprovalBy]
  ,[BHRemarks]
  ,[UnitLevelCommittee]
  ,[Remarks]
  ,[MDApprovalRequired]
  ,[AuditedOn]
  ,[RequestRefNo]
  ,[MDRemarks]
  ,[MDFileName]
  ,[FileName]
  ,[SubmittedBy]
  ,[SubmittedOn]
  ,[StatusID]
  ,[DiskFileName]
  ,[AuditorRemarks]
  ,[AuditedBy]
  ,[MDDiskFileName]
  ,[MDApprovalOn]
  ,[MDApprovalBy]
  ,[DivisionLevelCommittee]
  ,[MannualCommittee]
  )
  VALUES
  (
   @CommitteeApprovalRequired
  ,@AuditApprovalRequired
  ,@PHApprovalRequired
  ,@PHApprovalOn
  ,@PHApprovalBy
  ,@PHRemarks
  ,@BHApprovalRequired
  ,@BHApprovalOn
  ,@BHApprovalBy
  ,@BHRemarks
  ,@UnitLevelCommittee
  ,@Remarks
  ,@MDApprovalRequired
  ,@AuditedOn
  ,@RequestRefNo
  ,@MDRemarks
  ,@MDFileName
  ,@FileName
  ,@SubmittedBy
  ,@SubmittedOn
  ,@StatusID
  ,@DiskFileName
  ,@AuditorRemarks
  ,@AuditedBy
  ,@MDDiskFileName
  ,@MDApprovalOn
  ,@MDApprovalBy
  ,@DivisionLevelCommittee
  ,@MannualCommittee
  )
  SET @Return_RequestID = Scope_Identity()
GO
