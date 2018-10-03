USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnIPsSelectListSearch]
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
 ,VPNIP NVarChar(15) NOT NULL
  )
  INSERT INTO #PageIndex (VPNIP)
  SELECT [VPN_IPs].[VPNIP] FROM [VPN_IPs]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VPN_IPs].[UsedBy] = [aspnet_Users1].[LoginID]
 WHERE  
   ( 
         LOWER(ISNULL([VPN_IPs].[VPNIP],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VPN_IPs].[UsedBy],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'VPNIP' THEN [VPN_IPs].[VPNIP] END,
     CASE @orderBy WHEN 'VPNIP DESC' THEN [VPN_IPs].[VPNIP] END DESC,
     CASE @orderBy WHEN 'UsedBy' THEN [VPN_IPs].[UsedBy] END,
     CASE @orderBy WHEN 'UsedBy DESC' THEN [VPN_IPs].[UsedBy] END DESC,
     CASE @orderBy WHEN 'Used' THEN [VPN_IPs].[Used] END,
     CASE @orderBy WHEN 'Used DESC' THEN [VPN_IPs].[Used] END DESC,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[VPN_IPs].[VPNIP] ,
		[VPN_IPs].[UsedBy] ,
		[VPN_IPs].[Used] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName 
  FROM [VPN_IPs] 
    	INNER JOIN #PageIndex
          ON [VPN_IPs].[VPNIP] = #PageIndex.VPNIP
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VPN_IPs].[UsedBy] = [aspnet_Users1].[LoginID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
