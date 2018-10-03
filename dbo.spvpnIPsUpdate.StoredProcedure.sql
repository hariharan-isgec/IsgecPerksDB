USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnIPsUpdate]
  @Original_VPNIP NVarChar(15), 
  @VPNIP NVarChar(15),
  @UsedBy NVarChar(8),
  @Used Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [VPN_IPs] SET 
   [VPNIP] = @VPNIP
  ,[UsedBy] = @UsedBy
  ,[Used] = @Used
  WHERE
  [VPNIP] = @Original_VPNIP
  SET @RowCount = @@RowCount
GO
