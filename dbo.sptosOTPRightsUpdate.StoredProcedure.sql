USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOTPRightsUpdate]
  @Original_UserID NVarChar(8), 
  @Original_ProjectID NVarChar(6), 
  @UserID NVarChar(8),
  @ProjectID NVarChar(6),
  @CLPView Bit,
  @OTPView Bit,
  @CanEnterCLPNotes Bit,
  @CanSendCLPAlerts Bit,
  @CanCreateCLPRevision Bit,
  @CanEnterOTPProgress Bit,
  @CanChangePlanning Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TOS_UserViews] SET 
   [UserID] = @UserID
  ,[ProjectID] = @ProjectID
  ,[CLPView] = @CLPView
  ,[OTPView] = @OTPView
  ,[CanEnterCLPNotes] = @CanEnterCLPNotes
  ,[CanSendCLPAlerts] = @CanSendCLPAlerts
  ,[CanCreateCLPRevision] = @CanCreateCLPRevision
  ,[CanEnterOTPProgress] = @CanEnterOTPProgress
  ,[CanChangePlanning] = @CanChangePlanning
  WHERE
  [UserID] = @Original_UserID
  AND [ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO
