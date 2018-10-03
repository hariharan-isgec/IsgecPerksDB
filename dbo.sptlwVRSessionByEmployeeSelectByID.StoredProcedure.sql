USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRSessionByEmployeeSelectByID]
  @LoginID NVarChar(8),
  @RecordID Int 
  AS
  SELECT
    [SYS_VRSessionByEmployee].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description,
    [SYS_VRSessions2].[Description] AS SYS_VRSessions2_Description,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName 
  FROM [SYS_VRSessionByEmployee] 
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRSessionByEmployee].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  INNER JOIN [SYS_VRSessions] AS [SYS_VRSessions2]
    ON [SYS_VRSessionByEmployee].[VRSessionID] = [SYS_VRSessions2].[VRSessionID]
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SYS_VRSessionByEmployee].[UserName] = [aspnet_Users1].[LoginID]
  WHERE
  [SYS_VRSessionByEmployee].[RecordID] = @RecordID
GO
