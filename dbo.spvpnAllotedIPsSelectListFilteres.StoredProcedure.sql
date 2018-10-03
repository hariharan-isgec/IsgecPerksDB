USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnAllotedIPsSelectListFilteres]
  @Filter_VLanIP NVarChar(15),
  @Filter_VpnIP NVarChar(15),
  @Filter_CardNo NVarChar(8),
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
 ,VpnIP NVarChar(15) NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'VLanIP'
  SET @LGSQL = @LGSQL + ', VpnIP'
  SET @LGSQL = @LGSQL + ', CardNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VPN_AllotedIPs].[VLanIP]'
  SET @LGSQL = @LGSQL + ', [VPN_AllotedIPs].[VpnIP]'
  SET @LGSQL = @LGSQL + ', [VPN_AllotedIPs].[CardNo]'
  SET @LGSQL = @LGSQL + ' FROM [VPN_AllotedIPs] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [VPN_AllotedIPs].[CardNo] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [VPN_VLans] AS [VPN_VLans2]'
  SET @LGSQL = @LGSQL + '    ON [VPN_AllotedIPs].[VLanIP] = [VPN_VLans2].[VLanIP]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [VPN_VLanVPNs] AS [VPN_VLanVPNs3]'
  SET @LGSQL = @LGSQL + '    ON [VPN_AllotedIPs].[VLanIP] = [VPN_VLanVPNs3].[VLanIP]'
  SET @LGSQL = @LGSQL + '    AND [VPN_AllotedIPs].[VpnIP] = [VPN_VLanVPNs3].[VPNIP]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_VLanIP > '') 
    SET @LGSQL = @LGSQL + ' AND [VPN_AllotedIPs].[VLanIP] = ''' + @Filter_VLanIP + ''''
  IF (@Filter_VpnIP > '') 
    SET @LGSQL = @LGSQL + ' AND [VPN_AllotedIPs].[VpnIP] = ''' + @Filter_VpnIP + ''''
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [VPN_AllotedIPs].[CardNo] = ''' + @Filter_CardNo + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'VLanIP' THEN '[VPN_AllotedIPs].[VLanIP]'
                        WHEN 'VLanIP DESC' THEN '[VPN_AllotedIPs].[VLanIP] DESC'
                        WHEN 'VpnIP' THEN '[VPN_AllotedIPs].[VpnIP]'
                        WHEN 'VpnIP DESC' THEN '[VPN_AllotedIPs].[VpnIP] DESC'
                        WHEN 'CardNo' THEN '[VPN_AllotedIPs].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[VPN_AllotedIPs].[CardNo] DESC'
                        WHEN 'AllotedIP' THEN '[VPN_AllotedIPs].[AllotedIP]'
                        WHEN 'AllotedIP DESC' THEN '[VPN_AllotedIPs].[AllotedIP] DESC'
                        WHEN 'AllotedPW' THEN '[VPN_AllotedIPs].[AllotedPW]'
                        WHEN 'AllotedPW DESC' THEN '[VPN_AllotedIPs].[AllotedPW] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'VPN_VLans2_Description' THEN '[VPN_VLans].[Description]'
                        WHEN 'VPN_VLans2_Description DESC' THEN '[VPN_VLans2].[Description] DESC'
                        WHEN 'VPN_VLanVPNs3_Description' THEN '[VPN_VLanVPNs].[Description]'
                        WHEN 'VPN_VLanVPNs3_Description DESC' THEN '[VPN_VLanVPNs3].[Description] DESC'
                        ELSE '[VPN_AllotedIPs].[VLanIP],[VPN_AllotedIPs].[VpnIP],[VPN_AllotedIPs].[CardNo]'
                    END
  EXEC (@LGSQL)

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
