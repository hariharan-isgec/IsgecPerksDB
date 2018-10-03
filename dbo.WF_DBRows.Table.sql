USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WF_DBRows](
	[DashboardID] [int] NOT NULL,
	[DBRows] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[MainDBDataID] [int] NULL,
	[MainDBIconID] [int] NULL,
	[ParentDBRows] [int] NULL,
	[cssRow] [nvarchar](50) NULL,
	[Sequence] [int] NOT NULL,
	[ShowHeader] [bit] NOT NULL,
	[DBRowTypeID] [int] NULL,
	[ConvertForGraph] [bit] NOT NULL,
	[NotToDraw] [bit] NOT NULL,
	[GraphTypeID] [int] NULL,
	[DBTitle] [nvarchar](100) NULL,
	[TitleStyle] [nvarchar](250) NULL,
	[AddNewURL] [nvarchar](500) NULL,
	[IsDV] [bit] NOT NULL,
	[IsDVURL] [bit] NOT NULL,
	[DVURL] [nvarchar](500) NULL,
	[DVTypeID] [int] NULL,
	[DVDescription] [nvarchar](100) NULL,
	[DVDBIconID] [int] NULL,
	[DVDBDataID] [int] NULL,
	[DVLaunchURL] [nvarchar](500) NULL,
	[IsDVUpdatable] [bit] NOT NULL,
	[IsDVRemarks] [bit] NOT NULL,
	[DVRemarksText] [nvarchar](50) NULL,
	[DVRemarksDBIconID] [int] NULL,
	[IsDVForward] [bit] NOT NULL,
	[DVForwardText] [nvarchar](50) NULL,
	[DVFDBIconID] [int] NULL,
	[DVForwardDBDataID] [int] NULL,
	[IsDVReverse] [bit] NOT NULL,
	[DVReverseText] [nvarchar](50) NULL,
	[DVRDBIconID] [int] NULL,
	[DVReverseDBDataID] [int] NULL,
	[IsDVAttachment] [bit] NOT NULL,
	[IsDVAttachmentMulti] [bit] NOT NULL,
	[DVAttachmentText] [nvarchar](50) NULL,
	[DVAttachmentDBIconID] [int] NULL,
	[DVFAlert] [bit] NOT NULL,
	[DVFAlertEMail] [bit] NOT NULL,
	[DVFEMailDBDataID] [int] NULL,
	[DVFASubject] [nvarchar](100) NULL,
	[DVFABodyTemplate] [nvarchar](100) NULL,
	[DVFAlertSMS] [bit] NOT NULL,
	[DVFSMSDBDataID] [int] NULL,
	[DVFASMSText] [nvarchar](500) NULL,
	[DVRAlert] [bit] NOT NULL,
	[DVRAlertEMail] [bit] NOT NULL,
	[DVREMailDBDataID] [int] NULL,
	[DVRASubject] [nvarchar](100) NULL,
	[DVRABodyTemplate] [nvarchar](100) NULL,
	[DVRAlertSMS] [bit] NOT NULL,
	[DVRSMSDBDataID] [int] NULL,
	[DVRASMSText] [nvarchar](500) NULL,
	[ReminderOnCount] [bit] NOT NULL,
	[ReminderCountThreshold] [int] NOT NULL,
	[ReminderCountDBDataID] [int] NULL,
	[ReminderOnAvg] [bit] NOT NULL,
	[ReminderLapsDaysAvg] [int] NOT NULL,
	[ReminderAvgDBDataID] [int] NULL,
	[ReminderOnMax] [bit] NOT NULL,
	[ReminderLapsDaysMax] [int] NOT NULL,
	[ReminderMaxDBDataID] [int] NULL,
	[ReminderFrequencyDays] [int] NOT NULL,
	[ReminderAlertEMail] [bit] NOT NULL,
	[ReminderEMailDBDataID] [int] NULL,
	[ReminderASubject] [nvarchar](100) NULL,
	[ReminderABodyTemplate] [nvarchar](100) NULL,
	[ReminderAlertSMS] [bit] NOT NULL,
	[ReminderSMSDBDataID] [int] NULL,
	[ReminderASMSText] [nvarchar](500) NULL,
	[IsLeft] [bit] NOT NULL,
	[AppNameLeft] [nvarchar](100) NULL,
	[TotSqlIDLeft] [int] NULL,
	[RedSqlIDLeft] [int] NULL,
	[AmbSqlIDLeft] [int] NULL,
	[GreSqlIDLeft] [int] NULL,
	[HaveNewLeft] [bit] NOT NULL,
	[HaveRemLeft] [bit] NOT NULL,
	[IsRight] [bit] NOT NULL,
	[AppNameRight] [nvarchar](100) NULL,
	[TotSqlIDRight] [int] NULL,
	[RedSqlIDRight] [int] NULL,
	[AmbSqlIDRight] [int] NULL,
	[GreSqlIDRight] [int] NULL,
	[HaveNewRight] [bit] NOT NULL,
	[HaveRemRight] [bit] NOT NULL,
 CONSTRAINT [PK_WF_DBRows] PRIMARY KEY CLUSTERED 
(
	[DashboardID] ASC,
	[DBRows] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_AmbSqlIDLeft] FOREIGN KEY([AmbSqlIDLeft])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_AmbSqlIDLeft]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_AmbSqlIDRight] FOREIGN KEY([AmbSqlIDRight])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_AmbSqlIDRight]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_DVAttachmentDBIconID] FOREIGN KEY([DVAttachmentDBIconID])
