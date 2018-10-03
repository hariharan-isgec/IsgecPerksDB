USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscRequestUpdate]
  @Original_RequestID Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [SC_Request] SET 
   [CommitteeApprovalRequired] = @CommitteeApprovalRequired
  ,[AuditApprovalRequired] = @AuditApprovalRequired
  ,[PHApprovalRequired] = @PHApprovalRequired
  ,[PHApprovalOn] = @PHApprovalOn
  ,[PHApprovalBy] = @PHApprovalBy
  ,[PHRemarks] = @PHRemarks
  ,[BHApprovalRequired] = @BHApprovalRequired
  ,[BHApprovalOn] = @BHApprovalOn
  ,[BHApprovalBy] = @BHApprovalBy
  ,[BHRemarks] = @BHRemarks
  ,[UnitLevelCommittee] = @UnitLevelCommittee
  ,[Remarks] = @Remarks
  ,[MDApprovalRequired] = @MDApprovalRequired
  ,[AuditedOn] = @AuditedOn
  ,[RequestRefNo] = @RequestRefNo
  ,[MDRemarks] = @MDRemarks
  ,[MDFileName] = @MDFileName
  ,[FileName] = @FileName
  ,[SubmittedBy] = @SubmittedBy
  ,[SubmittedOn] = @SubmittedOn
  ,[StatusID] = @StatusID
  ,[DiskFileName] = @DiskFileName
  ,[AuditorRemarks] = @AuditorRemarks
  ,[AuditedBy] = @AuditedBy
  ,[MDDiskFileName] = @MDDiskFileName
  ,[MDApprovalOn] = @MDApprovalOn
  ,[MDApprovalBy] = @MDApprovalBy
  ,[DivisionLevelCommittee] = @DivisionLevelCommittee
  ,[MannualCommittee] = @MannualCommittee
  WHERE
  [RequestID] = @Original_RequestID
  SET @RowCount = @@RowCount
GO
