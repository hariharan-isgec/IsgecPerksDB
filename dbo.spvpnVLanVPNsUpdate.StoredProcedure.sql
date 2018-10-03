USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnVLanVPNsUpdate]
  @Original_VLanIP NVarChar(15), 
  @Original_VPNIP NVarChar(15), 
  @VLanIP NVarChar(15),
  @VPNIP NVarChar(15),
  @Description NVarChar(50),
  @IPSeries NVarChar(15),
  @Active Bit,
  @OnPublicDomain Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [VPN_VLanVPNs] SET 
   [VLanIP] = @VLanIP
  ,[VPNIP] = @VPNIP
  ,[Description] = @Description
  ,[IPSeries] = @IPSeries
  ,[Active] = @Active
  ,[OnPublicDomain] = @OnPublicDomain
  WHERE
  [VLanIP] = @Original_VLanIP
  AND [VPNIP] = @Original_VPNIP
  SET @RowCount = @@RowCount
GO
