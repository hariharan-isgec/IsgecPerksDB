USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscRequestSelectByID]
  @LoginID NVarChar(8),
  @RequestID Int 
  AS
  SELECT
    [SC_Request].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
    [SC_Status4].[Description] AS SC_Status4_Description,
    [aspnet_Users5].[UserFullName] AS aspnet_Users5_UserFullName,
    [aspnet_Users6].[UserFullName] AS aspnet_Users6_UserFullName 
  FROM [SC_Request] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [SC_Request].[SubmittedBy] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [SC_Request].[MDApprovalBy] = [aspnet_users2].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [SC_Request].[AuditedBy] = [aspnet_users3].[LoginID]
  LEFT OUTER JOIN [SC_Status] AS [SC_Status4]
    ON [SC_Request].[StatusID] = [SC_Status4].[StatusID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users5]
    ON [SC_Request].[PHApprovalBy] = [aspnet_users5].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users6]
    ON [SC_Request].[BHApprovalBy] = [aspnet_users6].[LoginID]
  WHERE
  [SC_Request].[RequestID] = @RequestID
GO
