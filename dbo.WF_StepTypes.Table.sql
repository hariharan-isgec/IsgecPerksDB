USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WF_StepTypes](
	[StepTypeID] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_WF_StepTypes] PRIMARY KEY CLUSTERED 
(
	[StepTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WF_StepTypes] ADD  CONSTRAINT [DF_WF_StepTypes_MailAlert]  DEFAULT ((0)) FOR [MailAlert]
GO
ALTER TABLE [dbo].[WF_StepTypes] ADD  CONSTRAINT [DF_WF_StepTypes_SMS]  DEFAULT ((0)) FOR [SMS]
GO
ALTER TABLE [dbo].[WF_StepTypes] ADD  CONSTRAINT [DF_WF_StepTypes_Approval]  DEFAULT ((0)) FOR [Approval]
GO
ALTER TABLE [dbo].[WF_StepTypes] ADD  CONSTRAINT [DF_WF_StepTypes_Approval1]  DEFAULT ((0)) FOR [Information]
GO
ALTER TABLE [dbo].[WF_StepTypes] ADD  CONSTRAINT [DF_Table_1_Approval1]  DEFAULT ((0)) FOR [Reject]
GO
ALTER TABLE [dbo].[WF_StepTypes] ADD  CONSTRAINT [DF_Table_1_Approval1_1]  DEFAULT ((0)) FOR [First]
GO
ALTER TABLE [dbo].[WF_StepTypes] ADD  CONSTRAINT [DF_Table_1_Approval1_2]  DEFAULT ((0)) FOR [Mid]
GO
ALTER TABLE [dbo].[WF_StepTypes] ADD  CONSTRAINT [DF_Table_1_Approval1_3]  DEFAULT ((0)) FOR [Last]
GO
ALTER TABLE [dbo].[WF_StepTypes] ADD  CONSTRAINT [DF_Table_1_Approval1_4]  DEFAULT ((0)) FOR [Root]
GO
ALTER TABLE [dbo].[WF_StepTypes] ADD  CONSTRAINT [DF_Table_1_Approval1_5]  DEFAULT ((0)) FOR [Terminal]
GO
ALTER TABLE [dbo].[WF_StepTypes] ADD  CONSTRAINT [DF_WF_StepTypes_Approval1_1]  DEFAULT ((0)) FOR [Hold]
GO
ALTER TABLE [dbo].[WF_StepTypes] ADD  CONSTRAINT [DF_WF_StepTypes_Approval1_2]  DEFAULT ((0)) FOR [Unhold]
GO
