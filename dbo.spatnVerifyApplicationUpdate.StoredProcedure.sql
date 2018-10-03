USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnVerifyApplicationUpdate]
  @ApplStatusID Int,
  @VerificationRemark NVarChar(100),
  @VerificationOn DateTime,
  @Original_LeaveApplID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_ApplHeader] SET 
   [ApplStatusID] = @ApplStatusID
  ,[VerificationRemark] = @VerificationRemark
  ,[VerificationOn] = @VerificationOn
  WHERE
  [LeaveApplID] = @Original_LeaveApplID
  SET @RowCount = @@RowCount
GO
