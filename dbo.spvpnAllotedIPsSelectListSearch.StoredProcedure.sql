USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnAllotedIPsSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,VLanIP NVarChar(15) NOT NULL
 ,VpnIP NVarChar(15) NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (VLanIP, VpnIP, CardNo)
  SELECT [VPN_AllotedIPs].[VLanIP], [VPN_AllotedIPs].[VpnIP], [VPN_AllotedIPs].[CardNo] FROM [VPN_AllotedIPs]
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VPN_AllotedIPs].[CardNo] = [aspnet_Users1].[LoginID]
  INNER JOIN [VPN_VLans] AS [VPN_VLans2]
    ON [VPN_AllotedIPs].[VLanIP] = [VPN_VLans2].[VLanIP]
  INNER JOIN [VPN_VLanVPNs] AS [VPN_VLanVPNs3]
    ON [VPN_AllotedIPs].[VLanIP] = [VPN_VLanVPNs3].[VLanIP]
    AND [VPN_AllotedIPs].[VpnIP] = [VPN_VLanVPNs3].[VPNIP]
 WHERE  
   ( 
         LOWER(ISNULL([VPN_AllotedIPs].[VLanIP],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VPN_AllotedIPs].[VpnIP],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VPN_AllotedIPs].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VPN_AllotedIPs].[AllotedIP],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VPN_AllotedIPs].[AllotedPW],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'VLanIP' THEN [VPN_AllotedIPs].[VLanIP] END,
     CASE @orderBy WHEN 'VLanIP DESC' THEN [VPN_AllotedIPs].[VLanIP] END DESC,
     CASE @orderBy WHEN 'VpnIP' THEN [VPN_AllotedIPs].[VpnIP] END,
     CASE @orderBy WHEN 'VpnIP DESC' THEN [VPN_AllotedIPs].[VpnIP] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [VPN_AllotedIPs].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [VPN_AllotedIPs].[CardNo] END DESC,
     CASE @orderBy WHEN 'AllotedIP' THEN [VPN_AllotedIPs].[AllotedIP] END,
     CASE @orderBy WHEN 'AllotedIP DESC' THEN [VPN_AllotedIPs].[AllotedIP] END DESC,
     CASE @orderBy WHEN 'AllotedPW' THEN [VPN_AllotedIPs].[AllotedPW] END,
     CASE @orderBy WHEN 'AllotedPW DESC' THEN [VPN_AllotedIPs].[AllotedPW] END DESC,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @orderBy WHEN 'VPN_VLans2_Description' THEN [VPN_VLans2].[Description] END,
     CASE @orderBy WHEN 'VPN_VLans2_Description DESC' THEN [VPN_VLans2].[Description] END DESC,
     CASE @orderBy WHEN 'VPN_VLanVPNs3_Description' THEN [VPN_VLanVPNs3].[Description] END,
     CASE @orderBy WHEN 'VPN_VLanVPNs3_Description DESC' THEN [VPN_VLanVPNs3].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[VPN_AllotedIPs].[VLanIP] ,
		[VPN_AllotedIPs].[VpnIP] ,
		[VPN_AllotedIPs].[CardNo] ,
		[VPN_AllotedIPs].[AllotedIP] ,
		[VPN_AllotedIPs].[AllotedPW] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[VPN_VLans2].[Description] AS VPN_VLans2_Description,
		[VPN_VLanVPNs3].[Description] AS VPN_VLanVPNs3_Description 
  FROM [VPN_AllotedIPs] 
    	INNER JOIN #PageIndex
          ON [VPN_AllotedIPs].[VLanIP] = #PageIndex.VLanIP
          AND [VPN_AllotedIPs].[VpnIP] = #PageIndex.VpnIP
          AND [VPN_AllotedIPs].[CardNo] = #PageIndex.CardNo
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VPN_AllotedIPs].[CardNo] = [aspnet_Users1].[LoginID]
  INNER JOIN [VPN_VLans] AS [VPN_VLans2]
    ON [VPN_AllotedIPs].[VLanIP] = [VPN_VLans2].[VLanIP]
  INNER JOIN [VPN_VLanVPNs] AS [VPN_VLanVPNs3]
    ON [VPN_AllotedIPs].[VLanIP] = [VPN_VLanVPNs3].[VLanIP]
    AND [VPN_AllotedIPs].[VpnIP] = [VPN_VLanVPNs3].[VPNIP]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
