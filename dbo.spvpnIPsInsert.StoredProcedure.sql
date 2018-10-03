USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnIPsInsert]
  @VPNIP NVarChar(15),
  @UsedBy NVarChar(8),
  @Used Bit,
  @Return_VPNIP NVarChar(15) = null OUTPUT
  AS
  INSERT [VPN_IPs]
  (
   [VPNIP]
  ,[UsedBy]
  ,[Used]
  )
  VALUES
  (
   UPPER(@VPNIP)
  ,@UsedBy
  ,@Used
  )
  SET @Return_VPNIP = @VPNIP
GO
