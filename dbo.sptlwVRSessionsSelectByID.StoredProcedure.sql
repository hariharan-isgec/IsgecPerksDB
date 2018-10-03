USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRSessionsSelectByID]
  @LoginID NVarChar(8),
  @VRSessionID Int 
  AS
  SELECT
    [SYS_VRSessions].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description 
  FROM [SYS_VRSessions] 
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRSessions].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  WHERE
  [SYS_VRSessions].[VRSessionID] = @VRSessionID
GO
