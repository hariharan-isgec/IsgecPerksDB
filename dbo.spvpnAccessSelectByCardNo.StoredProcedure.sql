USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnAccessSelectByCardNo]
  @CardNo NVarChar(8),
  @OrderBy NVarChar(50),
  @Removed Bit, 
  @RecordCount Int = 0 OUTPUT
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
  [VPN_ConnectivityAccess].[CardNo] = @CardNo  
   AND 		[VPN_ConnectivityAccess].[Removed] = @Removed  
  ORDER BY
     CASE @orderBy WHEN 'RequestID' THEN [VPN_ConnectivityAccess].[RequestID] END,
     CASE @orderBy WHEN 'RequestID DESC' THEN [VPN_ConnectivityAccess].[RequestID] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [VPN_ConnectivityAccess].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [VPN_ConnectivityAccess].[CardNo] END DESC,
     CASE @orderBy WHEN 'C_OfficeID' THEN [VPN_ConnectivityAccess].[C_OfficeID] END,
     CASE @orderBy WHEN 'C_OfficeID DESC' THEN [VPN_ConnectivityAccess].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [VPN_ConnectivityAccess].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [VPN_ConnectivityAccess].[Remarks] END DESC,
     CASE @orderBy WHEN 'RequestedBy' THEN [VPN_ConnectivityAccess].[RequestedBy] END,
     CASE @orderBy WHEN 'RequestedBy DESC' THEN [VPN_ConnectivityAccess].[RequestedBy] END DESC,
     CASE @orderBy WHEN 'RequestedOn' THEN [VPN_ConnectivityAccess].[RequestedOn] END,
     CASE @orderBy WHEN 'RequestedOn DESC' THEN [VPN_ConnectivityAccess].[RequestedOn] END DESC,
     CASE @orderBy WHEN 'Configured' THEN [VPN_ConnectivityAccess].[Configured] END,
     CASE @orderBy WHEN 'Configured DESC' THEN [VPN_ConnectivityAccess].[Configured] END DESC,
     CASE @orderBy WHEN 'VPNIP' THEN [VPN_ConnectivityAccess].[VPNIP] END,
     CASE @orderBy WHEN 'VPNIP DESC' THEN [VPN_ConnectivityAccess].[VPNIP] END DESC,
     CASE @orderBy WHEN 'VPNPassword' THEN [VPN_ConnectivityAccess].[VPNPassword] END,
     CASE @orderBy WHEN 'VPNPassword DESC' THEN [VPN_ConnectivityAccess].[VPNPassword] END DESC,
     CASE @orderBy WHEN 'NetworkIP' THEN [VPN_ConnectivityAccess].[NetworkIP] END,
     CASE @orderBy WHEN 'NetworkIP DESC' THEN [VPN_ConnectivityAccess].[NetworkIP] END DESC,
     CASE @orderBy WHEN 'ConfiguredBy' THEN [VPN_ConnectivityAccess].[ConfiguredBy] END,
     CASE @orderBy WHEN 'ConfiguredBy DESC' THEN [VPN_ConnectivityAccess].[ConfiguredBy] END DESC,
     CASE @orderBy WHEN 'ConfiguredOn' THEN [VPN_ConnectivityAccess].[ConfiguredOn] END,
     CASE @orderBy WHEN 'ConfiguredOn DESC' THEN [VPN_ConnectivityAccess].[ConfiguredOn] END DESC,
     CASE @orderBy WHEN 'ConfigurationRemarks' THEN [VPN_ConnectivityAccess].[ConfigurationRemarks] END,
     CASE @orderBy WHEN 'ConfigurationRemarks DESC' THEN [VPN_ConnectivityAccess].[ConfigurationRemarks] END DESC,
     CASE @orderBy WHEN 'RemoveAccess' THEN [VPN_ConnectivityAccess].[RemoveAccess] END,
     CASE @orderBy WHEN 'RemoveAccess DESC' THEN [VPN_ConnectivityAccess].[RemoveAccess] END DESC,
     CASE @orderBy WHEN 'RemoveRequestedBy' THEN [VPN_ConnectivityAccess].[RemoveRequestedBy] END,
     CASE @orderBy WHEN 'RemoveRequestedBy DESC' THEN [VPN_ConnectivityAccess].[RemoveRequestedBy] END DESC,
     CASE @orderBy WHEN 'RemoveRequestedOn' THEN [VPN_ConnectivityAccess].[RemoveRequestedOn] END,
     CASE @orderBy WHEN 'RemoveRequestedOn DESC' THEN [VPN_ConnectivityAccess].[RemoveRequestedOn] END DESC,
     CASE @orderBy WHEN 'RemoveRemarks' THEN [VPN_ConnectivityAccess].[RemoveRemarks] END,
     CASE @orderBy WHEN 'RemoveRemarks DESC' THEN [VPN_ConnectivityAccess].[RemoveRemarks] END DESC,
     CASE @orderBy WHEN 'Removed' THEN [VPN_ConnectivityAccess].[Removed] END,
     CASE @orderBy WHEN 'Removed DESC' THEN [VPN_ConnectivityAccess].[Removed] END DESC,
     CASE @orderBy WHEN 'RemovedBy' THEN [VPN_ConnectivityAccess].[RemovedBy] END,
     CASE @orderBy WHEN 'RemovedBy DESC' THEN [VPN_ConnectivityAccess].[RemovedBy] END DESC,
     CASE @orderBy WHEN 'RemovedOn' THEN [VPN_ConnectivityAccess].[RemovedOn] END,
     CASE @orderBy WHEN 'RemovedOn DESC' THEN [VPN_ConnectivityAccess].[RemovedOn] END DESC,
     CASE @orderBy WHEN 'RemovedRemarks' THEN [VPN_ConnectivityAccess].[RemovedRemarks] END,
     CASE @orderBy WHEN 'RemovedRemarks DESC' THEN [VPN_ConnectivityAccess].[RemovedRemarks] END DESC,
     CASE @orderBy WHEN 'BaaNPW' THEN [VPN_ConnectivityAccess].[BaaNPW] END,
     CASE @orderBy WHEN 'BaaNPW DESC' THEN [VPN_ConnectivityAccess].[BaaNPW] END DESC,
     CASE @orderBy WHEN 'PLMpw' THEN [VPN_ConnectivityAccess].[PLMpw] END,
     CASE @orderBy WHEN 'PLMpw DESC' THEN [VPN_ConnectivityAccess].[PLMpw] END DESC,
     CASE @orderBy WHEN 'EMailPW' THEN [VPN_ConnectivityAccess].[EMailPW] END,
     CASE @orderBy WHEN 'EMailPW DESC' THEN [VPN_ConnectivityAccess].[EMailPW] END DESC,
     CASE @orderBy WHEN 'IsLaptop' THEN [VPN_ConnectivityAccess].[IsLaptop] END,
     CASE @orderBy WHEN 'IsLaptop DESC' THEN [VPN_ConnectivityAccess].[IsLaptop] END DESC,
     CASE @orderBy WHEN 'ConfidentialData' THEN [VPN_ConnectivityAccess].[ConfidentialData] END,
     CASE @orderBy WHEN 'ConfidentialData DESC' THEN [VPN_ConnectivityAccess].[ConfidentialData] END DESC,
     CASE @orderBy WHEN 'SensitiveData' THEN [VPN_ConnectivityAccess].[SensitiveData] END,
     CASE @orderBy WHEN 'SensitiveData DESC' THEN [VPN_ConnectivityAccess].[SensitiveData] END DESC,
     CASE @orderBy WHEN 'InternetAccess' THEN [VPN_ConnectivityAccess].[InternetAccess] END,
     CASE @orderBy WHEN 'InternetAccess DESC' THEN [VPN_ConnectivityAccess].[InternetAccess] END DESC,
     CASE @orderBy WHEN 'ExternalEMail' THEN [VPN_ConnectivityAccess].[ExternalEMail] END,
     CASE @orderBy WHEN 'ExternalEMail DESC' THEN [VPN_ConnectivityAccess].[ExternalEMail] END DESC,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users4_UserFullName' THEN [aspnet_Users4].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users4_UserFullName DESC' THEN [aspnet_Users4].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users5_UserFullName' THEN [aspnet_Users5].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users5_UserFullName DESC' THEN [aspnet_Users5].[UserFullName] END DESC,
     CASE @orderBy WHEN 'HRM_Offices6_Description' THEN [HRM_Offices6].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices6_Description DESC' THEN [HRM_Offices6].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
