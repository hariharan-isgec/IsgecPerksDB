USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spvpnAccessInsert]
  @CardNo NVarChar(8),
  @C_OfficeID Int,
  @Remarks NVarChar(500),
  @RequestedBy NVarChar(8),
  @RequestedOn DateTime,
  @Configured Bit,
  @VPNIP NVarChar(15),
  @VPNPassword NVarChar(50),
  @NetworkIP NVarChar(15),
  @ConfiguredBy NVarChar(8),
  @ConfiguredOn DateTime,
  @ConfigurationRemarks NVarChar(500),
  @RemoveAccess Bit,
  @RemoveRequestedBy NVarChar(8),
  @RemoveRequestedOn DateTime,
  @RemoveRemarks NVarChar(500),
  @Removed Bit,
  @RemovedBy NVarChar(8),
  @RemovedOn DateTime,
  @RemovedRemarks NVarChar(500),
  @BaaNPW NVarChar(50),
  @PLMpw NVarChar(50),
  @EMailPW NVarChar(50),
  @IsLaptop Bit,
  @ConfidentialData Bit,
  @SensitiveData Bit,
  @InternetAccess Bit,
  @ExternalEMail Bit,
  @Return_RequestID Int = null OUTPUT 
  AS
  INSERT [VPN_ConnectivityAccess]
  (
   [CardNo]
  ,[C_OfficeID]
  ,[Remarks]
  ,[RequestedBy]
  ,[RequestedOn]
  ,[Configured]
  ,[VPNIP]
  ,[VPNPassword]
  ,[NetworkIP]
  ,[ConfiguredBy]
  ,[ConfiguredOn]
  ,[ConfigurationRemarks]
  ,[RemoveAccess]
  ,[RemoveRequestedBy]
  ,[RemoveRequestedOn]
  ,[RemoveRemarks]
  ,[Removed]
  ,[RemovedBy]
  ,[RemovedOn]
  ,[RemovedRemarks]
  ,[BaaNPW]
  ,[PLMpw]
  ,[EMailPW]
  ,[IsLaptop]
  ,[ConfidentialData]
  ,[SensitiveData]
  ,[InternetAccess]
  ,[ExternalEMail]
  )
  VALUES
  (
   @CardNo
  ,@C_OfficeID
  ,@Remarks
  ,@RequestedBy
  ,@RequestedOn
  ,@Configured
  ,@VPNIP
  ,@VPNPassword
  ,@NetworkIP
  ,@ConfiguredBy
  ,@ConfiguredOn
  ,@ConfigurationRemarks
  ,@RemoveAccess
  ,@RemoveRequestedBy
  ,@RemoveRequestedOn
  ,@RemoveRemarks
  ,@Removed
  ,@RemovedBy
  ,@RemovedOn
  ,@RemovedRemarks
  ,@BaaNPW
  ,@PLMpw
  ,@EMailPW
  ,@IsLaptop
  ,@ConfidentialData
  ,@SensitiveData
  ,@InternetAccess
  ,@ExternalEMail
  )
  SET @Return_RequestID = Scope_Identity()
GO
