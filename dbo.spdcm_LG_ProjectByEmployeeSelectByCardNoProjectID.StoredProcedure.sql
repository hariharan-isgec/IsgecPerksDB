USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcm_LG_ProjectByEmployeeSelectByCardNoProjectID]
  @ProjectID NVarChar(6),
  @CardNo    NVarChar(8)
  AS
  SELECT
		[DCM_ProjectByEmployee].[RecordID],
		[DCM_ProjectByEmployee].[CardNo],
		[DCM_ProjectByEmployee].[ProjectID],
		[aspnet_Users1].[UserName] AS aspnet_Users1_UserName,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users1].[ExtnNo] AS aspnet_Users1_ExtnNo,
		[aspnet_Users1].[MobileNo] AS aspnet_Users1_MobileNo,
		[aspnet_Users1].[EMailID] AS aspnet_Users1_EMailID,
		[DCM_Projects2].[ProjectID] AS DCM_Projects2_ProjectID,
		[DCM_Projects2].[Description] AS DCM_Projects2_Description 
  FROM [DCM_ProjectByEmployee] 
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [DCM_ProjectByEmployee].[CardNo] = [aspnet_Users1].[UserName]
  INNER JOIN [DCM_Projects] AS [DCM_Projects2]
    ON [DCM_ProjectByEmployee].[ProjectID] = [DCM_Projects2].[ProjectID]
  WHERE
  [DCM_ProjectByEmployee].[ProjectID] = @ProjectID
  AND [DCM_ProjectByEmployee].[CardNo] = @CardNo
GO
