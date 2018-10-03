USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spolcRequestsSelectListFilteres]
  @Filter_CardNo NVarChar(8),
  @Filter_RequestedBy NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,RequestID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RequestID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[OLC_Requests].[RequestID]'
  SET @LGSQL = @LGSQL + ' FROM [OLC_Requests] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [OLC_Requests].[ConfiguredBy] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]'
  SET @LGSQL = @LGSQL + '    ON [OLC_Requests].[RemovedBy] = [aspnet_Users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]'
  SET @LGSQL = @LGSQL + '    ON [OLC_Requests].[RemoveRequestedBy] = [aspnet_Users3].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]'
  SET @LGSQL = @LGSQL + '    ON [OLC_Requests].[RequestedBy] = [aspnet_Users4].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees5]'
  SET @LGSQL = @LGSQL + '    ON [OLC_Requests].[CardNo] = [HRM_Employees5].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [OLC_Requests].[CardNo] = ''' + @Filter_CardNo + ''''
  IF (@Filter_RequestedBy > '') 
    SET @LGSQL = @LGSQL + ' AND [OLC_Requests].[RequestedBy] = ''' + @Filter_RequestedBy + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RequestID' THEN '[OLC_Requests].[RequestID]'
                        WHEN 'RequestID DESC' THEN '[OLC_Requests].[RequestID] DESC'
                        WHEN 'CardNo' THEN '[OLC_Requests].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[OLC_Requests].[CardNo] DESC'
                        WHEN 'Remarks' THEN '[OLC_Requests].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[OLC_Requests].[Remarks] DESC'
                        WHEN 'RequestedBy' THEN '[OLC_Requests].[RequestedBy]'
                        WHEN 'RequestedBy DESC' THEN '[OLC_Requests].[RequestedBy] DESC'
                        WHEN 'RequestedOn' THEN '[OLC_Requests].[RequestedOn]'
                        WHEN 'RequestedOn DESC' THEN '[OLC_Requests].[RequestedOn] DESC'
                        WHEN 'Configured' THEN '[OLC_Requests].[Configured]'
                        WHEN 'Configured DESC' THEN '[OLC_Requests].[Configured] DESC'
                        WHEN 'OLCPassword' THEN '[OLC_Requests].[OLCPassword]'
                        WHEN 'OLCPassword DESC' THEN '[OLC_Requests].[OLCPassword] DESC'
                        WHEN 'NetworkIP' THEN '[OLC_Requests].[NetworkIP]'
                        WHEN 'NetworkIP DESC' THEN '[OLC_Requests].[NetworkIP] DESC'
                        WHEN 'ConfiguredBy' THEN '[OLC_Requests].[ConfiguredBy]'
                        WHEN 'ConfiguredBy DESC' THEN '[OLC_Requests].[ConfiguredBy] DESC'
                        WHEN 'ConfiguredOn' THEN '[OLC_Requests].[ConfiguredOn]'
                        WHEN 'ConfiguredOn DESC' THEN '[OLC_Requests].[ConfiguredOn] DESC'
                        WHEN 'ConfigurationRemarks' THEN '[OLC_Requests].[ConfigurationRemarks]'
                        WHEN 'ConfigurationRemarks DESC' THEN '[OLC_Requests].[ConfigurationRemarks] DESC'
                        WHEN 'RemoveAccess' THEN '[OLC_Requests].[RemoveAccess]'
                        WHEN 'RemoveAccess DESC' THEN '[OLC_Requests].[RemoveAccess] DESC'
                        WHEN 'RemoveRequestedBy' THEN '[OLC_Requests].[RemoveRequestedBy]'
                        WHEN 'RemoveRequestedBy DESC' THEN '[OLC_Requests].[RemoveRequestedBy] DESC'
                        WHEN 'RemoveRequestedOn' THEN '[OLC_Requests].[RemoveRequestedOn]'
                        WHEN 'RemoveRequestedOn DESC' THEN '[OLC_Requests].[RemoveRequestedOn] DESC'
                        WHEN 'RemoveRemarks' THEN '[OLC_Requests].[RemoveRemarks]'
                        WHEN 'RemoveRemarks DESC' THEN '[OLC_Requests].[RemoveRemarks] DESC'
                        WHEN 'Removed' THEN '[OLC_Requests].[Removed]'
                        WHEN 'Removed DESC' THEN '[OLC_Requests].[Removed] DESC'
                        WHEN 'RemovedBy' THEN '[OLC_Requests].[RemovedBy]'
                        WHEN 'RemovedBy DESC' THEN '[OLC_Requests].[RemovedBy] DESC'
                        WHEN 'RemovedOn' THEN '[OLC_Requests].[RemovedOn]'
                        WHEN 'RemovedOn DESC' THEN '[OLC_Requests].[RemovedOn] DESC'
                        WHEN 'RemovedRemarks' THEN '[OLC_Requests].[RemovedRemarks]'
                        WHEN 'RemovedRemarks DESC' THEN '[OLC_Requests].[RemovedRemarks] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users3].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
                        WHEN 'aspnet_Users4_UserFullName' THEN '[aspnet_Users4].[UserFullName]'
                        WHEN 'aspnet_Users4_UserFullName DESC' THEN '[aspnet_Users4].[UserFullName] DESC'
                        WHEN 'HRM_Employees5_EmployeeName' THEN '[HRM_Employees5].[EmployeeName]'
                        WHEN 'HRM_Employees5_EmployeeName DESC' THEN '[HRM_Employees5].[EmployeeName] DESC'
                        ELSE '[OLC_Requests].[RequestID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[OLC_Requests].[RequestID] ,
		[OLC_Requests].[CardNo] ,
		[OLC_Requests].[Remarks] ,
		[OLC_Requests].[RequestedBy] ,
		[OLC_Requests].[RequestedOn] ,
		[OLC_Requests].[Configured] ,
		[OLC_Requests].[OLCPassword] ,
		[OLC_Requests].[NetworkIP] ,
		[OLC_Requests].[ConfiguredBy] ,
		[OLC_Requests].[ConfiguredOn] ,
		[OLC_Requests].[ConfigurationRemarks] ,
		[OLC_Requests].[RemoveAccess] ,
		[OLC_Requests].[RemoveRequestedBy] ,
		[OLC_Requests].[RemoveRequestedOn] ,
		[OLC_Requests].[RemoveRemarks] ,
		[OLC_Requests].[Removed] ,
		[OLC_Requests].[RemovedBy] ,
		[OLC_Requests].[RemovedOn] ,
		[OLC_Requests].[RemovedRemarks] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[aspnet_Users4].[UserFullName] AS aspnet_Users4_UserFullName,
		[HRM_Employees5].[EmployeeName] AS HRM_Employees5_EmployeeName 
  FROM [OLC_Requests] 
    	INNER JOIN #PageIndex
          ON [OLC_Requests].[RequestID] = #PageIndex.RequestID
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [OLC_Requests].[ConfiguredBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [OLC_Requests].[RemovedBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [OLC_Requests].[RemoveRequestedBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]
    ON [OLC_Requests].[RequestedBy] = [aspnet_Users4].[LoginID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [OLC_Requests].[CardNo] = [HRM_Employees5].[CardNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
