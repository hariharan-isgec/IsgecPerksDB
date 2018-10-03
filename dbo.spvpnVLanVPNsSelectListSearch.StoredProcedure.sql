USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnVLanVPNsSelectListSearch]
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
 ,VPNIP NVarChar(15) NOT NULL
  )
  INSERT INTO #PageIndex (VLanIP, VPNIP)
  SELECT [VPN_VLanVPNs].[VLanIP], [VPN_VLanVPNs].[VPNIP] FROM [VPN_VLanVPNs]
  INNER JOIN [VPN_VLans] AS [VPN_VLans1]
    ON [VPN_VLanVPNs].[VLanIP] = [VPN_VLans1].[VLanIP]
 WHERE  
   ( 
         LOWER(ISNULL([VPN_VLanVPNs].[VLanIP],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VPN_VLanVPNs].[VPNIP],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VPN_VLanVPNs].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VPN_VLanVPNs].[IPSeries],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'VLanIP' THEN [VPN_VLanVPNs].[VLanIP] END,
     CASE @orderBy WHEN 'VLanIP DESC' THEN [VPN_VLanVPNs].[VLanIP] END DESC,
     CASE @orderBy WHEN 'VPNIP' THEN [VPN_VLanVPNs].[VPNIP] END,
     CASE @orderBy WHEN 'VPNIP DESC' THEN [VPN_VLanVPNs].[VPNIP] END DESC,
     CASE @orderBy WHEN 'Description' THEN [VPN_VLanVPNs].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [VPN_VLanVPNs].[Description] END DESC,
     CASE @orderBy WHEN 'IPSeries' THEN [VPN_VLanVPNs].[IPSeries] END,
     CASE @orderBy WHEN 'IPSeries DESC' THEN [VPN_VLanVPNs].[IPSeries] END DESC,
     CASE @orderBy WHEN 'Active' THEN [VPN_VLanVPNs].[Active] END,
     CASE @orderBy WHEN 'Active DESC' THEN [VPN_VLanVPNs].[Active] END DESC,
     CASE @orderBy WHEN 'OnPublicDomain' THEN [VPN_VLanVPNs].[OnPublicDomain] END,
     CASE @orderBy WHEN 'OnPublicDomain DESC' THEN [VPN_VLanVPNs].[OnPublicDomain] END DESC,
     CASE @orderBy WHEN 'VPN_VLans1_Description' THEN [VPN_VLans1].[Description] END,
     CASE @orderBy WHEN 'VPN_VLans1_Description DESC' THEN [VPN_VLans1].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[VPN_VLanVPNs].[VLanIP] ,
		[VPN_VLanVPNs].[VPNIP] ,
		[VPN_VLanVPNs].[Description] ,
		[VPN_VLanVPNs].[IPSeries] ,
		[VPN_VLanVPNs].[Active] ,
		[VPN_VLanVPNs].[OnPublicDomain] ,
		[VPN_VLans1].[Description] AS VPN_VLans1_Description 
  FROM [VPN_VLanVPNs] 
    	INNER JOIN #PageIndex
          ON [VPN_VLanVPNs].[VLanIP] = #PageIndex.VLanIP
          AND [VPN_VLanVPNs].[VPNIP] = #PageIndex.VPNIP
  INNER JOIN [VPN_VLans] AS [VPN_VLans1]
    ON [VPN_VLanVPNs].[VLanIP] = [VPN_VLans1].[VLanIP]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
