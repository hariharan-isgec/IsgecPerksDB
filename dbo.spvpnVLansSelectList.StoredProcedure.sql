USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnVLansSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[VPN_VLans].[VLanIP] ,
		[VPN_VLans].[Description] ,
		[VPN_VLans].[Active]  
  FROM [VPN_VLans] 
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'VLanIP' THEN [VPN_VLans].[VLanIP] END,
     CASE @orderBy WHEN 'VLanIP DESC' THEN [VPN_VLans].[VLanIP] END DESC,
     CASE @orderBy WHEN 'Description' THEN [VPN_VLans].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [VPN_VLans].[Description] END DESC,
     CASE @orderBy WHEN 'Active' THEN [VPN_VLans].[Active] END,
     CASE @orderBy WHEN 'Active DESC' THEN [VPN_VLans].[Active] END DESC 
  SET @RecordCount = @@RowCount
GO
