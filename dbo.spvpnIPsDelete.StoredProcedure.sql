USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnIPsDelete]
  @Original_VPNIP NVarChar(15),
  @RowCount int = null OUTPUT
  AS
  DELETE [VPN_IPs]
  WHERE
  [VPN_IPs].[VPNIP] = @Original_VPNIP
  SET @RowCount = @@RowCount
GO
