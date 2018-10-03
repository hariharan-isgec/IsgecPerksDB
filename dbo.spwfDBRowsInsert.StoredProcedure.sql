USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBRowsInsert]
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
  @Return_DashboardID Int = null OUTPUT, 
  @Return_DBRows Int = null OUTPUT 
  AS
  INSERT [WF_DBRows]
  (
   [DashboardID]
  ,[Description]
  ,[AddNewURL]
  ,[IsDVURL]
  ,[DVURL]
  ,[DVLaunchURL]
  ,[DBTitle]
  ,[TitleStyle]
  ,[cssRow]
  ,[Sequence]
  ,[ShowHeader]
  ,[GraphTypeID]
  ,[ConvertForGraph]
  ,[NotToDraw]
  ,[ParentDBRows]
  ,[DBRowTypeID]
  ,[MainDBDataID]
  ,[MainDBIconID]
  ,[IsDV]
  ,[DVTypeID]
  ,[DVDescription]
  ,[DVDBIconID]
  ,[DVDBDataID]
  ,[IsDVUpdatable]
  ,[IsDVRemarks]
  ,[DVRemarksText]
  ,[DVRemarksDBIconID]
  ,[IsDVForward]
  ,[DVForwardText]
  ,[DVFDBIconID]
  ,[DVForwardDBDataID]
  ,[IsDVReverse]
  ,[DVReverseText]
  ,[DVRDBIconID]
  ,[DVReverseDBDataID]
  ,[IsDVAttachment]
  ,[IsDVAttachmentMulti]
  ,[DVAttachmentText]
  ,[DVAttachmentDBIconID]
  ,[DVFAlert]
  ,[DVFAlertEMail]
  ,[DVFASubject]
  ,[DVFABodyTemplate]
  ,[DVFEMailDBDataID]
  ,[DVFAlertSMS]
  ,[DVFASMSText]
  ,[DVFSMSDBDataID]
  ,[DVRAlert]
  ,[DVRAlertEMail]
  ,[DVRASubject]
  ,[DVRABodyTemplate]
  ,[DVREMailDBDataID]
  ,[DVRAlertSMS]
  ,[DVRASMSText]
  ,[DVRSMSDBDataID]
  ,[ReminderOnCount]
  ,[ReminderCountThreshold]
  ,[ReminderCountDBDataID]
  ,[ReminderOnAvg]
  ,[ReminderLapsDaysAvg]
  ,[ReminderAvgDBDataID]
  ,[ReminderOnMax]
  ,[ReminderLapsDaysMax]
  ,[ReminderMaxDBDataID]
  ,[ReminderFrequencyDays]
  ,[ReminderAlertEMail]
  ,[ReminderEMailDBDataID]
  ,[ReminderASubject]
  ,[ReminderABodyTemplate]
  ,[ReminderAlertSMS]
  ,[ReminderSMSDBDataID]
  ,[ReminderASMSText]
  ,[IsLeft]
  ,[AppNameLeft]
  ,[TotSqlIDLeft]
  ,[RedSqlIDLeft]
  ,[AmbSqlIDLeft]
  ,[GreSqlIDLeft]
  ,[HaveNewLeft]
  ,[HaveRemLeft]
  ,[IsRight]
  ,[AppNameRight]
  ,[TotSqlIDRight]
  ,[RedSqlIDRight]
  ,[AmbSqlIDRight]
  ,[GreSqlIDRight]
  ,[HaveNewRight]
  ,[HaveRemRight]
  )
  VALUES
  (
   @DashboardID
  ,@Description
  ,@AddNewURL
  ,@IsDVURL
  ,@DVURL
  ,@DVLaunchURL
  ,@DBTitle
  ,@TitleStyle
  ,@cssRow
  ,@Sequence
  ,@ShowHeader
  ,@GraphTypeID
  ,@ConvertForGraph
  ,@NotToDraw
  ,@ParentDBRows
  ,@DBRowTypeID
  ,@MainDBDataID
  ,@MainDBIconID
  ,@IsDV
  ,@DVTypeID
  ,@DVDescription
  ,@DVDBIconID
  ,@DVDBDataID
  ,@IsDVUpdatable
  ,@IsDVRemarks
  ,@DVRemarksText
  ,@DVRemarksDBIconID
  ,@IsDVForward
  ,@DVForwardText
  ,@DVFDBIconID
  ,@DVForwardDBDataID
  ,@IsDVReverse
  ,@DVReverseText
  ,@DVRDBIconID
  ,@DVReverseDBDataID
  ,@IsDVAttachment
  ,@IsDVAttachmentMulti
  ,@DVAttachmentText
  ,@DVAttachmentDBIconID
  ,@DVFAlert
  ,@DVFAlertEMail
  ,@DVFASubject
  ,@DVFABodyTemplate
  ,@DVFEMailDBDataID
  ,@DVFAlertSMS
  ,@DVFASMSText
  ,@DVFSMSDBDataID
  ,@DVRAlert
  ,@DVRAlertEMail
  ,@DVRASubject
  ,@DVRABodyTemplate
  ,@DVREMailDBDataID
  ,@DVRAlertSMS
  ,@DVRASMSText
  ,@DVRSMSDBDataID
  ,@ReminderOnCount
  ,@ReminderCountThreshold
  ,@ReminderCountDBDataID
  ,@ReminderOnAvg
  ,@ReminderLapsDaysAvg
  ,@ReminderAvgDBDataID
  ,@ReminderOnMax
  ,@ReminderLapsDaysMax
  ,@ReminderMaxDBDataID
  ,@ReminderFrequencyDays
  ,@ReminderAlertEMail
  ,@ReminderEMailDBDataID
  ,@ReminderASubject
  ,@ReminderABodyTemplate
  ,@ReminderAlertSMS
  ,@ReminderSMSDBDataID
  ,@ReminderASMSText
  ,@IsLeft
  ,@AppNameLeft
  ,@TotSqlIDLeft
  ,@RedSqlIDLeft
  ,@AmbSqlIDLeft
  ,@GreSqlIDLeft
  ,@HaveNewLeft
  ,@HaveRemLeft
  ,@IsRight
  ,@AppNameRight
  ,@TotSqlIDRight
  ,@RedSqlIDRight
  ,@AmbSqlIDRight
  ,@GreSqlIDRight
  ,@HaveNewRight
  ,@HaveRemRight
  )
  SET @Return_DashboardID = @DashboardID
  SET @Return_DBRows = Scope_Identity()
GO
