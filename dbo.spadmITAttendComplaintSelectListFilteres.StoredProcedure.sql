USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITAttendComplaintSelectListFilteres]
  @Filter_EndUserID NVarChar(8),
  @Filter_CallTypeID NVarChar(20),
  @Filter_CallStatusID NVarChar(20),
  @StartRowIndex int,
  @MaximumRows int,
  @AssignedTo NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CallID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CallID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ADM_ITComplaints].[CallID]'  SET @LGSQL = @LGSQL + ' FROM [ADM_ITComplaints] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ADM_ITCallStatus] AS [ADM_ITCallStatus1]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ITComplaints].[CallStatusID] = [ADM_ITCallStatus1].[CallStatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ADM_ITCallTypes] AS [ADM_ITCallTypes2]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ITComplaints].[CallTypeID] = [ADM_ITCallTypes2].[CallTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees5]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ITComplaints].[EndUserID] = [HRM_Employees5].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ITComplaints].[LoggedBy] = [aspnet_users3].[UserName]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_EndUserID > '') 
    SET @LGSQL = @LGSQL + ' AND [ADM_ITComplaints].[EndUserID] = ''' + @Filter_EndUserID + ''''
  IF (@Filter_CallTypeID > '') 
    SET @LGSQL = @LGSQL + ' AND [ADM_ITComplaints].[CallTypeID] = ''' + @Filter_CallTypeID + ''''
  IF (@Filter_CallStatusID > '') 
    SET @LGSQL = @LGSQL + ' AND [ADM_ITComplaints].[CallStatusID] = ''' + @Filter_CallStatusID + ''''
  SET @LGSQL = @LGSQL + ' AND [ADM_ITComplaints].[AssignedTo] = ''' + @AssignedTo + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CallID' THEN '[ADM_ITComplaints].[CallID]'
                        WHEN 'CallID DESC' THEN '[ADM_ITComplaints].[CallID] DESC'
                        WHEN 'EndUserID' THEN '[ADM_ITComplaints].[EndUserID]'
                        WHEN 'EndUserID DESC' THEN '[ADM_ITComplaints].[EndUserID] DESC'
                        WHEN 'CallTypeID' THEN '[ADM_ITComplaints].[CallTypeID]'
                        WHEN 'CallTypeID DESC' THEN '[ADM_ITComplaints].[CallTypeID] DESC'
                        WHEN 'Description' THEN '[ADM_ITComplaints].[Description]'
                        WHEN 'Description DESC' THEN '[ADM_ITComplaints].[Description] DESC'
                        WHEN 'AssignedTo' THEN '[ADM_ITComplaints].[AssignedTo]'
                        WHEN 'AssignedTo DESC' THEN '[ADM_ITComplaints].[AssignedTo] DESC'
                        WHEN 'CallStatusID' THEN '[ADM_ITComplaints].[CallStatusID]'
                        WHEN 'CallStatusID DESC' THEN '[ADM_ITComplaints].[CallStatusID] DESC'
                        WHEN 'LoggedOn' THEN '[ADM_ITComplaints].[LoggedOn]'
                        WHEN 'LoggedOn DESC' THEN '[ADM_ITComplaints].[LoggedOn] DESC'
                        WHEN 'LoggedBy' THEN '[ADM_ITComplaints].[LoggedBy]'
                        WHEN 'LoggedBy DESC' THEN '[ADM_ITComplaints].[LoggedBy] DESC'
                        WHEN 'FirstAttended' THEN '[ADM_ITComplaints].[FirstAttended]'
                        WHEN 'FirstAttended DESC' THEN '[ADM_ITComplaints].[FirstAttended] DESC'
                        WHEN 'FirstAttendedOn' THEN '[ADM_ITComplaints].[FirstAttendedOn]'
                        WHEN 'FirstAttendedOn DESC' THEN '[ADM_ITComplaints].[FirstAttendedOn] DESC'
                        WHEN 'Closed' THEN '[ADM_ITComplaints].[Closed]'
                        WHEN 'Closed DESC' THEN '[ADM_ITComplaints].[Closed] DESC'
                        WHEN 'ClosedOn' THEN '[ADM_ITComplaints].[ClosedOn]'
                        WHEN 'ClosedOn DESC' THEN '[ADM_ITComplaints].[ClosedOn] DESC'
                        WHEN 'ADM_ITCallStatus1_CallStatusID' THEN '[ADM_ITCallStatus1].[CallStatusID]'
                        WHEN 'ADM_ITCallStatus1_CallStatusID DESC' THEN '[ADM_ITCallStatus1].[CallStatusID] DESC'
                        WHEN 'ADM_ITCallStatus1_Description' THEN '[ADM_ITCallStatus1].[Description]'
                        WHEN 'ADM_ITCallStatus1_Description DESC' THEN '[ADM_ITCallStatus1].[Description] DESC'
                        WHEN 'ADM_ITCallTypes2_CallTypeID' THEN '[ADM_ITCallTypes2].[CallTypeID]'
                        WHEN 'ADM_ITCallTypes2_CallTypeID DESC' THEN '[ADM_ITCallTypes2].[CallTypeID] DESC'
                        WHEN 'ADM_ITCallTypes2_Description' THEN '[ADM_ITCallTypes2].[Description]'
                        WHEN 'ADM_ITCallTypes2_Description DESC' THEN '[ADM_ITCallTypes2].[Description] DESC'
                        WHEN 'HRM_Employees5_CardNo' THEN '[HRM_Employees5].[CardNo]'
                        WHEN 'HRM_Employees5_CardNo DESC' THEN '[HRM_Employees5].[CardNo] DESC'
                        WHEN 'HRM_Employees5_EmployeeName' THEN '[HRM_Employees5].[EmployeeName]'
                        WHEN 'HRM_Employees5_EmployeeName DESC' THEN '[HRM_Employees5].[EmployeeName] DESC'
                        WHEN 'HRM_Employees5_C_OfficeID' THEN '[HRM_Employees5].[C_OfficeID]'
                        WHEN 'HRM_Employees5_C_OfficeID DESC' THEN '[HRM_Employees5].[C_OfficeID] DESC'
                        WHEN 'aspnet_users3_UserName' THEN '[aspnet_users3].[UserName]'
                        WHEN 'aspnet_users3_UserName DESC' THEN '[aspnet_users3].[UserName] DESC'
                        WHEN 'aspnet_users3_UserFullName' THEN '[aspnet_users3].[UserFullName]'
                        WHEN 'aspnet_users3_UserFullName DESC' THEN '[aspnet_users3].[UserFullName] DESC'
                        WHEN 'aspnet_users3_LocationID' THEN '[aspnet_users3].[LocationID]'
                        WHEN 'aspnet_users3_LocationID DESC' THEN '[aspnet_users3].[LocationID] DESC'
                        WHEN 'aspnet_users3_ExtnNo' THEN '[aspnet_users3].[ExtnNo]'
                        WHEN 'aspnet_users3_ExtnNo DESC' THEN '[aspnet_users3].[ExtnNo] DESC'
                        WHEN 'aspnet_users3_MobileNo' THEN '[aspnet_users3].[MobileNo]'
                        WHEN 'aspnet_users3_MobileNo DESC' THEN '[aspnet_users3].[MobileNo] DESC'
                        WHEN 'aspnet_users3_EMailID' THEN '[aspnet_users3].[EMailID]'
                        WHEN 'aspnet_users3_EMailID DESC' THEN '[aspnet_users3].[EMailID] DESC'
                        WHEN 'aspnet_users3_C_OfficeID' THEN '[aspnet_users3].[C_OfficeID]'
                        WHEN 'aspnet_users3_C_OfficeID DESC' THEN '[aspnet_users3].[C_OfficeID] DESC'
                        WHEN 'aspnet_users3_C_DepartmentID' THEN '[aspnet_users3].[C_DepartmentID]'
                        WHEN 'aspnet_users3_C_DepartmentID DESC' THEN '[aspnet_users3].[C_DepartmentID] DESC'
                        ELSE '[ADM_ITComplaints].[CallID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ADM_ITComplaints].[CallID],
		[ADM_ITComplaints].[EndUserID],
		[ADM_ITComplaints].[CallTypeID],
		[ADM_ITComplaints].[Description],
		[ADM_ITComplaints].[AssignedTo],
		[ADM_ITComplaints].[CallStatusID],
		[ADM_ITComplaints].[LoggedOn],
		[ADM_ITComplaints].[LoggedBy],
		[ADM_ITComplaints].[FirstAttended],
		[ADM_ITComplaints].[FirstAttendedOn],
		[ADM_ITComplaints].[Closed],
		[ADM_ITComplaints].[ClosedOn],
		[ADM_ITCallStatus1].[CallStatusID] AS ADM_ITCallStatus1_CallStatusID,
		[ADM_ITCallStatus1].[Description] AS ADM_ITCallStatus1_Description,
		[ADM_ITCallTypes2].[CallTypeID] AS ADM_ITCallTypes2_CallTypeID,
		[ADM_ITCallTypes2].[Description] AS ADM_ITCallTypes2_Description,
		[HRM_Employees5].[CardNo] AS HRM_Employees5_CardNo,
		[HRM_Employees5].[EmployeeName] AS HRM_Employees5_EmployeeName,
		[HRM_Employees5].[C_OfficeID] AS HRM_Employees5_C_OfficeID,
		[aspnet_users3].[UserName] AS aspnet_users3_UserName,
		[aspnet_users3].[UserFullName] AS aspnet_users3_UserFullName,
		[aspnet_users3].[LocationID] AS aspnet_users3_LocationID,
		[aspnet_users3].[ExtnNo] AS aspnet_users3_ExtnNo,
		[aspnet_users3].[MobileNo] AS aspnet_users3_MobileNo,
		[aspnet_users3].[EMailID] AS aspnet_users3_EMailID,
		[aspnet_users3].[C_OfficeID] AS aspnet_users3_C_OfficeID,
		[aspnet_users3].[C_DepartmentID] AS aspnet_users3_C_DepartmentID 
  FROM [ADM_ITComplaints] 
    	INNER JOIN #PageIndex
          ON [ADM_ITComplaints].[CallID] = #PageIndex.CallID
  LEFT OUTER JOIN [ADM_ITCallStatus] AS [ADM_ITCallStatus1]
    ON [ADM_ITComplaints].[CallStatusID] = [ADM_ITCallStatus1].[CallStatusID]
  LEFT OUTER JOIN [ADM_ITCallTypes] AS [ADM_ITCallTypes2]
    ON [ADM_ITComplaints].[CallTypeID] = [ADM_ITCallTypes2].[CallTypeID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [ADM_ITComplaints].[EndUserID] = [HRM_Employees5].[CardNo]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [ADM_ITComplaints].[LoggedBy] = [aspnet_users3].[UserName]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