REFERENCES [dbo].[WF_DBIcons] ([DBIconID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_DVAttachmentDBIconID]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_DVDBDataID] FOREIGN KEY([DVDBDataID])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_DVDBDataID]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_DVDBIconID] FOREIGN KEY([DVDBIconID])
REFERENCES [dbo].[WF_DBIcons] ([DBIconID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_DVDBIconID]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_DVFDBIconID] FOREIGN KEY([DVFDBIconID])
REFERENCES [dbo].[WF_DBIcons] ([DBIconID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_DVFDBIconID]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_DVFEMailDBDataID] FOREIGN KEY([DVFEMailDBDataID])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_DVFEMailDBDataID]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_DVForwardDBDataID] FOREIGN KEY([DVForwardDBDataID])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_DVForwardDBDataID]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_DVFSMSDBDataID] FOREIGN KEY([DVFSMSDBDataID])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_DVFSMSDBDataID]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_DVRDBIconID] FOREIGN KEY([DVRDBIconID])
REFERENCES [dbo].[WF_DBIcons] ([DBIconID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_DVRDBIconID]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_DVREMailDBDataID] FOREIGN KEY([DVREMailDBDataID])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_DVREMailDBDataID]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_DVRemarksDBIconID] FOREIGN KEY([DVRemarksDBIconID])
REFERENCES [dbo].[WF_DBIcons] ([DBIconID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_DVRemarksDBIconID]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_DVReverseDBDataID] FOREIGN KEY([DVReverseDBDataID])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_DVReverseDBDataID]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_DVRSMSDBDataID] FOREIGN KEY([DVRSMSDBDataID])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_DVRSMSDBDataID]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_GreSqlIDLeft] FOREIGN KEY([GreSqlIDLeft])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_GreSqlIDLeft]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_GreSqlIDRight] FOREIGN KEY([GreSqlIDRight])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_GreSqlIDRight]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_MainDBIconID] FOREIGN KEY([MainDBIconID])
REFERENCES [dbo].[WF_DBIcons] ([DBIconID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_MainDBIconID]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_MainDBID] FOREIGN KEY([MainDBDataID])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_MainDBID]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_ParentDBRows] FOREIGN KEY([DashboardID], [ParentDBRows])
REFERENCES [dbo].[WF_DBRows] ([DashboardID], [DBRows])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_ParentDBRows]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_RedSqlIDLeft] FOREIGN KEY([RedSqlIDLeft])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_RedSqlIDLeft]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_RedSqlIDRight] FOREIGN KEY([RedSqlIDRight])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_RedSqlIDRight]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_ReminderAVGDBDataID] FOREIGN KEY([ReminderAvgDBDataID])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_ReminderAVGDBDataID]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_ReminderCountDBDataID] FOREIGN KEY([ReminderCountDBDataID])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_ReminderCountDBDataID]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_ReminderEMailDBDataID] FOREIGN KEY([ReminderEMailDBDataID])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_ReminderEMailDBDataID]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_ReminderMaxDBDataID] FOREIGN KEY([ReminderMaxDBDataID])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_ReminderMaxDBDataID]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_ReminderSMSDBDataID] FOREIGN KEY([ReminderSMSDBDataID])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_ReminderSMSDBDataID]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_TotSqlIDLeft] FOREIGN KEY([TotSqlIDLeft])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_TotSqlIDLeft]
GO
ALTER TABLE [dbo].[WF_DBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRows_TotSqlIDRight] FOREIGN KEY([TotSqlIDRight])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_DBRows] CHECK CONSTRAINT [FK_WF_DBRows_TotSqlIDRight]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_Sequence]  DEFAULT ((0)) FOR [Sequence]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_ShowHeader]  DEFAULT ((1)) FOR [ShowHeader]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_ConvertForGraph]  DEFAULT ((0)) FOR [ConvertForGraph]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_NotToDraw]  DEFAULT ((0)) FOR [NotToDraw]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_IsDV1]  DEFAULT ((0)) FOR [IsDV]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_HaveDetailView]  DEFAULT ((0)) FOR [IsDVURL]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_IsDVUpdatable]  DEFAULT ((0)) FOR [IsDVUpdatable]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_IsRemarks]  DEFAULT ((0)) FOR [IsDVRemarks]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_IsDVUForward]  DEFAULT ((0)) FOR [IsDVForward]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_IsDVUReverse]  DEFAULT ((0)) FOR [IsDVReverse]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_IsDVUReverse1]  DEFAULT ((0)) FOR [IsDVAttachment]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_IsDVUAttachment1]  DEFAULT ((0)) FOR [IsDVAttachmentMulti]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_DUVFAlert]  DEFAULT ((0)) FOR [DVFAlert]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_DUVFAlertEMail]  DEFAULT ((0)) FOR [DVFAlertEMail]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_DUVFAlertEMail1]  DEFAULT ((0)) FOR [DVFAlertSMS]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_DVUFAlert1]  DEFAULT ((0)) FOR [DVRAlert]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_DVUFAlertEMail1]  DEFAULT ((0)) FOR [DVRAlertEMail]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_DUVFAlertSMS1]  DEFAULT ((0)) FOR [DVRAlertSMS]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_ReminderOnCount]  DEFAULT ((0)) FOR [ReminderOnCount]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_CountThreshold]  DEFAULT ((0)) FOR [ReminderCountThreshold]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_ReminderOnAvg]  DEFAULT ((0)) FOR [ReminderOnAvg]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_LapsDaysAvg]  DEFAULT ((0)) FOR [ReminderLapsDaysAvg]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_ReminderOnMax]  DEFAULT ((0)) FOR [ReminderOnMax]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_LapsDaysMax]  DEFAULT ((0)) FOR [ReminderLapsDaysMax]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_ReminderDays]  DEFAULT ((0)) FOR [ReminderFrequencyDays]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_DVFAlertEMail1]  DEFAULT ((0)) FOR [ReminderAlertEMail]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_DVFAlertSMS1]  DEFAULT ((0)) FOR [ReminderAlertSMS]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_IsLeft]  DEFAULT ((0)) FOR [IsLeft]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_HaveNewLeft]  DEFAULT ((0)) FOR [HaveNewLeft]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_HaveRemLeft]  DEFAULT ((0)) FOR [HaveRemLeft]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_IsRight]  DEFAULT ((0)) FOR [IsRight]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_HaveNewRight]  DEFAULT ((0)) FOR [HaveNewRight]
GO
ALTER TABLE [dbo].[WF_DBRows] ADD  CONSTRAINT [DF_WF_DBRows_HaveRemRight]  DEFAULT ((0)) FOR [HaveRemRight]
GO
