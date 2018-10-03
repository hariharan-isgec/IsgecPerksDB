USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalRegisterUserComplaintsSelectByID]
  @CallID Int
  AS
  SELECT
		[CAL_Register].[CallID],
		[CAL_Register].[LoggedOn],
		[CAL_Register].[UserID],
		[CAL_Register].[CallTypeID],
		[CAL_Register].[CallDescription],
		[CAL_Register].[Priority],
		[CAL_Register].[AttenderID],
		[CAL_Register].[ResponseTime],
		[CAL_Register].[AttendedOn],
		[CAL_Register].[AttenderDescription],
		[CAL_Register].[CallStatusID],
		[CAL_Register].[AssignedOn],
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
		[CAL_Priority4].[Priority] AS CAL_Priority4_Priority,
		[CAL_Priority4].[Description] AS CAL_Priority4_Description,
		[aspnet_Users3].[UserName] AS aspnet_Users3_UserName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[aspnet_Users3].[LocationID] AS aspnet_Users3_LocationID,
		[aspnet_Users3].[ExtnNo] AS aspnet_Users3_ExtnNo,
		[aspnet_Users3].[MobileNo] AS aspnet_Users3_MobileNo,
		[aspnet_Users3].[EMailID] AS aspnet_Users3_EMailID,
		[CAL_Status5].[CallStatusID] AS CAL_Status5_CallStatusID,
		[CAL_Status5].[Description] AS CAL_Status5_Description 
  FROM [CAL_Register] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [CAL_Register].[UserID] = [aspnet_Users1].[UserName]
  LEFT OUTER JOIN [CAL_CallTypes] AS [CAL_CallTypes2]
    ON [CAL_Register].[CallTypeID] = [CAL_CallTypes2].[CallTypeID]
  LEFT OUTER JOIN [CAL_Priority] AS [CAL_Priority4]
    ON [CAL_Register].[Priority] = [CAL_Priority4].[Priority]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [CAL_Register].[AttenderID] = [aspnet_Users3].[UserName]
  LEFT OUTER JOIN [CAL_Status] AS [CAL_Status5]
    ON [CAL_Register].[CallStatusID] = [CAL_Status5].[CallStatusID]
  WHERE
  [CAL_Register].[CallID] = @CallID
GO
