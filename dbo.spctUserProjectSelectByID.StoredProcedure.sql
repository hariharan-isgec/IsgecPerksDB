USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spctUserProjectSelectByID]
  @LoginID NVarChar(8),
  @UserID NVarChar(8),
  @ProjectID NVarChar(6) 
  AS
  SELECT
    [CT_UserProject].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [IDM_Projects2].[Description] AS IDM_Projects2_Description 
  FROM [CT_UserProject] 
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [CT_UserProject].[UserID] = [aspnet_users1].[LoginID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [CT_UserProject].[ProjectID] = [IDM_Projects2].[ProjectID]
  WHERE
  [CT_UserProject].[UserID] = @UserID
  AND [CT_UserProject].[ProjectID] = @ProjectID
GO
