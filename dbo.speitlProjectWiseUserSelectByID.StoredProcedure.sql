USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlProjectWiseUserSelectByID]
  @LoginID NVarChar(8),
  @SerialNo BigInt 
  AS
  SELECT
		[EITL_ProjectWiseUser].[SerialNo] ,
		[EITL_ProjectWiseUser].[UserID] ,
		[EITL_ProjectWiseUser].[ProjectID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[IDM_Projects2].[Description] AS IDM_Projects2_Description 
  FROM [EITL_ProjectWiseUser] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [EITL_ProjectWiseUser].[UserID] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [EITL_ProjectWiseUser].[ProjectID] = [IDM_Projects2].[ProjectID]
  WHERE
  [EITL_ProjectWiseUser].[SerialNo] = @SerialNo
GO
