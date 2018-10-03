USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITAttendComplaintSelectByID]
  @CallID Int 
  AS
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
  LEFT OUTER JOIN [ADM_ITCallStatus] AS [ADM_ITCallStatus1]
    ON [ADM_ITComplaints].[CallStatusID] = [ADM_ITCallStatus1].[CallStatusID]
  LEFT OUTER JOIN [ADM_ITCallTypes] AS [ADM_ITCallTypes2]
    ON [ADM_ITComplaints].[CallTypeID] = [ADM_ITCallTypes2].[CallTypeID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [ADM_ITComplaints].[EndUserID] = [HRM_Employees5].[CardNo]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [ADM_ITComplaints].[LoggedBy] = [aspnet_users3].[UserName]
  WHERE
  [ADM_ITComplaints].[CallID] = @CallID
GO
