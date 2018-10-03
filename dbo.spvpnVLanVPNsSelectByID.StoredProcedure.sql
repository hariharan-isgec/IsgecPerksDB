USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnVLanVPNsSelectByID]
  @VLanIP NVarChar(15),
  @VPNIP NVarChar(15) 
  AS
  SELECT
		[VPN_VLanVPNs].[VLanIP] ,
		[VPN_VLanVPNs].[VPNIP] ,
		[VPN_VLanVPNs].[Description] ,
		[VPN_VLanVPNs].[IPSeries] ,
		[VPN_VLanVPNs].[Active] ,
		[VPN_VLanVPNs].[OnPublicDomain] ,
		[VPN_VLans1].[Description] AS VPN_VLans1_Description 
  FROM [VPN_VLanVPNs] 
  INNER JOIN [VPN_VLans] AS [VPN_VLans1]
    ON [VPN_VLanVPNs].[VLanIP] = [VPN_VLans1].[VLanIP]
  WHERE
  [VPN_VLanVPNs].[VLanIP] = @VLanIP
  AND [VPN_VLanVPNs].[VPNIP] = @VPNIP
GO
