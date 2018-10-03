USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATN_PunchConfigDetails](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[ConfigID] [int] NOT NULL,
	[FPStartTime] [decimal](6, 2) NULL,
	[FPEndTime] [decimal](6, 2) NULL,
	[UseDefined] [bit] NOT NULL,
	[DefinedTime] [decimal](6, 2) NULL,
	[SPStartTime] [decimal](6, 2) NULL,
	[SPEndTime] [decimal](6, 2) NULL,
	[CalculateHours] [bit] NOT NULL,
	[HoursStatus] [nvarchar](2) NULL,
	[HoursValue] [decimal](6, 2) NULL,
	[LimitedAllowed] [bit] NOT NULL,
	[LimitCount] [int] NULL,
	[LimitPunchStatus] [nvarchar](2) NULL,
	[NormalPunchStatus] [nvarchar](2) NULL,
	[LimitedLeaveTypes] [nvarchar](100) NULL,
	[NormalLeaveTypes] [nvarchar](100) NULL,
	[ExceptionRule] [bit] NOT NULL,
	[ConfigStatus] [nvarchar](2) NULL,
 CONSTRAINT [PK_ATN_PunchConfigDetails] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ATN_PunchConfigDetails]  WITH CHECK ADD  CONSTRAINT [FK_ATN_PunchConfigDetails_ATN_PunchConfig] FOREIGN KEY([ConfigID])
REFERENCES [dbo].[ATN_PunchConfig] ([RecordID])
GO
ALTER TABLE [dbo].[ATN_PunchConfigDetails] CHECK CONSTRAINT [FK_ATN_PunchConfigDetails_ATN_PunchConfig]
GO
ALTER TABLE [dbo].[ATN_PunchConfigDetails] ADD  CONSTRAINT [DF_ATN_PunchConfigDetails_UseDefined]  DEFAULT ((0)) FOR [UseDefined]
GO
ALTER TABLE [dbo].[ATN_PunchConfigDetails] ADD  CONSTRAINT [DF_ATN_PunchConfigDetails_CalculateHours]  DEFAULT ((0)) FOR [CalculateHours]
GO
ALTER TABLE [dbo].[ATN_PunchConfigDetails] ADD  CONSTRAINT [DF_ATN_PunchConfigDetails_LimitedAllowed]  DEFAULT ((0)) FOR [LimitedAllowed]
GO
ALTER TABLE [dbo].[ATN_PunchConfigDetails] ADD  CONSTRAINT [DF_ATN_PunchConfigDetails_ExceptionRule_1]  DEFAULT ((0)) FOR [ExceptionRule]
GO
