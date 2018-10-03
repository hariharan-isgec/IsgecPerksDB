USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmRegisterComplaintSelectListSearch]
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
 ,CallID Int NOT NULL
  )
  INSERT INTO #PageIndex (CallID)
  SELECT [ADM_Complaints].[CallID] FROM [ADM_Complaints]
  LEFT OUTER JOIN [ADM_CallStatus] AS [ADM_CallStatus1]
    ON [ADM_Complaints].[CallStatusID] = [ADM_CallStatus1].[CallStatusID]
  LEFT OUTER JOIN [ADM_CallTypes] AS [ADM_CallTypes2]
    ON [ADM_Complaints].[CallTypeID] = [ADM_CallTypes2].[CallTypeID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [ADM_Complaints].[EndUserID] = [HRM_Employees5].[CardNo]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [ADM_Complaints].[LoggedBy] = [aspnet_users3].[UserName]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users4]
    ON [ADM_Complaints].[AssignedTo] = [aspnet_users4].[UserName]
 WHERE  
   ( 
         STR(ISNULL([ADM_Complaints].[CallID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Complaints].[EndUserID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Complaints].[CallTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Complaints].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Complaints].[AssignedTo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Complaints].[CallStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Complaints].[LoggedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_CallStatus1].[CallStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_CallStatus1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_CallTypes2].[CallTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_CallTypes2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees5].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees5].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees5].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees5].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees5].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_users3].[UserName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_users3].[UserFullName],'')) LIKE @KeyWord1
     OR STR(ISNULL([aspnet_users3].[LocationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_users3].[ExtnNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_users3].[MobileNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_users3].[EMailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_users3].[C_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_users3].[C_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([aspnet_users3].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_users3].[C_DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_users3].[C_ProjectSiteID],'')) LIKE @KeyWord1
     OR STR(ISNULL([aspnet_users3].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_users4].[UserName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_users4].[UserFullName],'')) LIKE @KeyWord1
     OR STR(ISNULL([aspnet_users4].[LocationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_users4].[ExtnNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_users4].[MobileNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_users4].[EMailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_users4].[C_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_users4].[C_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([aspnet_users4].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_users4].[C_DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_users4].[C_ProjectSiteID],'')) LIKE @KeyWord1
     OR STR(ISNULL([aspnet_users4].[C_DesignationID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CallID' THEN [ADM_Complaints].[CallID] END,
     CASE @orderBy WHEN 'CallID DESC' THEN [ADM_Complaints].[CallID] END DESC,
     CASE @orderBy WHEN 'EndUserID' THEN [ADM_Complaints].[EndUserID] END,
     CASE @orderBy WHEN 'EndUserID DESC' THEN [ADM_Complaints].[EndUserID] END DESC,
     CASE @orderBy WHEN 'CallTypeID' THEN [ADM_Complaints].[CallTypeID] END,
     CASE @orderBy WHEN 'CallTypeID DESC' THEN [ADM_Complaints].[CallTypeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ADM_Complaints].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ADM_Complaints].[Description] END DESC,
     CASE @orderBy WHEN 'AssignedTo' THEN [ADM_Complaints].[AssignedTo] END,
     CASE @orderBy WHEN 'AssignedTo DESC' THEN [ADM_Complaints].[AssignedTo] END DESC,
     CASE @orderBy WHEN 'CallStatusID' THEN [ADM_Complaints].[CallStatusID] END,
     CASE @orderBy WHEN 'CallStatusID DESC' THEN [ADM_Complaints].[CallStatusID] END DESC,
     CASE @orderBy WHEN 'LoggedOn' THEN [ADM_Complaints].[LoggedOn] END,
     CASE @orderBy WHEN 'LoggedOn DESC' THEN [ADM_Complaints].[LoggedOn] END DESC,
     CASE @orderBy WHEN 'LoggedBy' THEN [ADM_Complaints].[LoggedBy] END,
     CASE @orderBy WHEN 'LoggedBy DESC' THEN [ADM_Complaints].[LoggedBy] END DESC,
     CASE @orderBy WHEN 'FirstAttended' THEN [ADM_Complaints].[FirstAttended] END,
     CASE @orderBy WHEN 'FirstAttended DESC' THEN [ADM_Complaints].[FirstAttended] END DESC,
     CASE @orderBy WHEN 'FirstAttendedOn' THEN [ADM_Complaints].[FirstAttendedOn] END,
     CASE @orderBy WHEN 'FirstAttendedOn DESC' THEN [ADM_Complaints].[FirstAttendedOn] END DESC,
     CASE @orderBy WHEN 'Closed' THEN [ADM_Complaints].[Closed] END,
     CASE @orderBy WHEN 'Closed DESC' THEN [ADM_Complaints].[Closed] END DESC,
     CASE @orderBy WHEN 'ClosedOn' THEN [ADM_Complaints].[ClosedOn] END,
     CASE @orderBy WHEN 'ClosedOn DESC' THEN [ADM_Complaints].[ClosedOn] END DESC,
     CASE @orderBy WHEN 'ADM_CallStatus1_CallStatusID' THEN [ADM_CallStatus1].[CallStatusID] END,
     CASE @orderBy WHEN 'ADM_CallStatus1_CallStatusID DESC' THEN [ADM_CallStatus1].[CallStatusID] END DESC,
     CASE @orderBy WHEN 'ADM_CallStatus1_Description' THEN [ADM_CallStatus1].[Description] END,
     CASE @orderBy WHEN 'ADM_CallStatus1_Description DESC' THEN [ADM_CallStatus1].[Description] END DESC,
     CASE @orderBy WHEN 'ADM_CallTypes2_CallTypeID' THEN [ADM_CallTypes2].[CallTypeID] END,
     CASE @orderBy WHEN 'ADM_CallTypes2_CallTypeID DESC' THEN [ADM_CallTypes2].[CallTypeID] END DESC,
     CASE @orderBy WHEN 'ADM_CallTypes2_Description' THEN [ADM_CallTypes2].[Description] END,
     CASE @orderBy WHEN 'ADM_CallTypes2_Description DESC' THEN [ADM_CallTypes2].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Employees5_CardNo' THEN [HRM_Employees5].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees5_CardNo DESC' THEN [HRM_Employees5].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees5_EmployeeName' THEN [HRM_Employees5].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees5_EmployeeName DESC' THEN [HRM_Employees5].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees5_C_OfficeID' THEN [HRM_Employees5].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees5_C_OfficeID DESC' THEN [HRM_Employees5].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'aspnet_users3_UserName' THEN [aspnet_users3].[UserName] END,
     CASE @orderBy WHEN 'aspnet_users3_UserName DESC' THEN [aspnet_users3].[UserName] END DESC,
     CASE @orderBy WHEN 'aspnet_users3_UserFullName' THEN [aspnet_users3].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_users3_UserFullName DESC' THEN [aspnet_users3].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_users3_LocationID' THEN [aspnet_users3].[LocationID] END,
     CASE @orderBy WHEN 'aspnet_users3_LocationID DESC' THEN [aspnet_users3].[LocationID] END DESC,
     CASE @orderBy WHEN 'aspnet_users3_ExtnNo' THEN [aspnet_users3].[ExtnNo] END,
     CASE @orderBy WHEN 'aspnet_users3_ExtnNo DESC' THEN [aspnet_users3].[ExtnNo] END DESC,
     CASE @orderBy WHEN 'aspnet_users3_MobileNo' THEN [aspnet_users3].[MobileNo] END,
     CASE @orderBy WHEN 'aspnet_users3_MobileNo DESC' THEN [aspnet_users3].[MobileNo] END DESC,
     CASE @orderBy WHEN 'aspnet_users3_EMailID' THEN [aspnet_users3].[EMailID] END,
     CASE @orderBy WHEN 'aspnet_users3_EMailID DESC' THEN [aspnet_users3].[EMailID] END DESC,
     CASE @orderBy WHEN 'aspnet_users3_C_OfficeID' THEN [aspnet_users3].[C_OfficeID] END,
     CASE @orderBy WHEN 'aspnet_users3_C_OfficeID DESC' THEN [aspnet_users3].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'aspnet_users3_C_DepartmentID' THEN [aspnet_users3].[C_DepartmentID] END,
     CASE @orderBy WHEN 'aspnet_users3_C_DepartmentID DESC' THEN [aspnet_users3].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'aspnet_users4_UserName' THEN [aspnet_users4].[UserName] END,
     CASE @orderBy WHEN 'aspnet_users4_UserName DESC' THEN [aspnet_users4].[UserName] END DESC,
     CASE @orderBy WHEN 'aspnet_users4_UserFullName' THEN [aspnet_users4].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_users4_UserFullName DESC' THEN [aspnet_users4].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_users4_LocationID' THEN [aspnet_users4].[LocationID] END,
     CASE @orderBy WHEN 'aspnet_users4_LocationID DESC' THEN [aspnet_users4].[LocationID] END DESC,
     CASE @orderBy WHEN 'aspnet_users4_ExtnNo' THEN [aspnet_users4].[ExtnNo] END,
     CASE @orderBy WHEN 'aspnet_users4_ExtnNo DESC' THEN [aspnet_users4].[ExtnNo] END DESC,
     CASE @orderBy WHEN 'aspnet_users4_MobileNo' THEN [aspnet_users4].[MobileNo] END,
     CASE @orderBy WHEN 'aspnet_users4_MobileNo DESC' THEN [aspnet_users4].[MobileNo] END DESC,
     CASE @orderBy WHEN 'aspnet_users4_EMailID' THEN [aspnet_users4].[EMailID] END,
     CASE @orderBy WHEN 'aspnet_users4_EMailID DESC' THEN [aspnet_users4].[EMailID] END DESC,
     CASE @orderBy WHEN 'aspnet_users4_C_OfficeID' THEN [aspnet_users4].[C_OfficeID] END,
     CASE @orderBy WHEN 'aspnet_users4_C_OfficeID DESC' THEN [aspnet_users4].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'aspnet_users4_C_DepartmentID' THEN [aspnet_users4].[C_DepartmentID] END,
     CASE @orderBy WHEN 'aspnet_users4_C_DepartmentID DESC' THEN [aspnet_users4].[C_DepartmentID] END DESC 

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
		[aspnet_users3].[C_DepartmentID] AS aspnet_users3_C_DepartmentID,
		[aspnet_users4].[UserName] AS aspnet_users4_UserName,
		[aspnet_users4].[UserFullName] AS aspnet_users4_UserFullName,
		[aspnet_users4].[LocationID] AS aspnet_users4_LocationID,
		[aspnet_users4].[ExtnNo] AS aspnet_users4_ExtnNo,
		[aspnet_users4].[MobileNo] AS aspnet_users4_MobileNo,
		[aspnet_users4].[EMailID] AS aspnet_users4_EMailID,
		[aspnet_users4].[C_OfficeID] AS aspnet_users4_C_OfficeID,
		[aspnet_users4].[C_DepartmentID] AS aspnet_users4_C_DepartmentID 
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
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users4]
    ON [ADM_Complaints].[AssignedTo] = [aspnet_users4].[UserName]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
