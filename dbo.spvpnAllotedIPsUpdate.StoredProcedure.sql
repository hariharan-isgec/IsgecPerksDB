USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnAllotedIPsUpdate]
  @Original_VLanIP NVarChar(15), 
  @Original_VpnIP NVarChar(15), 
  @Original_CardNo NVarChar(8), 
  @VLanIP NVarChar(15),
  @VpnIP NVarChar(15),
  @CardNo NVarChar(8),
  @AllotedIP NVarChar(15),
  @AllotedPW NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [VPN_AllotedIPs] SET 
   [VLanIP] = @VLanIP
  ,[VpnIP] = @VpnIP
  ,[CardNo] = @CardNo
  ,[AllotedIP] = @AllotedIP
  ,[AllotedPW] = @AllotedPW
  WHERE
  [VLanIP] = @Original_VLanIP
  AND [VpnIP] = @Original_VpnIP
  AND [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
