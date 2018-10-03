USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnVLansDelete]
  @Original_VLanIP NVarChar(15),
  @RowCount int = null OUTPUT
  AS
  DELETE [VPN_VLans]
  WHERE
  [VPN_VLans].[VLanIP] = @Original_VLanIP
  SET @RowCount = @@RowCount
GO
