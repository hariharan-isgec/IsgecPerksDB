USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spadmITRegisterComplaintSelectByID]
  @CallID Int 
  AS
  SELECT
		[ADM_ITComplaints].[CallID] ,
		[ADM_ITComplaints].[EndUserID] ,
		[ADM_ITComplaints].[CallTypeID] ,
		[ADM_ITComplaints].[Description] ,
		[ADM_ITComplaints].[CallSubTypeID] ,
		[ADM_ITComplaints].[AssignedTo] ,
		[ADM_ITComplaints].[CallStatusID] ,
		[ADM_ITComplaints].[LoggedOn] ,
		[ADM_ITComplaints].[LoggedBy] ,
		[ADM_ITComplaints].[FirstAttended] ,
		[ADM_ITComplaints].[FirstAttendedOn] ,
		[ADM_ITComplaints].[Closed] ,
		[ADM_ITComplaints].[ClosedOn] ,
		[ADM_ITComplaints].[CallReceivedOn] ,
		[ADM_ITComplaints].[CallConverted] ,
		[ADM_ITComplaints].[ConvertedReference] ,
		[ADM_ITComplaints].[ConvertedRemarks] ,
		[ADM_ITComplaints].[Feedback] ,
		[ADM_ITCallStatus1].[Description] AS ADM_ITCallStatus1_Description,
		[ADM_ITCallTypes2].[Description] AS ADM_ITCallTypes2_Description,
		[HRM_Employees5].[EmployeeName] AS HRM_Employees5_EmployeeName,
		[aspnet_users3].[UserFullName] AS aspnet_users3_UserFullName,
		[aspnet_users4].[UserFullName] AS aspnet_users4_UserFullName,
		[ADM_ITCallSubTypes6].[Description] AS ADM_ITCallSubTypes6_Description 
  FROM [ADM_ITComplaints] 
  LEFT OUTER JOIN [ADM_ITCallStatus] AS [ADM_ITCallStatus1]
    ON [ADM_ITComplaints].[CallStatusID] = [ADM_ITCallStatus1].[CallStatusID]
  LEFT OUTER JOIN [ADM_ITCallTypes] AS [ADM_ITCallTypes2]
    ON [ADM_ITComplaints].[CallTypeID] = [ADM_ITCallTypes2].[CallTypeID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [ADM_ITComplaints].[EndUserID] = [HRM_Employees5].[CardNo]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [ADM_ITComplaints].[LoggedBy] = [aspnet_users3].[UserName]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users4]
    ON [ADM_ITComplaints].[AssignedTo] = [aspnet_users4].[UserName]
  LEFT OUTER JOIN [ADM_ITCallSubTypes] AS [ADM_ITCallSubTypes6]
    ON [ADM_ITComplaints].[CallTypeID] = [ADM_ITCallSubTypes6].[CallTypeID]
    AND [ADM_ITComplaints].[CallSubTypeID] = [ADM_ITCallSubTypes6].[CallSubTypeID]
  WHERE
  [ADM_ITComplaints].[CallID] = @CallID
GO
