USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnVLanVPNsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'VLanIP' THEN [VPN_VLanVPNs].[VLanIP] END,
     CASE @orderBy WHEN 'VLanIP DESC' THEN [VPN_VLanVPNs].[VLanIP] END DESC,
     CASE @orderBy WHEN 'VPNIP' THEN [VPN_VLanVPNs].[VPNIP] END,
     CASE @orderBy WHEN 'VPNIP DESC' THEN [VPN_VLanVPNs].[VPNIP] END DESC,
     CASE @orderBy WHEN 'Description' THEN [VPN_VLanVPNs].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [VPN_VLanVPNs].[Description] END DESC,
     CASE @orderBy WHEN 'IPSeries' THEN [VPN_VLanVPNs].[IPSeries] END,
     CASE @orderBy WHEN 'IPSeries DESC' THEN [VPN_VLanVPNs].[IPSeries] END DESC,
     CASE @orderBy WHEN 'Active' THEN [VPN_VLanVPNs].[Active] END,
     CASE @orderBy WHEN 'Active DESC' THEN [VPN_VLanVPNs].[Active] END DESC,
     CASE @orderBy WHEN 'OnPublicDomain' THEN [VPN_VLanVPNs].[OnPublicDomain] END,
     CASE @orderBy WHEN 'OnPublicDomain DESC' THEN [VPN_VLanVPNs].[OnPublicDomain] END DESC,
     CASE @orderBy WHEN 'VPN_VLans1_Description' THEN [VPN_VLans1].[Description] END,
     CASE @orderBy WHEN 'VPN_VLans1_Description DESC' THEN [VPN_VLans1].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
