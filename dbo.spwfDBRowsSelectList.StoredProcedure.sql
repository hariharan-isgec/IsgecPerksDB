USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBRowsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'DashboardID' THEN [WF_DBRows].[DashboardID] END,
     CASE @OrderBy WHEN 'DashboardID DESC' THEN [WF_DBRows].[DashboardID] END DESC,
     CASE @OrderBy WHEN 'DBRows' THEN [WF_DBRows].[DBRows] END,
     CASE @OrderBy WHEN 'DBRows DESC' THEN [WF_DBRows].[DBRows] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [WF_DBRows].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [WF_DBRows].[Description] END DESC,
     CASE @OrderBy WHEN 'AddNewURL' THEN [WF_DBRows].[AddNewURL] END,
     CASE @OrderBy WHEN 'AddNewURL DESC' THEN [WF_DBRows].[AddNewURL] END DESC,
     CASE @OrderBy WHEN 'IsDVURL' THEN [WF_DBRows].[IsDVURL] END,
     CASE @OrderBy WHEN 'IsDVURL DESC' THEN [WF_DBRows].[IsDVURL] END DESC,
     CASE @OrderBy WHEN 'DVURL' THEN [WF_DBRows].[DVURL] END,
     CASE @OrderBy WHEN 'DVURL DESC' THEN [WF_DBRows].[DVURL] END DESC,
     CASE @OrderBy WHEN 'DVLaunchURL' THEN [WF_DBRows].[DVLaunchURL] END,
     CASE @OrderBy WHEN 'DVLaunchURL DESC' THEN [WF_DBRows].[DVLaunchURL] END DESC,
     CASE @OrderBy WHEN 'DBTitle' THEN [WF_DBRows].[DBTitle] END,
     CASE @OrderBy WHEN 'DBTitle DESC' THEN [WF_DBRows].[DBTitle] END DESC,
     CASE @OrderBy WHEN 'TitleStyle' THEN [WF_DBRows].[TitleStyle] END,
     CASE @OrderBy WHEN 'TitleStyle DESC' THEN [WF_DBRows].[TitleStyle] END DESC,
     CASE @OrderBy WHEN 'cssRow' THEN [WF_DBRows].[cssRow] END,
     CASE @OrderBy WHEN 'cssRow DESC' THEN [WF_DBRows].[cssRow] END DESC,
     CASE @OrderBy WHEN 'Sequence' THEN [WF_DBRows].[Sequence] END,
     CASE @OrderBy WHEN 'Sequence DESC' THEN [WF_DBRows].[Sequence] END DESC,
     CASE @OrderBy WHEN 'ShowHeader' THEN [WF_DBRows].[ShowHeader] END,
     CASE @OrderBy WHEN 'ShowHeader DESC' THEN [WF_DBRows].[ShowHeader] END DESC,
     CASE @OrderBy WHEN 'GraphTypeID' THEN [WF_DBRows].[GraphTypeID] END,
     CASE @OrderBy WHEN 'GraphTypeID DESC' THEN [WF_DBRows].[GraphTypeID] END DESC,
     CASE @OrderBy WHEN 'ConvertForGraph' THEN [WF_DBRows].[ConvertForGraph] END,
     CASE @OrderBy WHEN 'ConvertForGraph DESC' THEN [WF_DBRows].[ConvertForGraph] END DESC,
     CASE @OrderBy WHEN 'NotToDraw' THEN [WF_DBRows].[NotToDraw] END,
     CASE @OrderBy WHEN 'NotToDraw DESC' THEN [WF_DBRows].[NotToDraw] END DESC,
     CASE @OrderBy WHEN 'ParentDBRows' THEN [WF_DBRows].[ParentDBRows] END,
     CASE @OrderBy WHEN 'ParentDBRows DESC' THEN [WF_DBRows].[ParentDBRows] END DESC,
     CASE @OrderBy WHEN 'DBRowTypeID' THEN [WF_DBRows].[DBRowTypeID] END,
     CASE @OrderBy WHEN 'DBRowTypeID DESC' THEN [WF_DBRows].[DBRowTypeID] END DESC,
     CASE @OrderBy WHEN 'MainDBDataID' THEN [WF_DBRows].[MainDBDataID] END,
     CASE @OrderBy WHEN 'MainDBDataID DESC' THEN [WF_DBRows].[MainDBDataID] END DESC,
     CASE @OrderBy WHEN 'MainDBIconID' THEN [WF_DBRows].[MainDBIconID] END,
     CASE @OrderBy WHEN 'MainDBIconID DESC' THEN [WF_DBRows].[MainDBIconID] END DESC,
     CASE @OrderBy WHEN 'IsDV' THEN [WF_DBRows].[IsDV] END,
     CASE @OrderBy WHEN 'IsDV DESC' THEN [WF_DBRows].[IsDV] END DESC,
     CASE @OrderBy WHEN 'DVTypeID' THEN [WF_DBRows].[DVTypeID] END,
     CASE @OrderBy WHEN 'DVTypeID DESC' THEN [WF_DBRows].[DVTypeID] END DESC,
     CASE @OrderBy WHEN 'DVDescription' THEN [WF_DBRows].[DVDescription] END,
     CASE @OrderBy WHEN 'DVDescription DESC' THEN [WF_DBRows].[DVDescription] END DESC,
     CASE @OrderBy WHEN 'DVDBIconID' THEN [WF_DBRows].[DVDBIconID] END,
     CASE @OrderBy WHEN 'DVDBIconID DESC' THEN [WF_DBRows].[DVDBIconID] END DESC,
     CASE @OrderBy WHEN 'DVDBDataID' THEN [WF_DBRows].[DVDBDataID] END,
     CASE @OrderBy WHEN 'DVDBDataID DESC' THEN [WF_DBRows].[DVDBDataID] END DESC,
     CASE @OrderBy WHEN 'IsDVUpdatable' THEN [WF_DBRows].[IsDVUpdatable] END,
     CASE @OrderBy WHEN 'IsDVUpdatable DESC' THEN [WF_DBRows].[IsDVUpdatable] END DESC,
     CASE @OrderBy WHEN 'IsDVRemarks' THEN [WF_DBRows].[IsDVRemarks] END,
     CASE @OrderBy WHEN 'IsDVRemarks DESC' THEN [WF_DBRows].[IsDVRemarks] END DESC,
     CASE @OrderBy WHEN 'DVRemarksText' THEN [WF_DBRows].[DVRemarksText] END,
     CASE @OrderBy WHEN 'DVRemarksText DESC' THEN [WF_DBRows].[DVRemarksText] END DESC,
     CASE @OrderBy WHEN 'DVRemarksDBIconID' THEN [WF_DBRows].[DVRemarksDBIconID] END,
     CASE @OrderBy WHEN 'DVRemarksDBIconID DESC' THEN [WF_DBRows].[DVRemarksDBIconID] END DESC,
     CASE @OrderBy WHEN 'IsDVForward' THEN [WF_DBRows].[IsDVForward] END,
     CASE @OrderBy WHEN 'IsDVForward DESC' THEN [WF_DBRows].[IsDVForward] END DESC,
     CASE @OrderBy WHEN 'DVForwardText' THEN [WF_DBRows].[DVForwardText] END,
     CASE @OrderBy WHEN 'DVForwardText DESC' THEN [WF_DBRows].[DVForwardText] END DESC,
     CASE @OrderBy WHEN 'DVFDBIconID' THEN [WF_DBRows].[DVFDBIconID] END,
     CASE @OrderBy WHEN 'DVFDBIconID DESC' THEN [WF_DBRows].[DVFDBIconID] END DESC,
     CASE @OrderBy WHEN 'DVForwardDBDataID' THEN [WF_DBRows].[DVForwardDBDataID] END,
     CASE @OrderBy WHEN 'DVForwardDBDataID DESC' THEN [WF_DBRows].[DVForwardDBDataID] END DESC,
     CASE @OrderBy WHEN 'IsDVReverse' THEN [WF_DBRows].[IsDVReverse] END,
     CASE @OrderBy WHEN 'IsDVReverse DESC' THEN [WF_DBRows].[IsDVReverse] END DESC,
     CASE @OrderBy WHEN 'DVReverseText' THEN [WF_DBRows].[DVReverseText] END,
     CASE @OrderBy WHEN 'DVReverseText DESC' THEN [WF_DBRows].[DVReverseText] END DESC,
     CASE @OrderBy WHEN 'DVRDBIconID' THEN [WF_DBRows].[DVRDBIconID] END,
     CASE @OrderBy WHEN 'DVRDBIconID DESC' THEN [WF_DBRows].[DVRDBIconID] END DESC,
     CASE @OrderBy WHEN 'DVReverseDBDataID' THEN [WF_DBRows].[DVReverseDBDataID] END,
     CASE @OrderBy WHEN 'DVReverseDBDataID DESC' THEN [WF_DBRows].[DVReverseDBDataID] END DESC,
     CASE @OrderBy WHEN 'IsDVAttachment' THEN [WF_DBRows].[IsDVAttachment] END,
     CASE @OrderBy WHEN 'IsDVAttachment DESC' THEN [WF_DBRows].[IsDVAttachment] END DESC,
     CASE @OrderBy WHEN 'IsDVAttachmentMulti' THEN [WF_DBRows].[IsDVAttachmentMulti] END,
     CASE @OrderBy WHEN 'IsDVAttachmentMulti DESC' THEN [WF_DBRows].[IsDVAttachmentMulti] END DESC,
     CASE @OrderBy WHEN 'DVAttachmentText' THEN [WF_DBRows].[DVAttachmentText] END,
     CASE @OrderBy WHEN 'DVAttachmentText DESC' THEN [WF_DBRows].[DVAttachmentText] END DESC,
     CASE @OrderBy WHEN 'DVAttachmentDBIconID' THEN [WF_DBRows].[DVAttachmentDBIconID] END,
     CASE @OrderBy WHEN 'DVAttachmentDBIconID DESC' THEN [WF_DBRows].[DVAttachmentDBIconID] END DESC,
     CASE @OrderBy WHEN 'DVFAlert' THEN [WF_DBRows].[DVFAlert] END,
     CASE @OrderBy WHEN 'DVFAlert DESC' THEN [WF_DBRows].[DVFAlert] END DESC,
     CASE @OrderBy WHEN 'DVFAlertEMail' THEN [WF_DBRows].[DVFAlertEMail] END,
     CASE @OrderBy WHEN 'DVFAlertEMail DESC' THEN [WF_DBRows].[DVFAlertEMail] END DESC,
     CASE @OrderBy WHEN 'DVFASubject' THEN [WF_DBRows].[DVFASubject] END,
     CASE @OrderBy WHEN 'DVFASubject DESC' THEN [WF_DBRows].[DVFASubject] END DESC,
     CASE @OrderBy WHEN 'DVFABodyTemplate' THEN [WF_DBRows].[DVFABodyTemplate] END,
     CASE @OrderBy WHEN 'DVFABodyTemplate DESC' THEN [WF_DBRows].[DVFABodyTemplate] END DESC,
     CASE @OrderBy WHEN 'DVFEMailDBDataID' THEN [WF_DBRows].[DVFEMailDBDataID] END,
     CASE @OrderBy WHEN 'DVFEMailDBDataID DESC' THEN [WF_DBRows].[DVFEMailDBDataID] END DESC,
     CASE @OrderBy WHEN 'DVFAlertSMS' THEN [WF_DBRows].[DVFAlertSMS] END,
     CASE @OrderBy WHEN 'DVFAlertSMS DESC' THEN [WF_DBRows].[DVFAlertSMS] END DESC,
     CASE @OrderBy WHEN 'DVFASMSText' THEN [WF_DBRows].[DVFASMSText] END,
     CASE @OrderBy WHEN 'DVFASMSText DESC' THEN [WF_DBRows].[DVFASMSText] END DESC,
     CASE @OrderBy WHEN 'DVFSMSDBDataID' THEN [WF_DBRows].[DVFSMSDBDataID] END,
     CASE @OrderBy WHEN 'DVFSMSDBDataID DESC' THEN [WF_DBRows].[DVFSMSDBDataID] END DESC,
     CASE @OrderBy WHEN 'DVRAlert' THEN [WF_DBRows].[DVRAlert] END,
     CASE @OrderBy WHEN 'DVRAlert DESC' THEN [WF_DBRows].[DVRAlert] END DESC,
     CASE @OrderBy WHEN 'DVRAlertEMail' THEN [WF_DBRows].[DVRAlertEMail] END,
     CASE @OrderBy WHEN 'DVRAlertEMail DESC' THEN [WF_DBRows].[DVRAlertEMail] END DESC,
     CASE @OrderBy WHEN 'DVRASubject' THEN [WF_DBRows].[DVRASubject] END,
     CASE @OrderBy WHEN 'DVRASubject DESC' THEN [WF_DBRows].[DVRASubject] END DESC,
     CASE @OrderBy WHEN 'DVRABodyTemplate' THEN [WF_DBRows].[DVRABodyTemplate] END,
     CASE @OrderBy WHEN 'DVRABodyTemplate DESC' THEN [WF_DBRows].[DVRABodyTemplate] END DESC,
     CASE @OrderBy WHEN 'DVREMailDBDataID' THEN [WF_DBRows].[DVREMailDBDataID] END,
     CASE @OrderBy WHEN 'DVREMailDBDataID DESC' THEN [WF_DBRows].[DVREMailDBDataID] END DESC,
     CASE @OrderBy WHEN 'DVRAlertSMS' THEN [WF_DBRows].[DVRAlertSMS] END,
     CASE @OrderBy WHEN 'DVRAlertSMS DESC' THEN [WF_DBRows].[DVRAlertSMS] END DESC,
     CASE @OrderBy WHEN 'DVRASMSText' THEN [WF_DBRows].[DVRASMSText] END,
     CASE @OrderBy WHEN 'DVRASMSText DESC' THEN [WF_DBRows].[DVRASMSText] END DESC,
     CASE @OrderBy WHEN 'DVRSMSDBDataID' THEN [WF_DBRows].[DVRSMSDBDataID] END,
     CASE @OrderBy WHEN 'DVRSMSDBDataID DESC' THEN [WF_DBRows].[DVRSMSDBDataID] END DESC,
     CASE @OrderBy WHEN 'ReminderOnCount' THEN [WF_DBRows].[ReminderOnCount] END,
     CASE @OrderBy WHEN 'ReminderOnCount DESC' THEN [WF_DBRows].[ReminderOnCount] END DESC,
     CASE @OrderBy WHEN 'ReminderCountThreshold' THEN [WF_DBRows].[ReminderCountThreshold] END,
     CASE @OrderBy WHEN 'ReminderCountThreshold DESC' THEN [WF_DBRows].[ReminderCountThreshold] END DESC,
     CASE @OrderBy WHEN 'ReminderCountDBDataID' THEN [WF_DBRows].[ReminderCountDBDataID] END,
     CASE @OrderBy WHEN 'ReminderCountDBDataID DESC' THEN [WF_DBRows].[ReminderCountDBDataID] END DESC,
     CASE @OrderBy WHEN 'ReminderOnAvg' THEN [WF_DBRows].[ReminderOnAvg] END,
     CASE @OrderBy WHEN 'ReminderOnAvg DESC' THEN [WF_DBRows].[ReminderOnAvg] END DESC,
     CASE @OrderBy WHEN 'ReminderLapsDaysAvg' THEN [WF_DBRows].[ReminderLapsDaysAvg] END,
     CASE @OrderBy WHEN 'ReminderLapsDaysAvg DESC' THEN [WF_DBRows].[ReminderLapsDaysAvg] END DESC,
     CASE @OrderBy WHEN 'ReminderAvgDBDataID' THEN [WF_DBRows].[ReminderAvgDBDataID] END,
     CASE @OrderBy WHEN 'ReminderAvgDBDataID DESC' THEN [WF_DBRows].[ReminderAvgDBDataID] END DESC,
     CASE @OrderBy WHEN 'ReminderOnMax' THEN [WF_DBRows].[ReminderOnMax] END,
     CASE @OrderBy WHEN 'ReminderOnMax DESC' THEN [WF_DBRows].[ReminderOnMax] END DESC,
     CASE @OrderBy WHEN 'ReminderLapsDaysMax' THEN [WF_DBRows].[ReminderLapsDaysMax] END,
     CASE @OrderBy WHEN 'ReminderLapsDaysMax DESC' THEN [WF_DBRows].[ReminderLapsDaysMax] END DESC,
     CASE @OrderBy WHEN 'ReminderMaxDBDataID' THEN [WF_DBRows].[ReminderMaxDBDataID] END,
     CASE @OrderBy WHEN 'ReminderMaxDBDataID DESC' THEN [WF_DBRows].[ReminderMaxDBDataID] END DESC,
     CASE @OrderBy WHEN 'ReminderFrequencyDays' THEN [WF_DBRows].[ReminderFrequencyDays] END,
     CASE @OrderBy WHEN 'ReminderFrequencyDays DESC' THEN [WF_DBRows].[ReminderFrequencyDays] END DESC,
     CASE @OrderBy WHEN 'ReminderAlertEMail' THEN [WF_DBRows].[ReminderAlertEMail] END,
     CASE @OrderBy WHEN 'ReminderAlertEMail DESC' THEN [WF_DBRows].[ReminderAlertEMail] END DESC,
     CASE @OrderBy WHEN 'ReminderEMailDBDataID' THEN [WF_DBRows].[ReminderEMailDBDataID] END,
     CASE @OrderBy WHEN 'ReminderEMailDBDataID DESC' THEN [WF_DBRows].[ReminderEMailDBDataID] END DESC,
     CASE @OrderBy WHEN 'ReminderASubject' THEN [WF_DBRows].[ReminderASubject] END,
     CASE @OrderBy WHEN 'ReminderASubject DESC' THEN [WF_DBRows].[ReminderASubject] END DESC,
     CASE @OrderBy WHEN 'ReminderABodyTemplate' THEN [WF_DBRows].[ReminderABodyTemplate] END,
     CASE @OrderBy WHEN 'ReminderABodyTemplate DESC' THEN [WF_DBRows].[ReminderABodyTemplate] END DESC,
     CASE @OrderBy WHEN 'ReminderAlertSMS' THEN [WF_DBRows].[ReminderAlertSMS] END,
     CASE @OrderBy WHEN 'ReminderAlertSMS DESC' THEN [WF_DBRows].[ReminderAlertSMS] END DESC,
     CASE @OrderBy WHEN 'ReminderSMSDBDataID' THEN [WF_DBRows].[ReminderSMSDBDataID] END,
     CASE @OrderBy WHEN 'ReminderSMSDBDataID DESC' THEN [WF_DBRows].[ReminderSMSDBDataID] END DESC,
     CASE @OrderBy WHEN 'ReminderASMSText' THEN [WF_DBRows].[ReminderASMSText] END,
     CASE @OrderBy WHEN 'ReminderASMSText DESC' THEN [WF_DBRows].[ReminderASMSText] END DESC,
     CASE @OrderBy WHEN 'IsLeft' THEN [WF_DBRows].[IsLeft] END,
     CASE @OrderBy WHEN 'IsLeft DESC' THEN [WF_DBRows].[IsLeft] END DESC,
     CASE @OrderBy WHEN 'AppNameLeft' THEN [WF_DBRows].[AppNameLeft] END,
     CASE @OrderBy WHEN 'AppNameLeft DESC' THEN [WF_DBRows].[AppNameLeft] END DESC,
     CASE @OrderBy WHEN 'TotSqlIDLeft' THEN [WF_DBRows].[TotSqlIDLeft] END,
     CASE @OrderBy WHEN 'TotSqlIDLeft DESC' THEN [WF_DBRows].[TotSqlIDLeft] END DESC,
     CASE @OrderBy WHEN 'RedSqlIDLeft' THEN [WF_DBRows].[RedSqlIDLeft] END,
     CASE @OrderBy WHEN 'RedSqlIDLeft DESC' THEN [WF_DBRows].[RedSqlIDLeft] END DESC,
     CASE @OrderBy WHEN 'AmbSqlIDLeft' THEN [WF_DBRows].[AmbSqlIDLeft] END,
     CASE @OrderBy WHEN 'AmbSqlIDLeft DESC' THEN [WF_DBRows].[AmbSqlIDLeft] END DESC,
     CASE @OrderBy WHEN 'GreSqlIDLeft' THEN [WF_DBRows].[GreSqlIDLeft] END,
     CASE @OrderBy WHEN 'GreSqlIDLeft DESC' THEN [WF_DBRows].[GreSqlIDLeft] END DESC,
     CASE @OrderBy WHEN 'HaveNewLeft' THEN [WF_DBRows].[HaveNewLeft] END,
     CASE @OrderBy WHEN 'HaveNewLeft DESC' THEN [WF_DBRows].[HaveNewLeft] END DESC,
     CASE @OrderBy WHEN 'HaveRemLeft' THEN [WF_DBRows].[HaveRemLeft] END,
     CASE @OrderBy WHEN 'HaveRemLeft DESC' THEN [WF_DBRows].[HaveRemLeft] END DESC,
     CASE @OrderBy WHEN 'IsRight' THEN [WF_DBRows].[IsRight] END,
     CASE @OrderBy WHEN 'IsRight DESC' THEN [WF_DBRows].[IsRight] END DESC,
     CASE @OrderBy WHEN 'AppNameRight' THEN [WF_DBRows].[AppNameRight] END,
     CASE @OrderBy WHEN 'AppNameRight DESC' THEN [WF_DBRows].[AppNameRight] END DESC,
     CASE @OrderBy WHEN 'TotSqlIDRight' THEN [WF_DBRows].[TotSqlIDRight] END,
     CASE @OrderBy WHEN 'TotSqlIDRight DESC' THEN [WF_DBRows].[TotSqlIDRight] END DESC,
     CASE @OrderBy WHEN 'RedSqlIDRight' THEN [WF_DBRows].[RedSqlIDRight] END,
     CASE @OrderBy WHEN 'RedSqlIDRight DESC' THEN [WF_DBRows].[RedSqlIDRight] END DESC,
     CASE @OrderBy WHEN 'AmbSqlIDRight' THEN [WF_DBRows].[AmbSqlIDRight] END,
     CASE @OrderBy WHEN 'AmbSqlIDRight DESC' THEN [WF_DBRows].[AmbSqlIDRight] END DESC,
     CASE @OrderBy WHEN 'GreSqlIDRight' THEN [WF_DBRows].[GreSqlIDRight] END,
     CASE @OrderBy WHEN 'GreSqlIDRight DESC' THEN [WF_DBRows].[GreSqlIDRight] END DESC,
     CASE @OrderBy WHEN 'HaveNewRight' THEN [WF_DBRows].[HaveNewRight] END,
     CASE @OrderBy WHEN 'HaveNewRight DESC' THEN [WF_DBRows].[HaveNewRight] END DESC,
     CASE @OrderBy WHEN 'HaveRemRight' THEN [WF_DBRows].[HaveRemRight] END,
     CASE @OrderBy WHEN 'HaveRemRight DESC' THEN [WF_DBRows].[HaveRemRight] END DESC,
     CASE @OrderBy WHEN 'WF_Dashboards1_DBDescription' THEN [WF_Dashboards1].[DBDescription] END,
     CASE @OrderBy WHEN 'WF_Dashboards1_DBDescription DESC' THEN [WF_Dashboards1].[DBDescription] END DESC,
     CASE @OrderBy WHEN 'WF_DBRows2_Description' THEN [WF_DBRows2].[Description] END,
     CASE @OrderBy WHEN 'WF_DBRows2_Description DESC' THEN [WF_DBRows2].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBRowTypes3_Description' THEN [WF_DBRowTypes3].[Description] END,
     CASE @OrderBy WHEN 'WF_DBRowTypes3_Description DESC' THEN [WF_DBRowTypes3].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_GraphTypes4_Description' THEN [WF_GraphTypes4].[Description] END,
     CASE @OrderBy WHEN 'WF_GraphTypes4_Description DESC' THEN [WF_GraphTypes4].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DetailViewTypes5_DVTypeDescription' THEN [WF_DetailViewTypes5].[DVTypeDescription] END,
     CASE @OrderBy WHEN 'WF_DetailViewTypes5_DVTypeDescription DESC' THEN [WF_DetailViewTypes5].[DVTypeDescription] END DESC,
     CASE @OrderBy WHEN 'WF_DBData6_Description' THEN [WF_DBData6].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData6_Description DESC' THEN [WF_DBData6].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBData7_Description' THEN [WF_DBData7].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData7_Description DESC' THEN [WF_DBData7].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBData8_Description' THEN [WF_DBData8].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData8_Description DESC' THEN [WF_DBData8].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBData9_Description' THEN [WF_DBData9].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData9_Description DESC' THEN [WF_DBData9].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBData10_Description' THEN [WF_DBData10].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData10_Description DESC' THEN [WF_DBData10].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBData11_Description' THEN [WF_DBData11].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData11_Description DESC' THEN [WF_DBData11].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBData12_Description' THEN [WF_DBData12].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData12_Description DESC' THEN [WF_DBData12].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBData13_Description' THEN [WF_DBData13].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData13_Description DESC' THEN [WF_DBData13].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBData14_Description' THEN [WF_DBData14].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData14_Description DESC' THEN [WF_DBData14].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBData15_Description' THEN [WF_DBData15].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData15_Description DESC' THEN [WF_DBData15].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBData16_Description' THEN [WF_DBData16].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData16_Description DESC' THEN [WF_DBData16].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBIcons17_IconName' THEN [WF_DBIcons17].[IconName] END,
     CASE @OrderBy WHEN 'WF_DBIcons17_IconName DESC' THEN [WF_DBIcons17].[IconName] END DESC,
     CASE @OrderBy WHEN 'WF_DBIcons18_IconName' THEN [WF_DBIcons18].[IconName] END,
     CASE @OrderBy WHEN 'WF_DBIcons18_IconName DESC' THEN [WF_DBIcons18].[IconName] END DESC,
     CASE @OrderBy WHEN 'WF_DBIcons19_IconName' THEN [WF_DBIcons19].[IconName] END,
     CASE @OrderBy WHEN 'WF_DBIcons19_IconName DESC' THEN [WF_DBIcons19].[IconName] END DESC,
     CASE @OrderBy WHEN 'WF_DBIcons20_IconName' THEN [WF_DBIcons20].[IconName] END,
     CASE @OrderBy WHEN 'WF_DBIcons20_IconName DESC' THEN [WF_DBIcons20].[IconName] END DESC,
     CASE @OrderBy WHEN 'WF_DBIcons21_IconName' THEN [WF_DBIcons21].[IconName] END,
     CASE @OrderBy WHEN 'WF_DBIcons21_IconName DESC' THEN [WF_DBIcons21].[IconName] END DESC,
     CASE @OrderBy WHEN 'WF_DBIcons22_IconName' THEN [WF_DBIcons22].[IconName] END,
     CASE @OrderBy WHEN 'WF_DBIcons22_IconName DESC' THEN [WF_DBIcons22].[IconName] END DESC,
     CASE @OrderBy WHEN 'WF_DBData23_Description' THEN [WF_DBData23].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData23_Description DESC' THEN [WF_DBData23].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBData24_Description' THEN [WF_DBData24].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData24_Description DESC' THEN [WF_DBData24].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBData25_Description' THEN [WF_DBData25].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData25_Description DESC' THEN [WF_DBData25].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBData26_Description' THEN [WF_DBData26].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData26_Description DESC' THEN [WF_DBData26].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBData27_Description' THEN [WF_DBData27].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData27_Description DESC' THEN [WF_DBData27].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBData28_Description' THEN [WF_DBData28].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData28_Description DESC' THEN [WF_DBData28].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBData29_Description' THEN [WF_DBData29].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData29_Description DESC' THEN [WF_DBData29].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBData30_Description' THEN [WF_DBData30].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData30_Description DESC' THEN [WF_DBData30].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBData31_Description' THEN [WF_DBData31].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData31_Description DESC' THEN [WF_DBData31].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBData32_Description' THEN [WF_DBData32].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData32_Description DESC' THEN [WF_DBData32].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
