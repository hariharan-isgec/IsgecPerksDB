USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnAllotedIPsSelectByID]
  @VLanIP NVarChar(15),
  @VpnIP NVarChar(15),
  @CardNo NVarChar(8) 
  AS
  SELECT
		[VPN_AllotedIPs].[VLanIP] ,
		[VPN_AllotedIPs].[VpnIP] ,
		[VPN_AllotedIPs].[CardNo] ,
		[VPN_AllotedIPs].[AllotedIP] ,
		[VPN_AllotedIPs].[AllotedPW] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[VPN_VLans2].[Description] AS VPN_VLans2_Description,
		[VPN_VLanVPNs3].[Description] AS VPN_VLanVPNs3_Description 
  FROM [VPN_AllotedIPs] 
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VPN_AllotedIPs].[CardNo] = [aspnet_Users1].[LoginID]
  INNER JOIN [VPN_VLans] AS [VPN_VLans2]
    ON [VPN_AllotedIPs].[VLanIP] = [VPN_VLans2].[VLanIP]
  INNER JOIN [VPN_VLanVPNs] AS [VPN_VLanVPNs3]
    ON [VPN_AllotedIPs].[VLanIP] = [VPN_VLanVPNs3].[VLanIP]
    AND [VPN_AllotedIPs].[VpnIP] = [VPN_VLanVPNs3].[VPNIP]
  WHERE
  [VPN_AllotedIPs].[VLanIP] = @VLanIP
  AND [VPN_AllotedIPs].[VpnIP] = @VpnIP
  AND [VPN_AllotedIPs].[CardNo] = @CardNo
GO
