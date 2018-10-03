USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmWebUsersSelectByID]
  @UserID NVarChar(20) 
  AS
  SELECT
		[DCM_WebUsers].[UserID],
		[DCM_WebUsers].[UserName],
		[DCM_WebUsers].[CreatedBy],
		[DCM_WebUsers].[ActivateOn],
		[DCM_WebUsers].[TillDays] 
  FROM [DCM_WebUsers] 
  WHERE
  [DCM_WebUsers].[UserID] = @UserID
GO
