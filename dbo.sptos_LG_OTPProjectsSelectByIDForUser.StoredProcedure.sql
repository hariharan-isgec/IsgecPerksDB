USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptos_LG_OTPProjectsSelectByIDForUser]
	@LoginID NVarChar(8), 
  @ProjectID NVarChar(6) 
  AS
  SELECT
		[TOS_Projects].[ProjectID] ,
		[TOS_Projects].[Description] ,
		[TOS_Projects].[RootTaskID] ,
		[TOS_Projects].[Active] ,
		[TOS_Projects].[engEnabled] ,
		[TOS_Projects].[engTitle] ,
		[TOS_Projects].[ordEnabled] ,
		[TOS_Projects].[ordTitle] ,
		[TOS_Projects].[desEnabled] ,
		[TOS_Projects].[desTitle] ,
		[TOS_Projects].[ereEnabled] ,
		[TOS_Projects].[ereTitle] ,
		[TOS_Projects].[ioEnabled] ,
		[TOS_Projects].[ioTitle] ,
		[TOS_Projects].[recEnabled] ,
		[TOS_Projects].[recTitle] ,
		[TOS_Projects].[ad1Enabled] ,
		[TOS_Projects].[ad1Title] ,
		[TOS_Projects].[ad2Enabled] ,
		[TOS_Projects].[ad2Title] ,
		[TOS_Projects].[ad3Enabled] ,
		[TOS_Projects].[ad3Title] ,
		[TOS_Projects].[ad4Enabled] ,
		[TOS_Projects].[ad4Title] ,
		[IDM_Projects1].[Description] AS IDM_Projects1_Description,
		[TOS_Tasks2].[Description] AS TOS_Tasks2_Description,
		[TOS_Tasks1].[Description] AS TOS_Tasks1_Description 
  FROM [TOS_Projects] 
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [TOS_Projects].[ProjectID] = [IDM_Projects1].[ProjectID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks2]
    ON [TOS_Projects].[ProjectID] = [TOS_Tasks2].[ProjectID]
    AND [TOS_Projects].[RootTaskID] = [TOS_Tasks2].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks1]
    ON [TOS_Projects].[ProjectID] = [TOS_Tasks1].[ProjectID]
    AND [TOS_Projects].[RootTaskID] = [TOS_Tasks1].[TaskID]
  WHERE
  [TOS_Projects].[ProjectID] = (SELECT TOP 1 PROJECTID FROM TOS_USERVIEWS WHERE (CLPVIEW = 1 OR OTPVIEW = 1) AND USERID=@LoginID AND PROJECTID = @ProjectID)
GO
