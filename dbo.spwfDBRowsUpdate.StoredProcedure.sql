USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBRowsUpdate]
  @Original_DashboardID Int, 
  @Original_DBRows Int, 
  @DashboardID Int,
  @Description NVarChar(50),
  @AddNewURL NVarChar(500),
  @IsDVURL Bit,
  @DVURL NVarChar(500),
  @DVLaunchURL NVarChar(500),
  @DBTitle NVarChar(100),
  @TitleStyle NVarChar(250),
  @cssRow NVarChar(50),
  @Sequence Int,
  @ShowHeader Bit,
  @GraphTypeID Int,
  @ConvertForGraph Bit,
  @NotToDraw Bit,
  @ParentDBRows Int,
  @DBRowTypeID Int,
  @MainDBDataID Int,
  @MainDBIconID Int,
  @IsDV Bit,
  @DVTypeID Int,
  @DVDescription NVarChar(100),
  @DVDBIconID Int,
  @DVDBDataID Int,
  @IsDVUpdatable Bit,
  @IsDVRemarks Bit,
  @DVRemarksText NVarChar(50),
  @DVRemarksDBIconID Int,
  @IsDVForward Bit,
  @DVForwardText NVarChar(50),
  @DVFDBIconID Int,
  @DVForwardDBDataID Int,
  @IsDVReverse Bit,
  @DVReverseText NVarChar(50),
  @DVRDBIconID Int,
  @DVReverseDBDataID Int,
  @IsDVAttachment Bit,
  @IsDVAttachmentMulti Bit,
  @DVAttachmentText NVarChar(50),
  @DVAttachmentDBIconID Int,
  @DVFAlert Bit,
  @DVFAlertEMail Bit,
  @DVFASubject NVarChar(100),
  @DVFABodyTemplate NVarChar(100),
  @DVFEMailDBDataID Int,
  @DVFAlertSMS Bit,
  @DVFASMSText NVarChar(500),
  @DVFSMSDBDataID Int,
  @DVRAlert Bit,
  @DVRAlertEMail Bit,
  @DVRASubject NVarChar(100),
  @DVRABodyTemplate NVarChar(100),
  @DVREMailDBDataID Int,
  @DVRAlertSMS Bit,
  @DVRASMSText NVarChar(500),
  @DVRSMSDBDataID Int,
  @ReminderOnCount Bit,
  @ReminderCountThreshold Int,
  @ReminderCountDBDataID Int,
  @ReminderOnAvg Bit,
  @ReminderLapsDaysAvg Int,
  @ReminderAvgDBDataID Int,
  @ReminderOnMax Bit,
  @ReminderLapsDaysMax Int,
  @ReminderMaxDBDataID Int,
  @ReminderFrequencyDays Int,
  @ReminderAlertEMail Bit,
  @ReminderEMailDBDataID Int,
  @ReminderASubject NVarChar(100),
  @ReminderABodyTemplate NVarChar(100),
  @ReminderAlertSMS Bit,
  @ReminderSMSDBDataID Int,
  @ReminderASMSText NVarChar(500),
  @IsLeft Bit,
  @AppNameLeft NVarChar(100),
  @TotSqlIDLeft Int,
  @RedSqlIDLeft Int,
  @AmbSqlIDLeft Int,
  @GreSqlIDLeft Int,
  @HaveNewLeft Bit,
  @HaveRemLeft Bit,
  @IsRight Bit,
  @AppNameRight NVarChar(100),
  @TotSqlIDRight Int,
  @RedSqlIDRight Int,
  @AmbSqlIDRight Int,
  @GreSqlIDRight Int,
  @HaveNewRight Bit,
  @HaveRemRight Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [WF_DBRows] SET 
   [DashboardID] = @DashboardID
  ,[Description] = @Description
  ,[AddNewURL] = @AddNewURL
  ,[IsDVURL] = @IsDVURL
  ,[DVURL] = @DVURL
  ,[DVLaunchURL] = @DVLaunchURL
  ,[DBTitle] = @DBTitle
  ,[TitleStyle] = @TitleStyle
  ,[cssRow] = @cssRow
  ,[Sequence] = @Sequence
  ,[ShowHeader] = @ShowHeader
  ,[GraphTypeID] = @GraphTypeID
  ,[ConvertForGraph] = @ConvertForGraph
  ,[NotToDraw] = @NotToDraw
  ,[ParentDBRows] = @ParentDBRows
  ,[DBRowTypeID] = @DBRowTypeID
  ,[MainDBDataID] = @MainDBDataID
  ,[MainDBIconID] = @MainDBIconID
  ,[IsDV] = @IsDV
  ,[DVTypeID] = @DVTypeID
  ,[DVDescription] = @DVDescription
  ,[DVDBIconID] = @DVDBIconID
  ,[DVDBDataID] = @DVDBDataID
  ,[IsDVUpdatable] = @IsDVUpdatable
  ,[IsDVRemarks] = @IsDVRemarks
  ,[DVRemarksText] = @DVRemarksText
  ,[DVRemarksDBIconID] = @DVRemarksDBIconID
  ,[IsDVForward] = @IsDVForward
  ,[DVForwardText] = @DVForwardText
  ,[DVFDBIconID] = @DVFDBIconID
  ,[DVForwardDBDataID] = @DVForwardDBDataID
  ,[IsDVReverse] = @IsDVReverse
  ,[DVReverseText] = @DVReverseText
  ,[DVRDBIconID] = @DVRDBIconID
  ,[DVReverseDBDataID] = @DVReverseDBDataID
  ,[IsDVAttachment] = @IsDVAttachment
  ,[IsDVAttachmentMulti] = @IsDVAttachmentMulti
  ,[DVAttachmentText] = @DVAttachmentText
  ,[DVAttachmentDBIconID] = @DVAttachmentDBIconID
  ,[DVFAlert] = @DVFAlert
  ,[DVFAlertEMail] = @DVFAlertEMail
  ,[DVFASubject] = @DVFASubject
  ,[DVFABodyTemplate] = @DVFABodyTemplate
  ,[DVFEMailDBDataID] = @DVFEMailDBDataID
  ,[DVFAlertSMS] = @DVFAlertSMS
  ,[DVFASMSText] = @DVFASMSText
  ,[DVFSMSDBDataID] = @DVFSMSDBDataID
  ,[DVRAlert] = @DVRAlert
  ,[DVRAlertEMail] = @DVRAlertEMail
  ,[DVRASubject] = @DVRASubject
  ,[DVRABodyTemplate] = @DVRABodyTemplate
  ,[DVREMailDBDataID] = @DVREMailDBDataID
  ,[DVRAlertSMS] = @DVRAlertSMS
  ,[DVRASMSText] = @DVRASMSText
  ,[DVRSMSDBDataID] = @DVRSMSDBDataID
  ,[ReminderOnCount] = @ReminderOnCount
  ,[ReminderCountThreshold] = @ReminderCountThreshold
  ,[ReminderCountDBDataID] = @ReminderCountDBDataID
  ,[ReminderOnAvg] = @ReminderOnAvg
  ,[ReminderLapsDaysAvg] = @ReminderLapsDaysAvg
  ,[ReminderAvgDBDataID] = @ReminderAvgDBDataID
  ,[ReminderOnMax] = @ReminderOnMax
  ,[ReminderLapsDaysMax] = @ReminderLapsDaysMax
  ,[ReminderMaxDBDataID] = @ReminderMaxDBDataID
  ,[ReminderFrequencyDays] = @ReminderFrequencyDays
  ,[ReminderAlertEMail] = @ReminderAlertEMail
  ,[ReminderEMailDBDataID] = @ReminderEMailDBDataID
  ,[ReminderASubject] = @ReminderASubject
  ,[ReminderABodyTemplate] = @ReminderABodyTemplate
  ,[ReminderAlertSMS] = @ReminderAlertSMS
  ,[ReminderSMSDBDataID] = @ReminderSMSDBDataID
  ,[ReminderASMSText] = @ReminderASMSText
  ,[IsLeft] = @IsLeft
  ,[AppNameLeft] = @AppNameLeft
  ,[TotSqlIDLeft] = @TotSqlIDLeft
  ,[RedSqlIDLeft] = @RedSqlIDLeft
  ,[AmbSqlIDLeft] = @AmbSqlIDLeft
  ,[GreSqlIDLeft] = @GreSqlIDLeft
  ,[HaveNewLeft] = @HaveNewLeft
  ,[HaveRemLeft] = @HaveRemLeft
  ,[IsRight] = @IsRight
  ,[AppNameRight] = @AppNameRight
  ,[TotSqlIDRight] = @TotSqlIDRight
  ,[RedSqlIDRight] = @RedSqlIDRight
  ,[AmbSqlIDRight] = @AmbSqlIDRight
  ,[GreSqlIDRight] = @GreSqlIDRight
  ,[HaveNewRight] = @HaveNewRight
  ,[HaveRemRight] = @HaveRemRight
  WHERE
  [DashboardID] = @Original_DashboardID
  AND [DBRows] = @Original_DBRows
  SET @RowCount = @@RowCount
GO
