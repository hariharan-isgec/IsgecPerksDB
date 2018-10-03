USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnSConfSelectListFilteres]
  @Filter_CardNo NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @C_OfficeID Int,
  @Configured Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,RequestID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RequestID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VPN_ConnectivityAccess].[RequestID]'
  SET @LGSQL = @LGSQL + ' FROM [VPN_ConnectivityAccess] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [VPN_ConnectivityAccess].[CardNo] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]'
  SET @LGSQL = @LGSQL + '    ON [VPN_ConnectivityAccess].[RequestedBy] = [aspnet_Users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]'
  SET @LGSQL = @LGSQL + '    ON [VPN_ConnectivityAccess].[ConfiguredBy] = [aspnet_Users3].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]'
  SET @LGSQL = @LGSQL + '    ON [VPN_ConnectivityAccess].[RemoveRequestedBy] = [aspnet_Users4].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users5]'
  SET @LGSQL = @LGSQL + '    ON [VPN_ConnectivityAccess].[RemovedBy] = [aspnet_Users5].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices6]'
  SET @LGSQL = @LGSQL + '    ON [VPN_ConnectivityAccess].[C_OfficeID] = [HRM_Offices6].[OfficeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [VPN_ConnectivityAccess].[C_OfficeID] = ''' + STR(@C_OfficeID) + '''' 
  SET @LGSQL = @LGSQL + ' AND [VPN_ConnectivityAccess].[Configured] = ''' + CONVERT(NVarChar(10), @Configured) + ''''
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [VPN_ConnectivityAccess].[CardNo] = ''' + @Filter_CardNo + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RequestID' THEN '[VPN_ConnectivityAccess].[RequestID]'
                        WHEN 'RequestID DESC' THEN '[VPN_ConnectivityAccess].[RequestID] DESC'
                        WHEN 'CardNo' THEN '[VPN_ConnectivityAccess].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[VPN_ConnectivityAccess].[CardNo] DESC'
                        WHEN 'Remarks' THEN '[VPN_ConnectivityAccess].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[VPN_ConnectivityAccess].[Remarks] DESC'
                        WHEN 'C_OfficeID' THEN '[VPN_ConnectivityAccess].[C_OfficeID]'
                        WHEN 'C_OfficeID DESC' THEN '[VPN_ConnectivityAccess].[C_OfficeID] DESC'
                        WHEN 'RequestedBy' THEN '[VPN_ConnectivityAccess].[RequestedBy]'
                        WHEN 'RequestedBy DESC' THEN '[VPN_ConnectivityAccess].[RequestedBy] DESC'
                        WHEN 'RequestedOn' THEN '[VPN_ConnectivityAccess].[RequestedOn]'
                        WHEN 'RequestedOn DESC' THEN '[VPN_ConnectivityAccess].[RequestedOn] DESC'
                        WHEN 'NetworkIP' THEN '[VPN_ConnectivityAccess].[NetworkIP]'
                        WHEN 'NetworkIP DESC' THEN '[VPN_ConnectivityAccess].[NetworkIP] DESC'
                        WHEN 'VPNIP' THEN '[VPN_ConnectivityAccess].[VPNIP]'
                        WHEN 'VPNIP DESC' THEN '[VPN_ConnectivityAccess].[VPNIP] DESC'
                        WHEN 'VPNPassword' THEN '[VPN_ConnectivityAccess].[VPNPassword]'
                        WHEN 'VPNPassword DESC' THEN '[VPN_ConnectivityAccess].[VPNPassword] DESC'
                        WHEN 'ConfiguredBy' THEN '[VPN_ConnectivityAccess].[ConfiguredBy]'
                        WHEN 'ConfiguredBy DESC' THEN '[VPN_ConnectivityAccess].[ConfiguredBy] DESC'
                        WHEN 'Configured' THEN '[VPN_ConnectivityAccess].[Configured]'
                        WHEN 'Configured DESC' THEN '[VPN_ConnectivityAccess].[Configured] DESC'
                        WHEN 'ConfiguredOn' THEN '[VPN_ConnectivityAccess].[ConfiguredOn]'
                        WHEN 'ConfiguredOn DESC' THEN '[VPN_ConnectivityAccess].[ConfiguredOn] DESC'
                        WHEN 'ConfigurationRemarks' THEN '[VPN_ConnectivityAccess].[ConfigurationRemarks]'
                        WHEN 'ConfigurationRemarks DESC' THEN '[VPN_ConnectivityAccess].[ConfigurationRemarks] DESC'
                        WHEN 'RemoveAccess' THEN '[VPN_ConnectivityAccess].[RemoveAccess]'
                        WHEN 'RemoveAccess DESC' THEN '[VPN_ConnectivityAccess].[RemoveAccess] DESC'
                        WHEN 'RemoveRequestedBy' THEN '[VPN_ConnectivityAccess].[RemoveRequestedBy]'
                        WHEN 'RemoveRequestedBy DESC' THEN '[VPN_ConnectivityAccess].[RemoveRequestedBy] DESC'
                        WHEN 'RemoveRequestedOn' THEN '[VPN_ConnectivityAccess].[RemoveRequestedOn]'
                        WHEN 'RemoveRequestedOn DESC' THEN '[VPN_ConnectivityAccess].[RemoveRequestedOn] DESC'
                        WHEN 'RemoveRemarks' THEN '[VPN_ConnectivityAccess].[RemoveRemarks]'
                        WHEN 'RemoveRemarks DESC' THEN '[VPN_ConnectivityAccess].[RemoveRemarks] DESC'
                        WHEN 'Removed' THEN '[VPN_ConnectivityAccess].[Removed]'
                        WHEN 'Removed DESC' THEN '[VPN_ConnectivityAccess].[Removed] DESC'
                        WHEN 'RemovedBy' THEN '[VPN_ConnectivityAccess].[RemovedBy]'
                        WHEN 'RemovedBy DESC' THEN '[VPN_ConnectivityAccess].[RemovedBy] DESC'
                        WHEN 'RemovedOn' THEN '[VPN_ConnectivityAccess].[RemovedOn]'
                        WHEN 'RemovedOn DESC' THEN '[VPN_ConnectivityAccess].[RemovedOn] DESC'
                        WHEN 'RemovedRemarks' THEN '[VPN_ConnectivityAccess].[RemovedRemarks]'
                        WHEN 'RemovedRemarks DESC' THEN '[VPN_ConnectivityAccess].[RemovedRemarks] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
                        WHEN 'aspnet_Users4_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users4_UserFullName DESC' THEN '[aspnet_Users4].[UserFullName] DESC'
                        WHEN 'aspnet_Users5_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users5_UserFullName DESC' THEN '[aspnet_Users5].[UserFullName] DESC'
                        WHEN 'HRM_Offices6_Description' THEN '[HRM_Offices].[Description]'
                        WHEN 'HRM_Offices6_Description DESC' THEN '[HRM_Offices6].[Description] DESC'
                        ELSE '[VPN_ConnectivityAccess].[RequestID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[VPN_ConnectivityAccess].[RequestID] ,
		[VPN_ConnectivityAccess].[CardNo] ,
		[VPN_ConnectivityAccess].[Remarks] ,
		[VPN_ConnectivityAccess].[C_OfficeID] ,
		[VPN_ConnectivityAccess].[RequestedBy] ,
		[VPN_ConnectivityAccess].[RequestedOn] ,
		[VPN_ConnectivityAccess].[NetworkIP] ,
		[VPN_ConnectivityAccess].[VPNIP] ,
		[VPN_ConnectivityAccess].[VPNPassword] ,
		[VPN_ConnectivityAccess].[ConfiguredBy] ,
		[VPN_ConnectivityAccess].[Configured] ,
		[VPN_ConnectivityAccess].[ConfiguredOn] ,
		[VPN_ConnectivityAccess].[ConfigurationRemarks] ,
		[VPN_ConnectivityAccess].[RemoveAccess] ,
		[VPN_ConnectivityAccess].[RemoveRequestedBy] ,
		[VPN_ConnectivityAccess].[RemoveRequestedOn] ,
		[VPN_ConnectivityAccess].[RemoveRemarks] ,
		[VPN_ConnectivityAccess].[Removed] ,
		[VPN_ConnectivityAccess].[RemovedBy] ,
		[VPN_ConnectivityAccess].[RemovedOn] ,
		[VPN_ConnectivityAccess].[RemovedRemarks] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[aspnet_Users4].[UserFullName] AS aspnet_Users4_UserFullName,
		[aspnet_Users5].[UserFullName] AS aspnet_Users5_UserFullName,
		[HRM_Offices6].[Description] AS HRM_Offices6_Description 
  FROM [VPN_ConnectivityAccess] 
    	INNER JOIN #PageIndex
          ON [VPN_ConnectivityAccess].[RequestID] = #PageIndex.RequestID
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VPN_ConnectivityAccess].[CardNo] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [VPN_ConnectivityAccess].[RequestedBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [VPN_ConnectivityAccess].[ConfiguredBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]
    ON [VPN_ConnectivityAccess].[RemoveRequestedBy] = [aspnet_Users4].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users5]
    ON [VPN_ConnectivityAccess].[RemovedBy] = [aspnet_Users5].[LoginID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices6]
    ON [VPN_ConnectivityAccess].[C_OfficeID] = [HRM_Offices6].[OfficeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
