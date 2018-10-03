USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnIPsSelectByID]
  @VPNIP NVarChar(15) 
  AS
  SELECT
		[VPN_IPs].[VPNIP] ,
		[VPN_IPs].[UsedBy] ,
		[VPN_IPs].[Used] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName 
  FROM [VPN_IPs] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VPN_IPs].[UsedBy] = [aspnet_Users1].[LoginID]
  WHERE
  [VPN_IPs].[VPNIP] = @VPNIP
GO
