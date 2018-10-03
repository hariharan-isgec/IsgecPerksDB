USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalAttendComplaintsSelectByID]
  @CallID Int
  AS
  SELECT
		[CAL_Register].[CallID],
		[CAL_Register].[UserID],
		[CAL_Register].[LoggedOn],
		[CAL_Register].[CallDescription],
		[CAL_Register].[CallTypeID],
		[CAL_Register].[AttenderID],
		[CAL_Register].[Priority],
		[CAL_Register].[AssignedOn],
		[CAL_Register].[ResponseTime],
		[CAL_Register].[AttendedOn],
		[CAL_Register].[AttenderDescription],
		[CAL_Register].[CallStatusID],
		[CAL_Register].[ClosedOn],
		[CAL_Register].[SignedOffOn],
		[CAL_Register].[FileAttached],
		[CAL_Register].[FileExtention],
		[aspnet_Users1].[UserName] AS aspnet_Users1_UserName,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users1].[LocationID] AS aspnet_Users1_LocationID,
		[aspnet_Users1].[ExtnNo] AS aspnet_Users1_ExtnNo,
		[aspnet_Users1].[MobileNo] AS aspnet_Users1_MobileNo,
		[aspnet_Users1].[EMailID] AS aspnet_Users1_EMailID,
		[CAL_CallTypes2].[CallTypeID] AS CAL_CallTypes2_CallTypeID,
		[CAL_CallTypes2].[Description] AS CAL_CallTypes2_Description,
		[CAL_CallTypes2].[Priority] AS CAL_CallTypes2_Priority,
		[CAL_CallTypes2].[ResponseTime] AS CAL_CallTypes2_ResponseTime,
		[aspnet_Users4].[UserName] AS aspnet_Users4_UserName,
		[aspnet_Users4].[UserFullName] AS aspnet_Users4_UserFullName,
		[aspnet_Users4].[LocationID] AS aspnet_Users4_LocationID,
		[aspnet_Users4].[ExtnNo] AS aspnet_Users4_ExtnNo,
		[aspnet_Users4].[MobileNo] AS aspnet_Users4_MobileNo,
		[aspnet_Users4].[EMailID] AS aspnet_Users4_EMailID,
		[CAL_Priority3].[Priority] AS CAL_Priority3_Priority,
		[CAL_Priority3].[Description] AS CAL_Priority3_Description,
		[CAL_Status5].[CallStatusID] AS CAL_Status5_CallStatusID,
		[CAL_Status5].[Description] AS CAL_Status5_Description 
  FROM [CAL_Register] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [CAL_Register].[UserID] = [aspnet_Users1].[UserName]
  LEFT OUTER JOIN [CAL_CallTypes] AS [CAL_CallTypes2]
    ON [CAL_Register].[CallTypeID] = [CAL_CallTypes2].[CallTypeID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]
    ON [CAL_Register].[AttenderID] = [aspnet_Users4].[UserName]
  LEFT OUTER JOIN [CAL_Priority] AS [CAL_Priority3]
    ON [CAL_Register].[Priority] = [CAL_Priority3].[Priority]
  LEFT OUTER JOIN [CAL_Status] AS [CAL_Status5]
    ON [CAL_Register].[CallStatusID] = [CAL_Status5].[CallStatusID]
  WHERE
  [CAL_Register].[CallID] = @CallID
GO
