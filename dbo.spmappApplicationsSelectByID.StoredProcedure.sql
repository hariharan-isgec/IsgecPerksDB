USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmappApplicationsSelectByID]
  @LoginID NVarChar(8),
  @AppID Int 
  AS
  SELECT
    [MAPP_Applications].* ,
    [WF_DBIcons1].[IconName] AS WF_DBIcons1_IconName 
  FROM [MAPP_Applications] 
  LEFT OUTER JOIN [WF_DBIcons] AS [WF_DBIcons1]
    ON [MAPP_Applications].[AppIconID] = [WF_DBIcons1].[DBIconID]
  WHERE
  [MAPP_Applications].[AppID] = @AppID
GO
