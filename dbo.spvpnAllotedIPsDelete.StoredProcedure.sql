USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnAllotedIPsDelete]
  @Original_VLanIP NVarChar(15),
  @Original_VpnIP NVarChar(15),
  @Original_CardNo NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [VPN_AllotedIPs]
  WHERE
  [VPN_AllotedIPs].[VLanIP] = @Original_VLanIP
  AND [VPN_AllotedIPs].[VpnIP] = @Original_VpnIP
  AND [VPN_AllotedIPs].[CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
