USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnVLanVPNsSelectListFilteres]
  @Filter_VLanIP NVarChar(15),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,VLanIP NVarChar(15) NOT NULL
 ,VPNIP NVarChar(15) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'VLanIP'
  SET @LGSQL = @LGSQL + ', VPNIP'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VPN_VLanVPNs].[VLanIP]'
  SET @LGSQL = @LGSQL + ', [VPN_VLanVPNs].[VPNIP]'
  SET @LGSQL = @LGSQL + ' FROM [VPN_VLanVPNs] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [VPN_VLans] AS [VPN_VLans1]'
  SET @LGSQL = @LGSQL + '    ON [VPN_VLanVPNs].[VLanIP] = [VPN_VLans1].[VLanIP]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_VLanIP > '') 
    SET @LGSQL = @LGSQL + ' AND [VPN_VLanVPNs].[VLanIP] = ''' + @Filter_VLanIP + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'VLanIP' THEN '[VPN_VLanVPNs].[VLanIP]'
                        WHEN 'VLanIP DESC' THEN '[VPN_VLanVPNs].[VLanIP] DESC'
                        WHEN 'VPNIP' THEN '[VPN_VLanVPNs].[VPNIP]'
                        WHEN 'VPNIP DESC' THEN '[VPN_VLanVPNs].[VPNIP] DESC'
                        WHEN 'Description' THEN '[VPN_VLanVPNs].[Description]'
                        WHEN 'Description DESC' THEN '[VPN_VLanVPNs].[Description] DESC'
                        WHEN 'IPSeries' THEN '[VPN_VLanVPNs].[IPSeries]'
                        WHEN 'IPSeries DESC' THEN '[VPN_VLanVPNs].[IPSeries] DESC'
                        WHEN 'Active' THEN '[VPN_VLanVPNs].[Active]'
                        WHEN 'Active DESC' THEN '[VPN_VLanVPNs].[Active] DESC'
                        WHEN 'OnPublicDomain' THEN '[VPN_VLanVPNs].[OnPublicDomain]'
                        WHEN 'OnPublicDomain DESC' THEN '[VPN_VLanVPNs].[OnPublicDomain] DESC'
                        WHEN 'VPN_VLans1_Description' THEN '[VPN_VLans].[Description]'
                        WHEN 'VPN_VLans1_Description DESC' THEN '[VPN_VLans1].[Description] DESC'
                        ELSE '[VPN_VLanVPNs].[VLanIP],[VPN_VLanVPNs].[VPNIP]'
                    END
  EXEC (@LGSQL)

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
