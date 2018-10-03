USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmProjectByEmployeeSelectByID]
  @RecordID Int 
  AS
  SELECT
		[DCM_ProjectByEmployee].[RecordID],
		[DCM_ProjectByEmployee].[CardNo],
		[DCM_ProjectByEmployee].[ProjectID],
		[aspnet_Users2].[UserName] AS aspnet_Users2_UserName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users2].[ExtnNo] AS aspnet_Users2_ExtnNo,
		[aspnet_Users2].[MobileNo] AS aspnet_Users2_MobileNo,
		[aspnet_Users2].[EMailID] AS aspnet_Users2_EMailID,
		[DCM_Projects1].[ProjectID] AS DCM_Projects1_ProjectID,
		[DCM_Projects1].[Description] AS DCM_Projects1_Description 
  FROM [DCM_ProjectByEmployee] 
  INNER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [DCM_ProjectByEmployee].[CardNo] = [aspnet_Users2].[UserName]
  INNER JOIN [DCM_Projects] AS [DCM_Projects1]
    ON [DCM_ProjectByEmployee].[ProjectID] = [DCM_Projects1].[ProjectID]
  WHERE
  [DCM_ProjectByEmployee].[RecordID] = @RecordID
GO
