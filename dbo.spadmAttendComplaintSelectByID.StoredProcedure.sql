USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmAttendComplaintSelectByID]
  @CallID Int 
  AS
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
  LEFT OUTER JOIN [ADM_CallStatus] AS [ADM_CallStatus1]
    ON [ADM_Complaints].[CallStatusID] = [ADM_CallStatus1].[CallStatusID]
  LEFT OUTER JOIN [ADM_CallTypes] AS [ADM_CallTypes2]
    ON [ADM_Complaints].[CallTypeID] = [ADM_CallTypes2].[CallTypeID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [ADM_Complaints].[EndUserID] = [HRM_Employees5].[CardNo]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [ADM_Complaints].[LoggedBy] = [aspnet_users3].[UserName]
  WHERE
  [ADM_Complaints].[CallID] = @CallID
GO
