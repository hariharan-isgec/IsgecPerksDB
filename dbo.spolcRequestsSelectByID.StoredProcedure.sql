USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spolcRequestsSelectByID]
  @RequestID Int 
  AS
  SELECT
		[OLC_Requests].[RequestID] ,
		[OLC_Requests].[CardNo] ,
		[OLC_Requests].[Remarks] ,
		[OLC_Requests].[RequestedBy] ,
		[OLC_Requests].[RequestedOn] ,
		[OLC_Requests].[Configured] ,
		[OLC_Requests].[OLCPassword] ,
		[OLC_Requests].[NetworkIP] ,
		[OLC_Requests].[ConfiguredBy] ,
		[OLC_Requests].[ConfiguredOn] ,
		[OLC_Requests].[ConfigurationRemarks] ,
		[OLC_Requests].[RemoveAccess] ,
		[OLC_Requests].[RemoveRequestedBy] ,
		[OLC_Requests].[RemoveRequestedOn] ,
		[OLC_Requests].[RemoveRemarks] ,
		[OLC_Requests].[Removed] ,
		[OLC_Requests].[RemovedBy] ,
		[OLC_Requests].[RemovedOn] ,
		[OLC_Requests].[RemovedRemarks] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[aspnet_Users4].[UserFullName] AS aspnet_Users4_UserFullName,
		[HRM_Employees5].[EmployeeName] AS HRM_Employees5_EmployeeName 
  FROM [OLC_Requests] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [OLC_Requests].[ConfiguredBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [OLC_Requests].[RemovedBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [OLC_Requests].[RemoveRequestedBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]
    ON [OLC_Requests].[RequestedBy] = [aspnet_Users4].[LoginID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [OLC_Requests].[CardNo] = [HRM_Employees5].[CardNo]
  WHERE
  [OLC_Requests].[RequestID] = @RequestID
GO
