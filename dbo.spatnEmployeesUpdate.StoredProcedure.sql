USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnEmployeesUpdate]
  @VerificationRequired Bit,
  @VerifierID NVarChar(8),
  @ApprovalRequired Bit,
  @ApproverID NVarChar(8),
  @Original_CardNo NVarChar(8), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Employees] SET 
   [VerificationRequired] = @VerificationRequired
  ,[VerifierID] = @VerifierID
  ,[ApprovalRequired] = @ApprovalRequired
  ,[ApproverID] = @ApproverID
  WHERE
  [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
