USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmAttendComplaintSelectListFilteres]
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
  SET @LGSQL = @LGSQL + '[ADM_Complaints].[CallID]'  SET @LGSQL = @LGSQL + ' FROM [ADM_Complaints] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ADM_CallStatus] AS [ADM_CallStatus1]'
  SET @LGSQL = @LGSQL + '    ON [ADM_Complaints].[CallStatusID] = [ADM_CallStatus1].[CallStatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ADM_CallTypes] AS [ADM_CallTypes2]'
  SET @LGSQL = @LGSQL + '    ON [ADM_Complaints].[CallTypeID] = [ADM_CallTypes2].[CallTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees5]'
  SET @LGSQL = @LGSQL + '    ON [ADM_Complaints].[EndUserID] = [HRM_Employees5].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]'
  SET @LGSQL = @LGSQL + '    ON [ADM_Complaints].[LoggedBy] = [aspnet_users3].[UserName]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_EndUserID > '') 
    SET @LGSQL = @LGSQL + ' AND [ADM_Complaints].[EndUserID] = ''' + @Filter_EndUserID + ''''
  IF (@Filter_CallTypeID > '') 
    SET @LGSQL = @LGSQL + ' AND [ADM_Complaints].[CallTypeID] = ''' + @Filter_CallTypeID + ''''
  IF (@Filter_CallStatusID > '') 
    SET @LGSQL = @LGSQL + ' AND [ADM_Complaints].[CallStatusID] = ''' + @Filter_CallStatusID + ''''
  SET @LGSQL = @LGSQL + ' AND [ADM_Complaints].[AssignedTo] = ''' + @AssignedTo + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CallID' THEN '[ADM_Complaints].[CallID]'
                        WHEN 'CallID DESC' THEN '[ADM_Complaints].[CallID] DESC'
                        WHEN 'EndUserID' THEN '[ADM_Complaints].[EndUserID]'
                        WHEN 'EndUserID DESC' THEN '[ADM_Complaints].[EndUserID] DESC'
                        WHEN 'CallTypeID' THEN '[ADM_Complaints].[CallTypeID]'
                        WHEN 'CallTypeID DESC' THEN '[ADM_Complaints].[CallTypeID] DESC'
                        WHEN 'Description' THEN '[ADM_Complaints].[Description]'
                        WHEN 'Description DESC' THEN '[ADM_Complaints].[Description] DESC'
                        WHEN 'AssignedTo' THEN '[ADM_Complaints].[AssignedTo]'
                        WHEN 'AssignedTo DESC' THEN '[ADM_Complaints].[AssignedTo] DESC'
                        WHEN 'CallStatusID' THEN '[ADM_Complaints].[CallStatusID]'
                        WHEN 'CallStatusID DESC' THEN '[ADM_Complaints].[CallStatusID] DESC'
                        WHEN 'LoggedOn' THEN '[ADM_Complaints].[LoggedOn]'
                        WHEN 'LoggedOn DESC' THEN '[ADM_Complaints].[LoggedOn] DESC'
                        WHEN 'LoggedBy' THEN '[ADM_Complaints].[LoggedBy]'
                        WHEN 'LoggedBy DESC' THEN '[ADM_Complaints].[LoggedBy] DESC'
                        WHEN 'FirstAttended' THEN '[ADM_Complaints].[FirstAttended]'
                        WHEN 'FirstAttended DESC' THEN '[ADM_Complaints].[FirstAttended] DESC'
                        WHEN 'FirstAttendedOn' THEN '[ADM_Complaints].[FirstAttendedOn]'
                        WHEN 'FirstAttendedOn DESC' THEN '[ADM_Complaints].[FirstAttendedOn] DESC'
                        WHEN 'Closed' THEN '[ADM_Complaints].[Closed]'
                        WHEN 'Closed DESC' THEN '[ADM_Complaints].[Closed] DESC'
                        WHEN 'ClosedOn' THEN '[ADM_Complaints].[ClosedOn]'
                        WHEN 'ClosedOn DESC' THEN '[ADM_Complaints].[ClosedOn] DESC'
                        WHEN 'ADM_CallStatus1_CallStatusID' THEN '[ADM_CallStatus1].[CallStatusID]'
                        WHEN 'ADM_CallStatus1_CallStatusID DESC' THEN '[ADM_CallStatus1].[CallStatusID] DESC'
                        WHEN 'ADM_CallStatus1_Description' THEN '[ADM_CallStatus1].[Description]'
                        WHEN 'ADM_CallStatus1_Description DESC' THEN '[ADM_CallStatus1].[Description] DESC'
                        WHEN 'ADM_CallTypes2_CallTypeID' THEN '[ADM_CallTypes2].[CallTypeID]'
                        WHEN 'ADM_CallTypes2_CallTypeID DESC' THEN '[ADM_CallTypes2].[CallTypeID] DESC'
                        WHEN 'ADM_CallTypes2_Description' THEN '[ADM_CallTypes2].[Description]'
                        WHEN 'ADM_CallTypes2_Description DESC' THEN '[ADM_CallTypes2].[Description] DESC'
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
                        ELSE '[ADM_Complaints].[CallID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ADM_Complaints].[CallID],
		[ADM_Complaints].[EndUserID],
		[ADM_Complaints].[CallTypeID],
		[ADM_Complaints].[Description],
		[ADM_Complaints].[AssignedTo],
		[ADM_Complaints].[CallStatusID],
		[ADM_Complaints].[LoggedOn],
		[ADM_Complaints].[LoggedBy],
		[ADM_Complaints].[FirstAttended],
		[ADM_Complaints].[FirstAttendedOn],
		[ADM_Complaints].[Closed],
		[ADM_Complaints].[ClosedOn],
		[ADM_CallStatus1].[CallStatusID] AS ADM_CallStatus1_CallStatusID,
		[ADM_CallStatus1].[Description] AS ADM_CallStatus1_Description,
		[ADM_CallTypes2].[CallTypeID] AS ADM_CallTypes2_CallTypeID,
		[ADM_CallTypes2].[Description] AS ADM_CallTypes2_Description,
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
  FROM [ADM_Complaints] 
    	INNER JOIN #PageIndex
          ON [ADM_Complaints].[CallID] = #PageIndex.CallID
  LEFT OUTER JOIN [ADM_CallStatus] AS [ADM_CallStatus1]
    ON [ADM_Complaints].[CallStatusID] = [ADM_CallStatus1].[CallStatusID]
  LEFT OUTER JOIN [ADM_CallTypes] AS [ADM_CallTypes2]
    ON [ADM_Complaints].[CallTypeID] = [ADM_CallTypes2].[CallTypeID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [ADM_Complaints].[EndUserID] = [HRM_Employees5].[CardNo]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [ADM_Complaints].[LoggedBy] = [aspnet_users3].[UserName]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
