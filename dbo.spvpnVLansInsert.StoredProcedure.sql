USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnVLansInsert]
  @VLanIP NVarChar(15),
  @Description NVarChar(50),
  @Active Bit,
  @Return_VLanIP NVarChar(15) = null OUTPUT 
  AS
  INSERT [VPN_VLans]
  (
   [VLanIP]
  ,[Description]
  ,[Active]
  )
  VALUES
  (
   UPPER(@VLanIP)
  ,@Description
  ,@Active
  )
  SET @Return_VLanIP = @VLanIP
GO
