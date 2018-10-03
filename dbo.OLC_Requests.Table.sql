USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OLC_Requests](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[CardNo] [nvarchar](8) NOT NULL,
	[Remarks] [nvarchar](500) NULL,
	[RequestedBy] [nvarchar](8) NULL,
	[RequestedOn] [datetime] NULL,
	[Configured] [bit] NOT NULL,
	[OLCPassword] [nvarchar](50) NULL,
	[NetworkIP] [nvarchar](40) NULL,
	[ConfiguredBy] [nvarchar](8) NULL,
	[ConfiguredOn] [datetime] NULL,
	[ConfigurationRemarks] [nvarchar](500) NULL,
	[RemoveAccess] [bit] NOT NULL,
	[RemoveRequestedBy] [nvarchar](8) NULL,
	[RemoveRequestedOn] [datetime] NULL,
	[RemoveRemarks] [nvarchar](500) NULL,
	[Removed] [bit] NOT NULL,
	[RemovedBy] [nvarchar](8) NULL,
	[RemovedOn] [datetime] NULL,
	[RemovedRemarks] [nvarchar](500) NULL,
 CONSTRAINT [PK_OLC_Requests] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OLC_Requests]  WITH CHECK ADD  CONSTRAINT [FK_OLC_CardNo] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[OLC_Requests] CHECK CONSTRAINT [FK_OLC_CardNo]
GO
ALTER TABLE [dbo].[OLC_Requests]  WITH CHECK ADD  CONSTRAINT [FK_OLC_ConfiguredBy] FOREIGN KEY([ConfiguredBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[OLC_Requests] CHECK CONSTRAINT [FK_OLC_ConfiguredBy]
GO
ALTER TABLE [dbo].[OLC_Requests]  WITH CHECK ADD  CONSTRAINT [FK_OLC_RemovedBy] FOREIGN KEY([RemovedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[OLC_Requests] CHECK CONSTRAINT [FK_OLC_RemovedBy]
GO
ALTER TABLE [dbo].[OLC_Requests]  WITH CHECK ADD  CONSTRAINT [FK_OLC_RemoveRequestedBy] FOREIGN KEY([RemoveRequestedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[OLC_Requests] CHECK CONSTRAINT [FK_OLC_RemoveRequestedBy]
GO
ALTER TABLE [dbo].[OLC_Requests]  WITH CHECK ADD  CONSTRAINT [FK_OLC_RequestedBy] FOREIGN KEY([RequestedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[OLC_Requests] CHECK CONSTRAINT [FK_OLC_RequestedBy]
GO
ALTER TABLE [dbo].[OLC_Requests] ADD  CONSTRAINT [DF_OLC_Requests_Configured]  DEFAULT ((0)) FOR [Configured]
GO
ALTER TABLE [dbo].[OLC_Requests] ADD  CONSTRAINT [DF_OLC_Requests_RemoveAccess]  DEFAULT ((0)) FOR [RemoveAccess]
GO
ALTER TABLE [dbo].[OLC_Requests] ADD  CONSTRAINT [DF_OLC_Requests_Removed]  DEFAULT ((0)) FOR [Removed]
GO
