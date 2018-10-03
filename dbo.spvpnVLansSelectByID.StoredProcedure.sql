USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnVLansSelectByID]
  @VLanIP NVarChar(15) 
  AS
  SELECT
		[VPN_VLans].[VLanIP] ,
		[VPN_VLans].[Description] ,
		[VPN_VLans].[Active]  
  FROM [VPN_VLans] 
  WHERE
  [VPN_VLans].[VLanIP] = @VLanIP
GO
