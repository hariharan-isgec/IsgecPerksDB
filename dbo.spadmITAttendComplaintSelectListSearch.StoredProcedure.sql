USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITAttendComplaintSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @AssignedTo NVarChar(8),
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
  SELECT [ADM_ITComplaints].[CallID] FROM [ADM_ITComplaints]
  LEFT OUTER JOIN [ADM_ITCallStatus] AS [ADM_ITCallStatus1]
    ON [ADM_ITComplaints].[CallStatusID] = [ADM_ITCallStatus1].[CallStatusID]
  LEFT OUTER JOIN [ADM_ITCallTypes] AS [ADM_ITCallTypes2]
    ON [ADM_ITComplaints].[CallTypeID] = [ADM_ITCallTypes2].[CallTypeID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [ADM_ITComplaints].[EndUserID] = [HRM_Employees5].[CardNo]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [ADM_ITComplaints].[LoggedBy] = [aspnet_users3].[UserName]
 WHERE  
      [ADM_ITComplaints].[AssignedTo] = @AssignedTo
   AND ( 
         STR(ISNULL([ADM_ITComplaints].[CallID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITComplaints].[EndUserID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITComplaints].[CallTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITComplaints].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITComplaints].[AssignedTo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITComplaints].[CallStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITComplaints].[LoggedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITCallStatus1].[CallStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITCallStatus1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITCallTypes2].[CallTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITCallTypes2].[Description],'')) LIKE @KeyWord1
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
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CallID' THEN [ADM_ITComplaints].[CallID] END,
     CASE @orderBy WHEN 'CallID DESC' THEN [ADM_ITComplaints].[CallID] END DESC,
     CASE @orderBy WHEN 'EndUserID' THEN [ADM_ITComplaints].[EndUserID] END,
     CASE @orderBy WHEN 'EndUserID DESC' THEN [ADM_ITComplaints].[EndUserID] END DESC,
     CASE @orderBy WHEN 'CallTypeID' THEN [ADM_ITComplaints].[CallTypeID] END,
     CASE @orderBy WHEN 'CallTypeID DESC' THEN [ADM_ITComplaints].[CallTypeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ADM_ITComplaints].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ADM_ITComplaints].[Description] END DESC,
     CASE @orderBy WHEN 'AssignedTo' THEN [ADM_ITComplaints].[AssignedTo] END,
     CASE @orderBy WHEN 'AssignedTo DESC' THEN [ADM_ITComplaints].[AssignedTo] END DESC,
     CASE @orderBy WHEN 'CallStatusID' THEN [ADM_ITComplaints].[CallStatusID] END,
     CASE @orderBy WHEN 'CallStatusID DESC' THEN [ADM_ITComplaints].[CallStatusID] END DESC,
     CASE @orderBy WHEN 'LoggedOn' THEN [ADM_ITComplaints].[LoggedOn] END,
     CASE @orderBy WHEN 'LoggedOn DESC' THEN [ADM_ITComplaints].[LoggedOn] END DESC,
     CASE @orderBy WHEN 'LoggedBy' THEN [ADM_ITComplaints].[LoggedBy] END,
     CASE @orderBy WHEN 'LoggedBy DESC' THEN [ADM_ITComplaints].[LoggedBy] END DESC,
     CASE @orderBy WHEN 'FirstAttended' THEN [ADM_ITComplaints].[FirstAttended] END,
     CASE @orderBy WHEN 'FirstAttended DESC' THEN [ADM_ITComplaints].[FirstAttended] END DESC,
     CASE @orderBy WHEN 'FirstAttendedOn' THEN [ADM_ITComplaints].[FirstAttendedOn] END,
     CASE @orderBy WHEN 'FirstAttendedOn DESC' THEN [ADM_ITComplaints].[FirstAttendedOn] END DESC,
     CASE @orderBy WHEN 'Closed' THEN [ADM_ITComplaints].[Closed] END,
     CASE @orderBy WHEN 'Closed DESC' THEN [ADM_ITComplaints].[Closed] END DESC,
     CASE @orderBy WHEN 'ClosedOn' THEN [ADM_ITComplaints].[ClosedOn] END,
     CASE @orderBy WHEN 'ClosedOn DESC' THEN [ADM_ITComplaints].[ClosedOn] END DESC,
     CASE @orderBy WHEN 'ADM_ITCallStatus1_CallStatusID' THEN [ADM_ITCallStatus1].[CallStatusID] END,
     CASE @orderBy WHEN 'ADM_ITCallStatus1_CallStatusID DESC' THEN [ADM_ITCallStatus1].[CallStatusID] END DESC,
     CASE @orderBy WHEN 'ADM_ITCallStatus1_Description' THEN [ADM_ITCallStatus1].[Description] END,
     CASE @orderBy WHEN 'ADM_ITCallStatus1_Description DESC' THEN [ADM_ITCallStatus1].[Description] END DESC,
     CASE @orderBy WHEN 'ADM_ITCallTypes2_CallTypeID' THEN [ADM_ITCallTypes2].[CallTypeID] END,
     CASE @orderBy WHEN 'ADM_ITCallTypes2_CallTypeID DESC' THEN [ADM_ITCallTypes2].[CallTypeID] END DESC,
     CASE @orderBy WHEN 'ADM_ITCallTypes2_Description' THEN [ADM_ITCallTypes2].[Description] END,
     CASE @orderBy WHEN 'ADM_ITCallTypes2_Description DESC' THEN [ADM_ITCallTypes2].[Description] END DESC,
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
     CASE @orderBy WHEN 'aspnet_users3_C_DepartmentID DESC' THEN [aspnet_users3].[C_DepartmentID] END DESC 

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
