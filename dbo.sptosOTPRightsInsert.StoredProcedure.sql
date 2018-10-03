USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOTPRightsInsert]
  @UserID NVarChar(8),
  @ProjectID NVarChar(6),
  @CLPView Bit,
  @OTPView Bit,
  @CanEnterCLPNotes Bit,
  @CanSendCLPAlerts Bit,
  @CanCreateCLPRevision Bit,
  @CanEnterOTPProgress Bit,
  @CanChangePlanning Bit,
  @Return_UserID NVarChar(8) = null OUTPUT, 
  @Return_ProjectID NVarChar(6) = null OUTPUT 
  AS
  INSERT [TOS_UserViews]
  (
   [UserID]
  ,[ProjectID]
  ,[CLPView]
  ,[OTPView]
  ,[CanEnterCLPNotes]
  ,[CanSendCLPAlerts]
  ,[CanCreateCLPRevision]
  ,[CanEnterOTPProgress]
  ,[CanChangePlanning]
  )
  VALUES
  (
   UPPER(@UserID)
  ,UPPER(@ProjectID)
  ,@CLPView
  ,@OTPView
  ,@CanEnterCLPNotes
  ,@CanSendCLPAlerts
  ,@CanCreateCLPRevision
  ,@CanEnterOTPProgress
  ,@CanChangePlanning
  )
  SET @Return_UserID = @UserID
  SET @Return_ProjectID = @ProjectID
GO
