USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnVLanVPNsInsert]
  @VLanIP NVarChar(15),
  @VPNIP NVarChar(15),
  @Description NVarChar(50),
  @IPSeries NVarChar(15),
  @Active Bit,
  @OnPublicDomain Bit,
  @Return_VLanIP NVarChar(15) = null OUTPUT, 
  @Return_VPNIP NVarChar(15) = null OUTPUT 
  AS
  INSERT [VPN_VLanVPNs]
  (
   [VLanIP]
  ,[VPNIP]
  ,[Description]
  ,[IPSeries]
  ,[Active]
  ,[OnPublicDomain]
  )
  VALUES
  (
   UPPER(@VLanIP)
  ,UPPER(@VPNIP)
  ,@Description
  ,@IPSeries
  ,@Active
  ,@OnPublicDomain
  )
  SET @Return_VLanIP = @VLanIP
  SET @Return_VPNIP = @VPNIP
GO
