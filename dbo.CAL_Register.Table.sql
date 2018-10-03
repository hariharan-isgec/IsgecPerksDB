USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAL_Register](
	[CallID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](8) NULL,
	[CallTypeID] [int] NULL,
	[CallDescription] [nvarchar](500) NULL,
	[LoggedOn] [datetime] NULL,
	[Priority] [nvarchar](1) NULL,
	[ResponseTime] [decimal](6, 2) NULL,
	[AttenderID] [nvarchar](8) NULL,
	[AssignedOn] [datetime] NULL,
	[AttendedOn] [datetime] NULL,
	[AttenderDescription] [nvarchar](500) NULL,
	[CallStatusID] [int] NULL,
	[ClosedOn] [datetime] NULL,
	[SignedOffOn] [datetime] NULL,
	[FileAttached] [nvarchar](250) NULL,
	[FileExtention] [nvarchar](10) NULL,
 CONSTRAINT [PK_CAL_Register] PRIMARY KEY CLUSTERED 
(
	[CallID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CAL_Register]  WITH CHECK ADD  CONSTRAINT [FK_CAL_Register_CAL_CallTypes] FOREIGN KEY([CallTypeID])
REFERENCES [dbo].[CAL_CallTypes] ([CallTypeID])
GO
ALTER TABLE [dbo].[CAL_Register] CHECK CONSTRAINT [FK_CAL_Register_CAL_CallTypes]
GO
ALTER TABLE [dbo].[CAL_Register]  WITH CHECK ADD  CONSTRAINT [FK_CAL_Register_CAL_CalStatus] FOREIGN KEY([CallStatusID])
REFERENCES [dbo].[CAL_Status] ([CallStatusID])
GO
ALTER TABLE [dbo].[CAL_Register] CHECK CONSTRAINT [FK_CAL_Register_CAL_CalStatus]
GO
ALTER TABLE [dbo].[CAL_Register]  WITH CHECK ADD  CONSTRAINT [FK_CAL_Register_CAL_Priority] FOREIGN KEY([Priority])
REFERENCES [dbo].[CAL_Priority] ([Priority])
GO
ALTER TABLE [dbo].[CAL_Register] CHECK CONSTRAINT [FK_CAL_Register_CAL_Priority]
GO
ALTER TABLE [dbo].[CAL_Register] ADD  CONSTRAINT [DF_CAL_Register_FileAttached]  DEFAULT ((0)) FOR [FileAttached]
GO
