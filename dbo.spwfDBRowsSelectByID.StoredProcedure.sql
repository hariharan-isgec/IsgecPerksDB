USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBRowsSelectByID]
  @LoginID NVarChar(8),
  @DashboardID Int,
  @DBRows Int 
  AS
  SELECT
    [WF_DBRows].* ,
    [WF_Dashboards1].[DBDescription] AS WF_Dashboards1_DBDescription,
    [WF_DBRows2].[Description] AS WF_DBRows2_Description,
    [WF_DBRowTypes3].[Description] AS WF_DBRowTypes3_Description,
    [WF_GraphTypes4].[Description] AS WF_GraphTypes4_Description,
    [WF_DetailViewTypes5].[DVTypeDescription] AS WF_DetailViewTypes5_DVTypeDescription,
    [WF_DBData6].[Description] AS WF_DBData6_Description,
    [WF_DBData7].[Description] AS WF_DBData7_Description,
    [WF_DBData8].[Description] AS WF_DBData8_Description,
    [WF_DBData9].[Description] AS WF_DBData9_Description,
    [WF_DBData10].[Description] AS WF_DBData10_Description,
    [WF_DBData11].[Description] AS WF_DBData11_Description,
    [WF_DBData12].[Description] AS WF_DBData12_Description,
    [WF_DBData13].[Description] AS WF_DBData13_Description,
    [WF_DBData14].[Description] AS WF_DBData14_Description,
    [WF_DBData15].[Description] AS WF_DBData15_Description,
    [WF_DBData16].[Description] AS WF_DBData16_Description,
    [WF_DBIcons17].[IconName] AS WF_DBIcons17_IconName,
    [WF_DBIcons18].[IconName] AS WF_DBIcons18_IconName,
    [WF_DBIcons19].[IconName] AS WF_DBIcons19_IconName,
    [WF_DBIcons20].[IconName] AS WF_DBIcons20_IconName,
    [WF_DBIcons21].[IconName] AS WF_DBIcons21_IconName,
    [WF_DBIcons22].[IconName] AS WF_DBIcons22_IconName,
    [WF_DBData23].[Description] AS WF_DBData23_Description,
    [WF_DBData24].[Description] AS WF_DBData24_Description,
    [WF_DBData25].[Description] AS WF_DBData25_Description,
    [WF_DBData26].[Description] AS WF_DBData26_Description,
    [WF_DBData27].[Description] AS WF_DBData27_Description,
    [WF_DBData28].[Description] AS WF_DBData28_Description,
    [WF_DBData29].[Description] AS WF_DBData29_Description,
    [WF_DBData30].[Description] AS WF_DBData30_Description,
    [WF_DBData31].[Description] AS WF_DBData31_Description,
    [WF_DBData32].[Description] AS WF_DBData32_Description 
  FROM [WF_DBRows] 
  INNER JOIN [WF_Dashboards] AS [WF_Dashboards1]
    ON [WF_DBRows].[DashboardID] = [WF_Dashboards1].[DashboardID]
  LEFT OUTER JOIN [WF_DBRows] AS [WF_DBRows2]
    ON [WF_DBRows].[DashboardID] = [WF_DBRows2].[DashboardID]
    AND [WF_DBRows].[ParentDBRows] = [WF_DBRows2].[DBRows]
  LEFT OUTER JOIN [WF_DBRowTypes] AS [WF_DBRowTypes3]
    ON [WF_DBRows].[DBRowTypeID] = [WF_DBRowTypes3].[RowTypeID]
  LEFT OUTER JOIN [WF_GraphTypes] AS [WF_GraphTypes4]
    ON [WF_DBRows].[GraphTypeID] = [WF_GraphTypes4].[GraphTypeID]
  LEFT OUTER JOIN [WF_DetailViewTypes] AS [WF_DetailViewTypes5]
    ON [WF_DBRows].[DVTypeID] = [WF_DetailViewTypes5].[DVTypeID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData6]
    ON [WF_DBRows].[DVReverseDBDataID] = [WF_DBData6].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData7]
    ON [WF_DBRows].[DVFEMailDBDataID] = [WF_DBData7].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData8]
    ON [WF_DBRows].[DVFSMSDBDataID] = [WF_DBData8].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData9]
    ON [WF_DBRows].[DVREMailDBDataID] = [WF_DBData9].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData10]
    ON [WF_DBRows].[DVRSMSDBDataID] = [WF_DBData10].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData11]
    ON [WF_DBRows].[ReminderCountDBDataID] = [WF_DBData11].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData12]
    ON [WF_DBRows].[ReminderAvgDBDataID] = [WF_DBData12].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData13]
    ON [WF_DBRows].[ReminderMaxDBDataID] = [WF_DBData13].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData14]
    ON [WF_DBRows].[MainDBDataID] = [WF_DBData14].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData15]
    ON [WF_DBRows].[DVDBDataID] = [WF_DBData15].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData16]
    ON [WF_DBRows].[DVForwardDBDataID] = [WF_DBData16].[DBDataID]
  LEFT OUTER JOIN [WF_DBIcons] AS [WF_DBIcons17]
    ON [WF_DBRows].[MainDBIconID] = [WF_DBIcons17].[DBIconID]
  LEFT OUTER JOIN [WF_DBIcons] AS [WF_DBIcons18]
    ON [WF_DBRows].[DVDBIconID] = [WF_DBIcons18].[DBIconID]
  LEFT OUTER JOIN [WF_DBIcons] AS [WF_DBIcons19]
    ON [WF_DBRows].[DVRemarksDBIconID] = [WF_DBIcons19].[DBIconID]
  LEFT OUTER JOIN [WF_DBIcons] AS [WF_DBIcons20]
    ON [WF_DBRows].[DVFDBIconID] = [WF_DBIcons20].[DBIconID]
  LEFT OUTER JOIN [WF_DBIcons] AS [WF_DBIcons21]
    ON [WF_DBRows].[DVRDBIconID] = [WF_DBIcons21].[DBIconID]
  LEFT OUTER JOIN [WF_DBIcons] AS [WF_DBIcons22]
    ON [WF_DBRows].[DVAttachmentDBIconID] = [WF_DBIcons22].[DBIconID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData23]
    ON [WF_DBRows].[ReminderEMailDBDataID] = [WF_DBData23].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData24]
    ON [WF_DBRows].[ReminderSMSDBDataID] = [WF_DBData24].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData25]
    ON [WF_DBRows].[TotSqlIDLeft] = [WF_DBData25].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData26]
    ON [WF_DBRows].[RedSqlIDLeft] = [WF_DBData26].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData27]
    ON [WF_DBRows].[AmbSqlIDLeft] = [WF_DBData27].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData28]
    ON [WF_DBRows].[GreSqlIDLeft] = [WF_DBData28].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData29]
    ON [WF_DBRows].[TotSqlIDRight] = [WF_DBData29].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData30]
    ON [WF_DBRows].[AmbSqlIDRight] = [WF_DBData30].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData31]
    ON [WF_DBRows].[GreSqlIDRight] = [WF_DBData31].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData32]
    ON [WF_DBRows].[RedSqlIDRight] = [WF_DBData32].[DBDataID]
  WHERE
  [WF_DBRows].[DashboardID] = @DashboardID
  AND [WF_DBRows].[DBRows] = @DBRows
GO
