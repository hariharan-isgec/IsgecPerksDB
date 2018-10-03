USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalRegisterComplaintsSelectByID]
  @CallID Int
  AS
  SELECT
		[CAL_Register].[CallID],
		[CAL_Register].[LoggedOn],
		[CAL_Register].[UserID],
		[CAL_Register].[CallTypeID],
		[CAL_Register].[CallDescription],
		[CAL_Register].[AttenderID],
		[CAL_Register].[Priority],
		[CAL_Register].[AttendedOn],
		[CAL_Register].[ResponseTime],
		[CAL_Register].[AttenderDescription],
		[CAL_Register].[AssignedOn],
		[CAL_Register].[CallStatusID],
		[CAL_Register].[ClosedOn],
		[CAL_Register].[SignedOffOn],
		[CAL_Register].[FileAttached],
		[CAL_Register].[FileExtention],
		[CAL_CallTypes1].[CallTypeID] AS CAL_CallTypes1_CallTypeID,
		[CAL_CallTypes1].[Description] AS CAL_CallTypes1_Description,
		[CAL_CallTypes1].[Priority] AS CAL_CallTypes1_Priority,
		[CAL_CallTypes1].[ResponseTime] AS CAL_CallTypes1_ResponseTime,
		[aspnet_Users3].[UserName] AS aspnet_Users3_UserName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[aspnet_Users3].[LocationID] AS aspnet_Users3_LocationID,
		[aspnet_Users3].[ExtnNo] AS aspnet_Users3_ExtnNo,
		[aspnet_Users3].[MobileNo] AS aspnet_Users3_MobileNo,
		[aspnet_Users3].[EMailID] AS aspnet_Users3_EMailID,
		[CAL_Priority2].[Priority] AS CAL_Priority2_Priority,
		[CAL_Priority2].[Description] AS CAL_Priority2_Description,
		[CAL_Status4].[CallStatusID] AS CAL_Status4_CallStatusID,
		[CAL_Status4].[Description] AS CAL_Status4_Description 
  FROM [CAL_Register] 
  LEFT OUTER JOIN [CAL_CallTypes] AS [CAL_CallTypes1]
    ON [CAL_Register].[CallTypeID] = [CAL_CallTypes1].[CallTypeID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [CAL_Register].[AttenderID] = [aspnet_Users3].[UserName]
  LEFT OUTER JOIN [CAL_Priority] AS [CAL_Priority2]
    ON [CAL_Register].[Priority] = [CAL_Priority2].[Priority]
  LEFT OUTER JOIN [CAL_Status] AS [CAL_Status4]
    ON [CAL_Register].[CallStatusID] = [CAL_Status4].[CallStatusID]
  WHERE
  [CAL_Register].[CallID] = @CallID
GO
