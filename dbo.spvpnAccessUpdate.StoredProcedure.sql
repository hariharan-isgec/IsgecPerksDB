USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spvpnAccessUpdate]
  @Original_RequestID Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [VPN_ConnectivityAccess] SET 
   [CardNo] = @CardNo
  ,[C_OfficeID] = @C_OfficeID
  ,[Remarks] = @Remarks
  ,[RequestedBy] = @RequestedBy
  ,[RequestedOn] = @RequestedOn
  ,[Configured] = @Configured
  ,[VPNIP] = @VPNIP
  ,[VPNPassword] = @VPNPassword
  ,[NetworkIP] = @NetworkIP
  ,[ConfiguredBy] = @ConfiguredBy
  ,[ConfiguredOn] = @ConfiguredOn
  ,[ConfigurationRemarks] = @ConfigurationRemarks
  ,[RemoveAccess] = @RemoveAccess
  ,[RemoveRequestedBy] = @RemoveRequestedBy
  ,[RemoveRequestedOn] = @RemoveRequestedOn
  ,[RemoveRemarks] = @RemoveRemarks
  ,[Removed] = @Removed
  ,[RemovedBy] = @RemovedBy
  ,[RemovedOn] = @RemovedOn
  ,[RemovedRemarks] = @RemovedRemarks
  ,[BaaNPW] = @BaaNPW
  ,[PLMpw] = @PLMpw
  ,[EMailPW] = @EMailPW
  ,[IsLaptop] = @IsLaptop
  ,[ConfidentialData] = @ConfidentialData
  ,[SensitiveData] = @SensitiveData
  ,[InternetAccess] = @InternetAccess
  ,[ExternalEMail] = @ExternalEMail
  WHERE
  [RequestID] = @Original_RequestID
  SET @RowCount = @@RowCount
GO
