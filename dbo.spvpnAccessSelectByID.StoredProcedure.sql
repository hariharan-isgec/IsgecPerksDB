USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spvpnAccessSelectByID]
  @RequestID Int 
  AS
  SELECT
		[VPN_ConnectivityAccess].[RequestID] ,
		[VPN_ConnectivityAccess].[CardNo] ,
		[VPN_ConnectivityAccess].[C_OfficeID] ,
		[VPN_ConnectivityAccess].[Remarks] ,
		[VPN_ConnectivityAccess].[RequestedBy] ,
		[VPN_ConnectivityAccess].[RequestedOn] ,
		[VPN_ConnectivityAccess].[Configured] ,
		[VPN_ConnectivityAccess].[VPNIP] ,
		[VPN_ConnectivityAccess].[VPNPassword] ,
		[VPN_ConnectivityAccess].[NetworkIP] ,
		[VPN_ConnectivityAccess].[ConfiguredBy] ,
		[VPN_ConnectivityAccess].[ConfiguredOn] ,
		[VPN_ConnectivityAccess].[ConfigurationRemarks] ,
		[VPN_ConnectivityAccess].[RemoveAccess] ,
		[VPN_ConnectivityAccess].[RemoveRequestedBy] ,
		[VPN_ConnectivityAccess].[RemoveRequestedOn] ,
		[VPN_ConnectivityAccess].[RemoveRemarks] ,
		[VPN_ConnectivityAccess].[Removed] ,
		[VPN_ConnectivityAccess].[RemovedBy] ,
		[VPN_ConnectivityAccess].[RemovedOn] ,
		[VPN_ConnectivityAccess].[RemovedRemarks] ,
		[VPN_ConnectivityAccess].[BaaNPW] ,
		[VPN_ConnectivityAccess].[PLMpw] ,
		[VPN_ConnectivityAccess].[EMailPW] ,
		[VPN_ConnectivityAccess].[IsLaptop] ,
		[VPN_ConnectivityAccess].[ConfidentialData] ,
		[VPN_ConnectivityAccess].[SensitiveData] ,
		[VPN_ConnectivityAccess].[InternetAccess] ,
		[VPN_ConnectivityAccess].[ExternalEMail] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[aspnet_Users4].[UserFullName] AS aspnet_Users4_UserFullName,
		[aspnet_Users5].[UserFullName] AS aspnet_Users5_UserFullName,
		[HRM_Offices6].[Description] AS HRM_Offices6_Description 
  FROM [VPN_ConnectivityAccess] 
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VPN_ConnectivityAccess].[CardNo] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [VPN_ConnectivityAccess].[RequestedBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [VPN_ConnectivityAccess].[ConfiguredBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]
    ON [VPN_ConnectivityAccess].[RemoveRequestedBy] = [aspnet_Users4].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users5]
    ON [VPN_ConnectivityAccess].[RemovedBy] = [aspnet_Users5].[LoginID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices6]
    ON [VPN_ConnectivityAccess].[C_OfficeID] = [HRM_Offices6].[OfficeID]
  WHERE
  [VPN_ConnectivityAccess].[RequestID] = @RequestID
GO
