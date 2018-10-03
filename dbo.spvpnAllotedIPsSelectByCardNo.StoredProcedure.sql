USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnAllotedIPsSelectByCardNo]
  @CardNo NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  [VPN_AllotedIPs].[CardNo] = @CardNo
  ORDER BY
     CASE @orderBy WHEN 'VLanIP' THEN [VPN_AllotedIPs].[VLanIP] END,
     CASE @orderBy WHEN 'VLanIP DESC' THEN [VPN_AllotedIPs].[VLanIP] END DESC,
     CASE @orderBy WHEN 'VpnIP' THEN [VPN_AllotedIPs].[VpnIP] END,
     CASE @orderBy WHEN 'VpnIP DESC' THEN [VPN_AllotedIPs].[VpnIP] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [VPN_AllotedIPs].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [VPN_AllotedIPs].[CardNo] END DESC,
     CASE @orderBy WHEN 'AllotedIP' THEN [VPN_AllotedIPs].[AllotedIP] END,
     CASE @orderBy WHEN 'AllotedIP DESC' THEN [VPN_AllotedIPs].[AllotedIP] END DESC,
     CASE @orderBy WHEN 'AllotedPW' THEN [VPN_AllotedIPs].[AllotedPW] END,
     CASE @orderBy WHEN 'AllotedPW DESC' THEN [VPN_AllotedIPs].[AllotedPW] END DESC,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @orderBy WHEN 'VPN_VLans2_Description' THEN [VPN_VLans2].[Description] END,
     CASE @orderBy WHEN 'VPN_VLans2_Description DESC' THEN [VPN_VLans2].[Description] END DESC,
     CASE @orderBy WHEN 'VPN_VLanVPNs3_Description' THEN [VPN_VLanVPNs3].[Description] END,
     CASE @orderBy WHEN 'VPN_VLanVPNs3_Description DESC' THEN [VPN_VLanVPNs3].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
