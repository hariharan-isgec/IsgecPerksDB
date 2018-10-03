USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnIPsSelectListFilteres]
  @Filter_UsedBy NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,VPNIP NVarChar(15) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'VPNIP'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VPN_IPs].[VPNIP]'
  SET @LGSQL = @LGSQL + ' FROM [VPN_IPs] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [VPN_IPs].[UsedBy] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_UsedBy > '') 
    SET @LGSQL = @LGSQL + ' AND [VPN_IPs].[UsedBy] = ''' + @Filter_UsedBy + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'VPNIP' THEN '[VPN_IPs].[VPNIP]'
                        WHEN 'VPNIP DESC' THEN '[VPN_IPs].[VPNIP] DESC'
                        WHEN 'UsedBy' THEN '[VPN_IPs].[UsedBy]'
                        WHEN 'UsedBy DESC' THEN '[VPN_IPs].[UsedBy] DESC'
                        WHEN 'Used' THEN '[VPN_IPs].[Used]'
                        WHEN 'Used DESC' THEN '[VPN_IPs].[Used] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        ELSE '[VPN_IPs].[VPNIP]'
                    END
  EXEC (@LGSQL)

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
