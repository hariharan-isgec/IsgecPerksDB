USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnSConfSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @C_OfficeID Int,
  @Configured Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,RequestID Int NOT NULL
  )
  INSERT INTO #PageIndex (RequestID)
  SELECT [VPN_ConnectivityAccess].[RequestID] FROM [VPN_ConnectivityAccess]
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
      [VPN_ConnectivityAccess].[C_OfficeID] = (@C_OfficeID)
  AND [VPN_ConnectivityAccess].[Configured] = (@Configured)
   AND ( 
         STR(ISNULL([VPN_ConnectivityAccess].[RequestID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VPN_ConnectivityAccess].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VPN_ConnectivityAccess].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([VPN_ConnectivityAccess].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VPN_ConnectivityAccess].[RequestedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VPN_ConnectivityAccess].[NetworkIP],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VPN_ConnectivityAccess].[VPNIP],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VPN_ConnectivityAccess].[VPNPassword],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VPN_ConnectivityAccess].[ConfiguredBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VPN_ConnectivityAccess].[ConfigurationRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VPN_ConnectivityAccess].[RemoveRequestedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VPN_ConnectivityAccess].[RemoveRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VPN_ConnectivityAccess].[RemovedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VPN_ConnectivityAccess].[RemovedRemarks],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'RequestID' THEN [VPN_ConnectivityAccess].[RequestID] END,
     CASE @orderBy WHEN 'RequestID DESC' THEN [VPN_ConnectivityAccess].[RequestID] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [VPN_ConnectivityAccess].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [VPN_ConnectivityAccess].[CardNo] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [VPN_ConnectivityAccess].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [VPN_ConnectivityAccess].[Remarks] END DESC,
     CASE @orderBy WHEN 'C_OfficeID' THEN [VPN_ConnectivityAccess].[C_OfficeID] END,
     CASE @orderBy WHEN 'C_OfficeID DESC' THEN [VPN_ConnectivityAccess].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'RequestedBy' THEN [VPN_ConnectivityAccess].[RequestedBy] END,
     CASE @orderBy WHEN 'RequestedBy DESC' THEN [VPN_ConnectivityAccess].[RequestedBy] END DESC,
     CASE @orderBy WHEN 'RequestedOn' THEN [VPN_ConnectivityAccess].[RequestedOn] END,
     CASE @orderBy WHEN 'RequestedOn DESC' THEN [VPN_ConnectivityAccess].[RequestedOn] END DESC,
     CASE @orderBy WHEN 'NetworkIP' THEN [VPN_ConnectivityAccess].[NetworkIP] END,
     CASE @orderBy WHEN 'NetworkIP DESC' THEN [VPN_ConnectivityAccess].[NetworkIP] END DESC,
     CASE @orderBy WHEN 'VPNIP' THEN [VPN_ConnectivityAccess].[VPNIP] END,
     CASE @orderBy WHEN 'VPNIP DESC' THEN [VPN_ConnectivityAccess].[VPNIP] END DESC,
     CASE @orderBy WHEN 'VPNPassword' THEN [VPN_ConnectivityAccess].[VPNPassword] END,
     CASE @orderBy WHEN 'VPNPassword DESC' THEN [VPN_ConnectivityAccess].[VPNPassword] END DESC,
     CASE @orderBy WHEN 'ConfiguredBy' THEN [VPN_ConnectivityAccess].[ConfiguredBy] END,
     CASE @orderBy WHEN 'ConfiguredBy DESC' THEN [VPN_ConnectivityAccess].[ConfiguredBy] END DESC,
     CASE @orderBy WHEN 'Configured' THEN [VPN_ConnectivityAccess].[Configured] END,
     CASE @orderBy WHEN 'Configured DESC' THEN [VPN_ConnectivityAccess].[Configured] END DESC,
     CASE @orderBy WHEN 'ConfiguredOn' THEN [VPN_ConnectivityAccess].[ConfiguredOn] END,
     CASE @orderBy WHEN 'ConfiguredOn DESC' THEN [VPN_ConnectivityAccess].[ConfiguredOn] END DESC,
     CASE @orderBy WHEN 'ConfigurationRemarks' THEN [VPN_ConnectivityAccess].[ConfigurationRemarks] END,
     CASE @orderBy WHEN 'ConfigurationRemarks DESC' THEN [VPN_ConnectivityAccess].[ConfigurationRemarks] END DESC,
     CASE @orderBy WHEN 'RemoveAccess' THEN [VPN_ConnectivityAccess].[RemoveAccess] END,
     CASE @orderBy WHEN 'RemoveAccess DESC' THEN [VPN_ConnectivityAccess].[RemoveAccess] END DESC,
     CASE @orderBy WHEN 'RemoveRequestedBy' THEN [VPN_ConnectivityAccess].[RemoveRequestedBy] END,
     CASE @orderBy WHEN 'RemoveRequestedBy DESC' THEN [VPN_ConnectivityAccess].[RemoveRequestedBy] END DESC,
     CASE @orderBy WHEN 'RemoveRequestedOn' THEN [VPN_ConnectivityAccess].[RemoveRequestedOn] END,
     CASE @orderBy WHEN 'RemoveRequestedOn DESC' THEN [VPN_ConnectivityAccess].[RemoveRequestedOn] END DESC,
     CASE @orderBy WHEN 'RemoveRemarks' THEN [VPN_ConnectivityAccess].[RemoveRemarks] END,
     CASE @orderBy WHEN 'RemoveRemarks DESC' THEN [VPN_ConnectivityAccess].[RemoveRemarks] END DESC,
     CASE @orderBy WHEN 'Removed' THEN [VPN_ConnectivityAccess].[Removed] END,
     CASE @orderBy WHEN 'Removed DESC' THEN [VPN_ConnectivityAccess].[Removed] END DESC,
     CASE @orderBy WHEN 'RemovedBy' THEN [VPN_ConnectivityAccess].[RemovedBy] END,
     CASE @orderBy WHEN 'RemovedBy DESC' THEN [VPN_ConnectivityAccess].[RemovedBy] END DESC,
     CASE @orderBy WHEN 'RemovedOn' THEN [VPN_ConnectivityAccess].[RemovedOn] END,
     CASE @orderBy WHEN 'RemovedOn DESC' THEN [VPN_ConnectivityAccess].[RemovedOn] END DESC,
     CASE @orderBy WHEN 'RemovedRemarks' THEN [VPN_ConnectivityAccess].[RemovedRemarks] END,
     CASE @orderBy WHEN 'RemovedRemarks DESC' THEN [VPN_ConnectivityAccess].[RemovedRemarks] END DESC,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users4_UserFullName' THEN [aspnet_Users4].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users4_UserFullName DESC' THEN [aspnet_Users4].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users5_UserFullName' THEN [aspnet_Users5].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users5_UserFullName DESC' THEN [aspnet_Users5].[UserFullName] END DESC,
     CASE @orderBy WHEN 'HRM_Offices6_Description' THEN [HRM_Offices6].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices6_Description DESC' THEN [HRM_Offices6].[Description] END DESC 

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
