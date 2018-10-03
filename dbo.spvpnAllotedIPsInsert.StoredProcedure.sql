USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnAllotedIPsInsert]
  @VLanIP NVarChar(15),
  @VpnIP NVarChar(15),
  @CardNo NVarChar(8),
  @AllotedIP NVarChar(15),
  @AllotedPW NVarChar(50),
  @Return_VLanIP NVarChar(15) = null OUTPUT, 
  @Return_VpnIP NVarChar(15) = null OUTPUT, 
  @Return_CardNo NVarChar(8) = null OUTPUT 
  AS
  INSERT [VPN_AllotedIPs]
  (
   [VLanIP]
  ,[VpnIP]
  ,[CardNo]
  ,[AllotedIP]
  ,[AllotedPW]
  )
  VALUES
  (
   UPPER(@VLanIP)
  ,UPPER(@VpnIP)
  ,UPPER(@CardNo)
  ,@AllotedIP
  ,@AllotedPW
  )
  SET @Return_VLanIP = @VLanIP
  SET @Return_VpnIP = @VpnIP
  SET @Return_CardNo = @CardNo
GO
