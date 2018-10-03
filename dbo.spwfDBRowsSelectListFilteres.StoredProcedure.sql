USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBRowsSelectListFilteres]
  @Filter_DashboardID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,DashboardID Int NOT NULL
 ,DBRows Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'DashboardID'
  SET @LGSQL = @LGSQL + ', DBRows'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[WF_DBRows].[DashboardID]'
  SET @LGSQL = @LGSQL + ', [WF_DBRows].[DBRows]'
  SET @LGSQL = @LGSQL + ' FROM [WF_DBRows] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [WF_Dashboards] AS [WF_Dashboards1]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[DashboardID] = [WF_Dashboards1].[DashboardID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBRows] AS [WF_DBRows2]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[DashboardID] = [WF_DBRows2].[DashboardID]'
  SET @LGSQL = @LGSQL + '    AND [WF_DBRows].[ParentDBRows] = [WF_DBRows2].[DBRows]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBRowTypes] AS [WF_DBRowTypes3]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[DBRowTypeID] = [WF_DBRowTypes3].[RowTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_GraphTypes] AS [WF_GraphTypes4]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[GraphTypeID] = [WF_GraphTypes4].[GraphTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DetailViewTypes] AS [WF_DetailViewTypes5]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[DVTypeID] = [WF_DetailViewTypes5].[DVTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData6]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[DVReverseDBDataID] = [WF_DBData6].[DBDataID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData7]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[DVFEMailDBDataID] = [WF_DBData7].[DBDataID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData8]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[DVFSMSDBDataID] = [WF_DBData8].[DBDataID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData9]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[DVREMailDBDataID] = [WF_DBData9].[DBDataID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData10]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[DVRSMSDBDataID] = [WF_DBData10].[DBDataID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData11]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[ReminderCountDBDataID] = [WF_DBData11].[DBDataID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData12]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[ReminderAvgDBDataID] = [WF_DBData12].[DBDataID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData13]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[ReminderMaxDBDataID] = [WF_DBData13].[DBDataID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData14]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[MainDBDataID] = [WF_DBData14].[DBDataID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData15]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[DVDBDataID] = [WF_DBData15].[DBDataID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData16]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[DVForwardDBDataID] = [WF_DBData16].[DBDataID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBIcons] AS [WF_DBIcons17]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[MainDBIconID] = [WF_DBIcons17].[DBIconID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBIcons] AS [WF_DBIcons18]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[DVDBIconID] = [WF_DBIcons18].[DBIconID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBIcons] AS [WF_DBIcons19]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[DVRemarksDBIconID] = [WF_DBIcons19].[DBIconID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBIcons] AS [WF_DBIcons20]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[DVFDBIconID] = [WF_DBIcons20].[DBIconID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBIcons] AS [WF_DBIcons21]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[DVRDBIconID] = [WF_DBIcons21].[DBIconID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBIcons] AS [WF_DBIcons22]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[DVAttachmentDBIconID] = [WF_DBIcons22].[DBIconID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData23]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[ReminderEMailDBDataID] = [WF_DBData23].[DBDataID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData24]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[ReminderSMSDBDataID] = [WF_DBData24].[DBDataID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData25]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[TotSqlIDLeft] = [WF_DBData25].[DBDataID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData26]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[RedSqlIDLeft] = [WF_DBData26].[DBDataID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData27]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[AmbSqlIDLeft] = [WF_DBData27].[DBDataID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData28]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[GreSqlIDLeft] = [WF_DBData28].[DBDataID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData29]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[TotSqlIDRight] = [WF_DBData29].[DBDataID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData30]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[AmbSqlIDRight] = [WF_DBData30].[DBDataID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData31]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[GreSqlIDRight] = [WF_DBData31].[DBDataID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData32]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRows].[RedSqlIDRight] = [WF_DBData32].[DBDataID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_DashboardID > 0) 
    SET @LGSQL = @LGSQL + ' AND [WF_DBRows].[DashboardID] = ' + STR(@Filter_DashboardID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DashboardID' THEN '[WF_DBRows].[DashboardID]'
                        WHEN 'DashboardID DESC' THEN '[WF_DBRows].[DashboardID] DESC'
                        WHEN 'DBRows' THEN '[WF_DBRows].[DBRows]'
                        WHEN 'DBRows DESC' THEN '[WF_DBRows].[DBRows] DESC'
                        WHEN 'Description' THEN '[WF_DBRows].[Description]'
                        WHEN 'Description DESC' THEN '[WF_DBRows].[Description] DESC'
                        WHEN 'AddNewURL' THEN '[WF_DBRows].[AddNewURL]'
                        WHEN 'AddNewURL DESC' THEN '[WF_DBRows].[AddNewURL] DESC'
                        WHEN 'IsDVURL' THEN '[WF_DBRows].[IsDVURL]'
                        WHEN 'IsDVURL DESC' THEN '[WF_DBRows].[IsDVURL] DESC'
                        WHEN 'DVURL' THEN '[WF_DBRows].[DVURL]'
                        WHEN 'DVURL DESC' THEN '[WF_DBRows].[DVURL] DESC'
                        WHEN 'DVLaunchURL' THEN '[WF_DBRows].[DVLaunchURL]'
                        WHEN 'DVLaunchURL DESC' THEN '[WF_DBRows].[DVLaunchURL] DESC'
                        WHEN 'DBTitle' THEN '[WF_DBRows].[DBTitle]'
                        WHEN 'DBTitle DESC' THEN '[WF_DBRows].[DBTitle] DESC'
                        WHEN 'TitleStyle' THEN '[WF_DBRows].[TitleStyle]'
                        WHEN 'TitleStyle DESC' THEN '[WF_DBRows].[TitleStyle] DESC'
                        WHEN 'cssRow' THEN '[WF_DBRows].[cssRow]'
                        WHEN 'cssRow DESC' THEN '[WF_DBRows].[cssRow] DESC'
                        WHEN 'Sequence' THEN '[WF_DBRows].[Sequence]'
                        WHEN 'Sequence DESC' THEN '[WF_DBRows].[Sequence] DESC'
                        WHEN 'ShowHeader' THEN '[WF_DBRows].[ShowHeader]'
                        WHEN 'ShowHeader DESC' THEN '[WF_DBRows].[ShowHeader] DESC'
                        WHEN 'GraphTypeID' THEN '[WF_DBRows].[GraphTypeID]'
                        WHEN 'GraphTypeID DESC' THEN '[WF_DBRows].[GraphTypeID] DESC'
                        WHEN 'ConvertForGraph' THEN '[WF_DBRows].[ConvertForGraph]'
                        WHEN 'ConvertForGraph DESC' THEN '[WF_DBRows].[ConvertForGraph] DESC'
                        WHEN 'NotToDraw' THEN '[WF_DBRows].[NotToDraw]'
                        WHEN 'NotToDraw DESC' THEN '[WF_DBRows].[NotToDraw] DESC'
                        WHEN 'ParentDBRows' THEN '[WF_DBRows].[ParentDBRows]'
                        WHEN 'ParentDBRows DESC' THEN '[WF_DBRows].[ParentDBRows] DESC'
                        WHEN 'DBRowTypeID' THEN '[WF_DBRows].[DBRowTypeID]'
                        WHEN 'DBRowTypeID DESC' THEN '[WF_DBRows].[DBRowTypeID] DESC'
                        WHEN 'MainDBDataID' THEN '[WF_DBRows].[MainDBDataID]'
                        WHEN 'MainDBDataID DESC' THEN '[WF_DBRows].[MainDBDataID] DESC'
                        WHEN 'MainDBIconID' THEN '[WF_DBRows].[MainDBIconID]'
                        WHEN 'MainDBIconID DESC' THEN '[WF_DBRows].[MainDBIconID] DESC'
                        WHEN 'IsDV' THEN '[WF_DBRows].[IsDV]'
                        WHEN 'IsDV DESC' THEN '[WF_DBRows].[IsDV] DESC'
                        WHEN 'DVTypeID' THEN '[WF_DBRows].[DVTypeID]'
                        WHEN 'DVTypeID DESC' THEN '[WF_DBRows].[DVTypeID] DESC'
                        WHEN 'DVDescription' THEN '[WF_DBRows].[DVDescription]'
                        WHEN 'DVDescription DESC' THEN '[WF_DBRows].[DVDescription] DESC'
                        WHEN 'DVDBIconID' THEN '[WF_DBRows].[DVDBIconID]'
                        WHEN 'DVDBIconID DESC' THEN '[WF_DBRows].[DVDBIconID] DESC'
                        WHEN 'DVDBDataID' THEN '[WF_DBRows].[DVDBDataID]'
                        WHEN 'DVDBDataID DESC' THEN '[WF_DBRows].[DVDBDataID] DESC'
                        WHEN 'IsDVUpdatable' THEN '[WF_DBRows].[IsDVUpdatable]'
                        WHEN 'IsDVUpdatable DESC' THEN '[WF_DBRows].[IsDVUpdatable] DESC'
                        WHEN 'IsDVRemarks' THEN '[WF_DBRows].[IsDVRemarks]'
                        WHEN 'IsDVRemarks DESC' THEN '[WF_DBRows].[IsDVRemarks] DESC'
                        WHEN 'DVRemarksText' THEN '[WF_DBRows].[DVRemarksText]'
                        WHEN 'DVRemarksText DESC' THEN '[WF_DBRows].[DVRemarksText] DESC'
                        WHEN 'DVRemarksDBIconID' THEN '[WF_DBRows].[DVRemarksDBIconID]'
                        WHEN 'DVRemarksDBIconID DESC' THEN '[WF_DBRows].[DVRemarksDBIconID] DESC'
                        WHEN 'IsDVForward' THEN '[WF_DBRows].[IsDVForward]'
                        WHEN 'IsDVForward DESC' THEN '[WF_DBRows].[IsDVForward] DESC'
                        WHEN 'DVForwardText' THEN '[WF_DBRows].[DVForwardText]'
                        WHEN 'DVForwardText DESC' THEN '[WF_DBRows].[DVForwardText] DESC'
                        WHEN 'DVFDBIconID' THEN '[WF_DBRows].[DVFDBIconID]'
                        WHEN 'DVFDBIconID DESC' THEN '[WF_DBRows].[DVFDBIconID] DESC'
                        WHEN 'DVForwardDBDataID' THEN '[WF_DBRows].[DVForwardDBDataID]'
                        WHEN 'DVForwardDBDataID DESC' THEN '[WF_DBRows].[DVForwardDBDataID] DESC'
                        WHEN 'IsDVReverse' THEN '[WF_DBRows].[IsDVReverse]'
                        WHEN 'IsDVReverse DESC' THEN '[WF_DBRows].[IsDVReverse] DESC'
                        WHEN 'DVReverseText' THEN '[WF_DBRows].[DVReverseText]'
                        WHEN 'DVReverseText DESC' THEN '[WF_DBRows].[DVReverseText] DESC'
                        WHEN 'DVRDBIconID' THEN '[WF_DBRows].[DVRDBIconID]'
                        WHEN 'DVRDBIconID DESC' THEN '[WF_DBRows].[DVRDBIconID] DESC'
                        WHEN 'DVReverseDBDataID' THEN '[WF_DBRows].[DVReverseDBDataID]'
                        WHEN 'DVReverseDBDataID DESC' THEN '[WF_DBRows].[DVReverseDBDataID] DESC'
                        WHEN 'IsDVAttachment' THEN '[WF_DBRows].[IsDVAttachment]'
                        WHEN 'IsDVAttachment DESC' THEN '[WF_DBRows].[IsDVAttachment] DESC'
                        WHEN 'IsDVAttachmentMulti' THEN '[WF_DBRows].[IsDVAttachmentMulti]'
                        WHEN 'IsDVAttachmentMulti DESC' THEN '[WF_DBRows].[IsDVAttachmentMulti] DESC'
                        WHEN 'DVAttachmentText' THEN '[WF_DBRows].[DVAttachmentText]'
                        WHEN 'DVAttachmentText DESC' THEN '[WF_DBRows].[DVAttachmentText] DESC'
                        WHEN 'DVAttachmentDBIconID' THEN '[WF_DBRows].[DVAttachmentDBIconID]'
                        WHEN 'DVAttachmentDBIconID DESC' THEN '[WF_DBRows].[DVAttachmentDBIconID] DESC'
                        WHEN 'DVFAlert' THEN '[WF_DBRows].[DVFAlert]'
                        WHEN 'DVFAlert DESC' THEN '[WF_DBRows].[DVFAlert] DESC'
                        WHEN 'DVFAlertEMail' THEN '[WF_DBRows].[DVFAlertEMail]'
                        WHEN 'DVFAlertEMail DESC' THEN '[WF_DBRows].[DVFAlertEMail] DESC'
                        WHEN 'DVFASubject' THEN '[WF_DBRows].[DVFASubject]'
                        WHEN 'DVFASubject DESC' THEN '[WF_DBRows].[DVFASubject] DESC'
                        WHEN 'DVFABodyTemplate' THEN '[WF_DBRows].[DVFABodyTemplate]'
                        WHEN 'DVFABodyTemplate DESC' THEN '[WF_DBRows].[DVFABodyTemplate] DESC'
                        WHEN 'DVFEMailDBDataID' THEN '[WF_DBRows].[DVFEMailDBDataID]'
                        WHEN 'DVFEMailDBDataID DESC' THEN '[WF_DBRows].[DVFEMailDBDataID] DESC'
                        WHEN 'DVFAlertSMS' THEN '[WF_DBRows].[DVFAlertSMS]'
                        WHEN 'DVFAlertSMS DESC' THEN '[WF_DBRows].[DVFAlertSMS] DESC'
                        WHEN 'DVFASMSText' THEN '[WF_DBRows].[DVFASMSText]'
                        WHEN 'DVFASMSText DESC' THEN '[WF_DBRows].[DVFASMSText] DESC'
                        WHEN 'DVFSMSDBDataID' THEN '[WF_DBRows].[DVFSMSDBDataID]'
                        WHEN 'DVFSMSDBDataID DESC' THEN '[WF_DBRows].[DVFSMSDBDataID] DESC'
                        WHEN 'DVRAlert' THEN '[WF_DBRows].[DVRAlert]'
                        WHEN 'DVRAlert DESC' THEN '[WF_DBRows].[DVRAlert] DESC'
                        WHEN 'DVRAlertEMail' THEN '[WF_DBRows].[DVRAlertEMail]'
                        WHEN 'DVRAlertEMail DESC' THEN '[WF_DBRows].[DVRAlertEMail] DESC'
                        WHEN 'DVRASubject' THEN '[WF_DBRows].[DVRASubject]'
                        WHEN 'DVRASubject DESC' THEN '[WF_DBRows].[DVRASubject] DESC'
                        WHEN 'DVRABodyTemplate' THEN '[WF_DBRows].[DVRABodyTemplate]'
                        WHEN 'DVRABodyTemplate DESC' THEN '[WF_DBRows].[DVRABodyTemplate] DESC'
                        WHEN 'DVREMailDBDataID' THEN '[WF_DBRows].[DVREMailDBDataID]'
                        WHEN 'DVREMailDBDataID DESC' THEN '[WF_DBRows].[DVREMailDBDataID] DESC'
                        WHEN 'DVRAlertSMS' THEN '[WF_DBRows].[DVRAlertSMS]'
                        WHEN 'DVRAlertSMS DESC' THEN '[WF_DBRows].[DVRAlertSMS] DESC'
                        WHEN 'DVRASMSText' THEN '[WF_DBRows].[DVRASMSText]'
                        WHEN 'DVRASMSText DESC' THEN '[WF_DBRows].[DVRASMSText] DESC'
                        WHEN 'DVRSMSDBDataID' THEN '[WF_DBRows].[DVRSMSDBDataID]'
                        WHEN 'DVRSMSDBDataID DESC' THEN '[WF_DBRows].[DVRSMSDBDataID] DESC'
                        WHEN 'ReminderOnCount' THEN '[WF_DBRows].[ReminderOnCount]'
                        WHEN 'ReminderOnCount DESC' THEN '[WF_DBRows].[ReminderOnCount] DESC'
                        WHEN 'ReminderCountThreshold' THEN '[WF_DBRows].[ReminderCountThreshold]'
                        WHEN 'ReminderCountThreshold DESC' THEN '[WF_DBRows].[ReminderCountThreshold] DESC'
                        WHEN 'ReminderCountDBDataID' THEN '[WF_DBRows].[ReminderCountDBDataID]'
                        WHEN 'ReminderCountDBDataID DESC' THEN '[WF_DBRows].[ReminderCountDBDataID] DESC'
                        WHEN 'ReminderOnAvg' THEN '[WF_DBRows].[ReminderOnAvg]'
                        WHEN 'ReminderOnAvg DESC' THEN '[WF_DBRows].[ReminderOnAvg] DESC'
                        WHEN 'ReminderLapsDaysAvg' THEN '[WF_DBRows].[ReminderLapsDaysAvg]'
                        WHEN 'ReminderLapsDaysAvg DESC' THEN '[WF_DBRows].[ReminderLapsDaysAvg] DESC'
                        WHEN 'ReminderAvgDBDataID' THEN '[WF_DBRows].[ReminderAvgDBDataID]'
                        WHEN 'ReminderAvgDBDataID DESC' THEN '[WF_DBRows].[ReminderAvgDBDataID] DESC'
                        WHEN 'ReminderOnMax' THEN '[WF_DBRows].[ReminderOnMax]'
                        WHEN 'ReminderOnMax DESC' THEN '[WF_DBRows].[ReminderOnMax] DESC'
                        WHEN 'ReminderLapsDaysMax' THEN '[WF_DBRows].[ReminderLapsDaysMax]'
                        WHEN 'ReminderLapsDaysMax DESC' THEN '[WF_DBRows].[ReminderLapsDaysMax] DESC'
                        WHEN 'ReminderMaxDBDataID' THEN '[WF_DBRows].[ReminderMaxDBDataID]'
                        WHEN 'ReminderMaxDBDataID DESC' THEN '[WF_DBRows].[ReminderMaxDBDataID] DESC'
                        WHEN 'ReminderFrequencyDays' THEN '[WF_DBRows].[ReminderFrequencyDays]'
                        WHEN 'ReminderFrequencyDays DESC' THEN '[WF_DBRows].[ReminderFrequencyDays] DESC'
                        WHEN 'ReminderAlertEMail' THEN '[WF_DBRows].[ReminderAlertEMail]'
                        WHEN 'ReminderAlertEMail DESC' THEN '[WF_DBRows].[ReminderAlertEMail] DESC'
                        WHEN 'ReminderEMailDBDataID' THEN '[WF_DBRows].[ReminderEMailDBDataID]'
                        WHEN 'ReminderEMailDBDataID DESC' THEN '[WF_DBRows].[ReminderEMailDBDataID] DESC'
                        WHEN 'ReminderASubject' THEN '[WF_DBRows].[ReminderASubject]'
                        WHEN 'ReminderASubject DESC' THEN '[WF_DBRows].[ReminderASubject] DESC'
                        WHEN 'ReminderABodyTemplate' THEN '[WF_DBRows].[ReminderABodyTemplate]'
                        WHEN 'ReminderABodyTemplate DESC' THEN '[WF_DBRows].[ReminderABodyTemplate] DESC'
                        WHEN 'ReminderAlertSMS' THEN '[WF_DBRows].[ReminderAlertSMS]'
                        WHEN 'ReminderAlertSMS DESC' THEN '[WF_DBRows].[ReminderAlertSMS] DESC'
                        WHEN 'ReminderSMSDBDataID' THEN '[WF_DBRows].[ReminderSMSDBDataID]'
                        WHEN 'ReminderSMSDBDataID DESC' THEN '[WF_DBRows].[ReminderSMSDBDataID] DESC'
                        WHEN 'ReminderASMSText' THEN '[WF_DBRows].[ReminderASMSText]'
                        WHEN 'ReminderASMSText DESC' THEN '[WF_DBRows].[ReminderASMSText] DESC'
                        WHEN 'IsLeft' THEN '[WF_DBRows].[IsLeft]'
                        WHEN 'IsLeft DESC' THEN '[WF_DBRows].[IsLeft] DESC'
                        WHEN 'AppNameLeft' THEN '[WF_DBRows].[AppNameLeft]'
                        WHEN 'AppNameLeft DESC' THEN '[WF_DBRows].[AppNameLeft] DESC'
                        WHEN 'TotSqlIDLeft' THEN '[WF_DBRows].[TotSqlIDLeft]'
                        WHEN 'TotSqlIDLeft DESC' THEN '[WF_DBRows].[TotSqlIDLeft] DESC'
                        WHEN 'RedSqlIDLeft' THEN '[WF_DBRows].[RedSqlIDLeft]'
                        WHEN 'RedSqlIDLeft DESC' THEN '[WF_DBRows].[RedSqlIDLeft] DESC'
                        WHEN 'AmbSqlIDLeft' THEN '[WF_DBRows].[AmbSqlIDLeft]'
                        WHEN 'AmbSqlIDLeft DESC' THEN '[WF_DBRows].[AmbSqlIDLeft] DESC'
                        WHEN 'GreSqlIDLeft' THEN '[WF_DBRows].[GreSqlIDLeft]'
                        WHEN 'GreSqlIDLeft DESC' THEN '[WF_DBRows].[GreSqlIDLeft] DESC'
                        WHEN 'HaveNewLeft' THEN '[WF_DBRows].[HaveNewLeft]'
                        WHEN 'HaveNewLeft DESC' THEN '[WF_DBRows].[HaveNewLeft] DESC'
                        WHEN 'HaveRemLeft' THEN '[WF_DBRows].[HaveRemLeft]'
                        WHEN 'HaveRemLeft DESC' THEN '[WF_DBRows].[HaveRemLeft] DESC'
                        WHEN 'IsRight' THEN '[WF_DBRows].[IsRight]'
                        WHEN 'IsRight DESC' THEN '[WF_DBRows].[IsRight] DESC'
                        WHEN 'AppNameRight' THEN '[WF_DBRows].[AppNameRight]'
                        WHEN 'AppNameRight DESC' THEN '[WF_DBRows].[AppNameRight] DESC'
                        WHEN 'TotSqlIDRight' THEN '[WF_DBRows].[TotSqlIDRight]'
                        WHEN 'TotSqlIDRight DESC' THEN '[WF_DBRows].[TotSqlIDRight] DESC'
                        WHEN 'RedSqlIDRight' THEN '[WF_DBRows].[RedSqlIDRight]'
                        WHEN 'RedSqlIDRight DESC' THEN '[WF_DBRows].[RedSqlIDRight] DESC'
                        WHEN 'AmbSqlIDRight' THEN '[WF_DBRows].[AmbSqlIDRight]'
                        WHEN 'AmbSqlIDRight DESC' THEN '[WF_DBRows].[AmbSqlIDRight] DESC'
                        WHEN 'GreSqlIDRight' THEN '[WF_DBRows].[GreSqlIDRight]'
                        WHEN 'GreSqlIDRight DESC' THEN '[WF_DBRows].[GreSqlIDRight] DESC'
                        WHEN 'HaveNewRight' THEN '[WF_DBRows].[HaveNewRight]'
                        WHEN 'HaveNewRight DESC' THEN '[WF_DBRows].[HaveNewRight] DESC'
                        WHEN 'HaveRemRight' THEN '[WF_DBRows].[HaveRemRight]'
                        WHEN 'HaveRemRight DESC' THEN '[WF_DBRows].[HaveRemRight] DESC'
                        WHEN 'WF_Dashboards1_DBDescription' THEN '[WF_Dashboards1].[DBDescription]'
                        WHEN 'WF_Dashboards1_DBDescription DESC' THEN '[WF_Dashboards1].[DBDescription] DESC'
                        WHEN 'WF_DBRows2_Description' THEN '[WF_DBRows2].[Description]'
                        WHEN 'WF_DBRows2_Description DESC' THEN '[WF_DBRows2].[Description] DESC'
                        WHEN 'WF_DBRowTypes3_Description' THEN '[WF_DBRowTypes3].[Description]'
                        WHEN 'WF_DBRowTypes3_Description DESC' THEN '[WF_DBRowTypes3].[Description] DESC'
                        WHEN 'WF_GraphTypes4_Description' THEN '[WF_GraphTypes4].[Description]'
                        WHEN 'WF_GraphTypes4_Description DESC' THEN '[WF_GraphTypes4].[Description] DESC'
                        WHEN 'WF_DetailViewTypes5_DVTypeDescription' THEN '[WF_DetailViewTypes5].[DVTypeDescription]'
                        WHEN 'WF_DetailViewTypes5_DVTypeDescription DESC' THEN '[WF_DetailViewTypes5].[DVTypeDescription] DESC'
                        WHEN 'WF_DBData6_Description' THEN '[WF_DBData6].[Description]'
                        WHEN 'WF_DBData6_Description DESC' THEN '[WF_DBData6].[Description] DESC'
                        WHEN 'WF_DBData7_Description' THEN '[WF_DBData7].[Description]'
                        WHEN 'WF_DBData7_Description DESC' THEN '[WF_DBData7].[Description] DESC'
                        WHEN 'WF_DBData8_Description' THEN '[WF_DBData8].[Description]'
                        WHEN 'WF_DBData8_Description DESC' THEN '[WF_DBData8].[Description] DESC'
                        WHEN 'WF_DBData9_Description' THEN '[WF_DBData9].[Description]'
                        WHEN 'WF_DBData9_Description DESC' THEN '[WF_DBData9].[Description] DESC'
                        WHEN 'WF_DBData10_Description' THEN '[WF_DBData10].[Description]'
                        WHEN 'WF_DBData10_Description DESC' THEN '[WF_DBData10].[Description] DESC'
                        WHEN 'WF_DBData11_Description' THEN '[WF_DBData11].[Description]'
                        WHEN 'WF_DBData11_Description DESC' THEN '[WF_DBData11].[Description] DESC'
                        WHEN 'WF_DBData12_Description' THEN '[WF_DBData12].[Description]'
                        WHEN 'WF_DBData12_Description DESC' THEN '[WF_DBData12].[Description] DESC'
                        WHEN 'WF_DBData13_Description' THEN '[WF_DBData13].[Description]'
                        WHEN 'WF_DBData13_Description DESC' THEN '[WF_DBData13].[Description] DESC'
                        WHEN 'WF_DBData14_Description' THEN '[WF_DBData14].[Description]'
                        WHEN 'WF_DBData14_Description DESC' THEN '[WF_DBData14].[Description] DESC'
                        WHEN 'WF_DBData15_Description' THEN '[WF_DBData15].[Description]'
                        WHEN 'WF_DBData15_Description DESC' THEN '[WF_DBData15].[Description] DESC'
                        WHEN 'WF_DBData16_Description' THEN '[WF_DBData16].[Description]'
                        WHEN 'WF_DBData16_Description DESC' THEN '[WF_DBData16].[Description] DESC'
                        WHEN 'WF_DBIcons17_IconName' THEN '[WF_DBIcons17].[IconName]'
                        WHEN 'WF_DBIcons17_IconName DESC' THEN '[WF_DBIcons17].[IconName] DESC'
                        WHEN 'WF_DBIcons18_IconName' THEN '[WF_DBIcons18].[IconName]'
                        WHEN 'WF_DBIcons18_IconName DESC' THEN '[WF_DBIcons18].[IconName] DESC'
                        WHEN 'WF_DBIcons19_IconName' THEN '[WF_DBIcons19].[IconName]'
                        WHEN 'WF_DBIcons19_IconName DESC' THEN '[WF_DBIcons19].[IconName] DESC'
                        WHEN 'WF_DBIcons20_IconName' THEN '[WF_DBIcons20].[IconName]'
                        WHEN 'WF_DBIcons20_IconName DESC' THEN '[WF_DBIcons20].[IconName] DESC'
                        WHEN 'WF_DBIcons21_IconName' THEN '[WF_DBIcons21].[IconName]'
                        WHEN 'WF_DBIcons21_IconName DESC' THEN '[WF_DBIcons21].[IconName] DESC'
                        WHEN 'WF_DBIcons22_IconName' THEN '[WF_DBIcons22].[IconName]'
                        WHEN 'WF_DBIcons22_IconName DESC' THEN '[WF_DBIcons22].[IconName] DESC'
                        WHEN 'WF_DBData23_Description' THEN '[WF_DBData23].[Description]'
                        WHEN 'WF_DBData23_Description DESC' THEN '[WF_DBData23].[Description] DESC'
                        WHEN 'WF_DBData24_Description' THEN '[WF_DBData24].[Description]'
                        WHEN 'WF_DBData24_Description DESC' THEN '[WF_DBData24].[Description] DESC'
                        WHEN 'WF_DBData25_Description' THEN '[WF_DBData25].[Description]'
                        WHEN 'WF_DBData25_Description DESC' THEN '[WF_DBData25].[Description] DESC'
                        WHEN 'WF_DBData26_Description' THEN '[WF_DBData26].[Description]'
                        WHEN 'WF_DBData26_Description DESC' THEN '[WF_DBData26].[Description] DESC'
                        WHEN 'WF_DBData27_Description' THEN '[WF_DBData27].[Description]'
                        WHEN 'WF_DBData27_Description DESC' THEN '[WF_DBData27].[Description] DESC'
                        WHEN 'WF_DBData28_Description' THEN '[WF_DBData28].[Description]'
                        WHEN 'WF_DBData28_Description DESC' THEN '[WF_DBData28].[Description] DESC'
                        WHEN 'WF_DBData29_Description' THEN '[WF_DBData29].[Description]'
                        WHEN 'WF_DBData29_Description DESC' THEN '[WF_DBData29].[Description] DESC'
                        WHEN 'WF_DBData30_Description' THEN '[WF_DBData30].[Description]'
                        WHEN 'WF_DBData30_Description DESC' THEN '[WF_DBData30].[Description] DESC'
                        WHEN 'WF_DBData31_Description' THEN '[WF_DBData31].[Description]'
                        WHEN 'WF_DBData31_Description DESC' THEN '[WF_DBData31].[Description] DESC'
                        WHEN 'WF_DBData32_Description' THEN '[WF_DBData32].[Description]'
                        WHEN 'WF_DBData32_Description DESC' THEN '[WF_DBData32].[Description] DESC'
                        ELSE '[WF_DBRows].[DashboardID],[WF_DBRows].[DBRows]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

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
      INNER JOIN #PageIndex
          ON [WF_DBRows].[DashboardID] = #PageIndex.DashboardID
          AND [WF_DBRows].[DBRows] = #PageIndex.DBRows
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
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
