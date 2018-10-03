USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnVLansUpdate]
  @Original_VLanIP NVarChar(15), 
  @VLanIP NVarChar(15),
  @Description NVarChar(50),
  @Active Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [VPN_VLans] SET 
   [VLanIP] = @VLanIP
  ,[Description] = @Description
  ,[Active] = @Active
  WHERE
  [VLanIP] = @Original_VLanIP
  SET @RowCount = @@RowCount
GO
