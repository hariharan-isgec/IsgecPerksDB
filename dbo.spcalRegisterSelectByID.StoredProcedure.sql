USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalRegisterSelectByID]
  @CallID Int
  AS
  SELECT
		[CAL_Register].[CallID],
		[CAL_Register].[UserID],
		[CAL_Register].[CallTypeID],
		[CAL_Register].[CallDescription],
		[CAL_Register].[LoggedOn],
		[CAL_Register].[AttenderID],
		[CAL_Register].[AttendedOn],
		[CAL_Register].[AttenderDescription],
		[CAL_Register].[CallStatusID],
		[CAL_Register].[ClosedOn],
		[CAL_Register].[SignedOffOn],
		[CAL_Register].[FileAttached],
		[CAL_Register].[FileExtention],
		[aspnet_Users1].[UserName] AS aspnet_Users1_UserName,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[CAL_CallTypes2].[CallTypeID] AS CAL_CallTypes2_CallTypeID,
		[CAL_CallTypes2].[Description] AS CAL_CallTypes2_Description,
		[aspnet_Users3].[UserName] AS aspnet_Users3_UserName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[CAL_Status4].[CallStatusID] AS CAL_Status4_CallStatusID,
		[CAL_Status4].[Description] AS CAL_Status4_Description 
  FROM [CAL_Register] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [CAL_Register].[UserID] = [aspnet_Users1].[UserName]
  LEFT OUTER JOIN [CAL_CallTypes] AS [CAL_CallTypes2]
    ON [CAL_Register].[CallTypeID] = [CAL_CallTypes2].[CallTypeID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [CAL_Register].[AttenderID] = [aspnet_Users3].[UserName]
  LEFT OUTER JOIN [CAL_Status] AS [CAL_Status4]
    ON [CAL_Register].[CallStatusID] = [CAL_Status4].[CallStatusID]
  WHERE
  [CAL_Register].[CallID] = @CallID
GO
