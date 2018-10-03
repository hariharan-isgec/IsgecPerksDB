USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WF_Steps](
	[WFID] [int] NOT NULL,
	[StepID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[MailAlert] [bit] NOT NULL,
	[SMS] [bit] NOT NULL,
	[Approval] [bit] NOT NULL,
	[Information] [bit] NOT NULL,
	[Reject] [bit] NOT NULL,
	[First] [bit] NOT NULL,
	[Mid] [bit] NOT NULL,
	[Last] [bit] NOT NULL,
	[Root] [bit] NOT NULL,
	[Terminal] [bit] NOT NULL,
	[Hold] [bit] NOT NULL,
	[Unhold] [bit] NOT NULL,
	[ParentStepID] [int] NULL,
	[NextStepID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WF_Steps] ADD  CONSTRAINT [DF_WF_Steps_MailAlert]  DEFAULT ((0)) FOR [MailAlert]
GO
ALTER TABLE [dbo].[WF_Steps] ADD  CONSTRAINT [DF_WF_Steps_SMS]  DEFAULT ((0)) FOR [SMS]
GO
ALTER TABLE [dbo].[WF_Steps] ADD  CONSTRAINT [DF_WF_Steps_Approval]  DEFAULT ((0)) FOR [Approval]
GO
ALTER TABLE [dbo].[WF_Steps] ADD  CONSTRAINT [DF_WF_Steps_Information]  DEFAULT ((0)) FOR [Information]
GO
ALTER TABLE [dbo].[WF_Steps] ADD  CONSTRAINT [DF_WF_Steps_Reject]  DEFAULT ((0)) FOR [Reject]
GO
ALTER TABLE [dbo].[WF_Steps] ADD  CONSTRAINT [DF_WF_Steps_First]  DEFAULT ((0)) FOR [First]
GO
ALTER TABLE [dbo].[WF_Steps] ADD  CONSTRAINT [DF_WF_Steps_Mid]  DEFAULT ((0)) FOR [Mid]
GO
ALTER TABLE [dbo].[WF_Steps] ADD  CONSTRAINT [DF_WF_Steps_Last]  DEFAULT ((0)) FOR [Last]
GO
ALTER TABLE [dbo].[WF_Steps] ADD  CONSTRAINT [DF_WF_Steps_Root]  DEFAULT ((0)) FOR [Root]
GO
ALTER TABLE [dbo].[WF_Steps] ADD  CONSTRAINT [DF_WF_Steps_Terminal]  DEFAULT ((0)) FOR [Terminal]
GO
ALTER TABLE [dbo].[WF_Steps] ADD  CONSTRAINT [DF_WF_Steps_Hold]  DEFAULT ((0)) FOR [Hold]
GO
ALTER TABLE [dbo].[WF_Steps] ADD  CONSTRAINT [DF_WF_Steps_Unhold]  DEFAULT ((0)) FOR [Unhold]
GO
