USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TOS_Projects](
	[ProjectID] [nvarchar](6) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[RootTaskID] [int] NULL,
	[Active] [bit] NOT NULL,
	[engEnabled] [bit] NOT NULL,
	[engTitle] [nvarchar](50) NULL,
	[ordEnabled] [bit] NOT NULL,
	[ordTitle] [nvarchar](50) NULL,
	[desEnabled] [bit] NOT NULL,
	[desTitle] [nvarchar](50) NULL,
	[ereEnabled] [bit] NOT NULL,
	[ereTitle] [nvarchar](50) NULL,
	[ioEnabled] [bit] NOT NULL,
	[ioTitle] [nvarchar](50) NULL,
	[recEnabled] [bit] NOT NULL,
	[recTitle] [nvarchar](50) NULL,
	[ad1Enabled] [bit] NOT NULL,
	[ad1Title] [nvarchar](50) NULL,
	[ad2Enabled] [bit] NOT NULL,
	[ad2Title] [nvarchar](50) NULL,
	[ad3Enabled] [bit] NOT NULL,
	[ad3Title] [nvarchar](50) NULL,
	[ad4Enabled] [bit] NOT NULL,
	[ad4Title] [nvarchar](50) NULL,
 CONSTRAINT [PK_TOS_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TOS_Projects]  WITH NOCHECK ADD  CONSTRAINT [FK_TOS_Projects_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[TOS_Projects] NOCHECK CONSTRAINT [FK_TOS_Projects_ProjectID]
GO
ALTER TABLE [dbo].[TOS_Projects] ADD  CONSTRAINT [DF_TOS_Projects_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[TOS_Projects] ADD  CONSTRAINT [DF_TOS_Projects_engEnabled_1]  DEFAULT ((1)) FOR [engEnabled]
GO
ALTER TABLE [dbo].[TOS_Projects] ADD  CONSTRAINT [DF_TOS_Projects_ordEnabled_1]  DEFAULT ((1)) FOR [ordEnabled]
GO
ALTER TABLE [dbo].[TOS_Projects] ADD  CONSTRAINT [DF_TOS_Projects_desEnabled_1]  DEFAULT ((1)) FOR [desEnabled]
GO
ALTER TABLE [dbo].[TOS_Projects] ADD  CONSTRAINT [DF_TOS_Projects_ereEnabled_1]  DEFAULT ((1)) FOR [ereEnabled]
GO
ALTER TABLE [dbo].[TOS_Projects] ADD  CONSTRAINT [DF_TOS_Projects_ioEnabled]  DEFAULT ((0)) FOR [ioEnabled]
GO
ALTER TABLE [dbo].[TOS_Projects] ADD  CONSTRAINT [DF_TOS_Projects_recEnabled]  DEFAULT ((0)) FOR [recEnabled]
GO
ALTER TABLE [dbo].[TOS_Projects] ADD  CONSTRAINT [DF_TOS_Projects_ad1Enabled]  DEFAULT ((0)) FOR [ad1Enabled]
GO
ALTER TABLE [dbo].[TOS_Projects] ADD  CONSTRAINT [DF_TOS_Projects_ad1Enabled1]  DEFAULT ((0)) FOR [ad2Enabled]
GO
ALTER TABLE [dbo].[TOS_Projects] ADD  CONSTRAINT [DF_TOS_Projects_ad1Enabled2]  DEFAULT ((0)) FOR [ad3Enabled]
GO
ALTER TABLE [dbo].[TOS_Projects] ADD  CONSTRAINT [DF_TOS_Projects_ad1Enabled3]  DEFAULT ((0)) FOR [ad4Enabled]
GO
