USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnVLanVPNsDelete]
  @Original_VLanIP NVarChar(15),
  @Original_VPNIP NVarChar(15),
  @RowCount int = null OUTPUT
  AS
  DELETE [VPN_VLanVPNs]
  WHERE
  [VPN_VLanVPNs].[VLanIP] = @Original_VLanIP
  AND [VPN_VLanVPNs].[VPNIP] = @Original_VPNIP
  SET @RowCount = @@RowCount
GO
