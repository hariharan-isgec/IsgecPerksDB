USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADM_Complaints](
	[CallID] [int] IDENTITY(1,1) NOT NULL,
	[EndUserID] [nvarchar](8) NULL,
	[CallTypeID] [nvarchar](20) NULL,
	[Description] [nvarchar](2500) NULL,
	[AssignedTo] [nvarchar](8) NULL,
	[CallStatusID] [nvarchar](20) NULL,
	[LoggedOn] [datetime] NULL,
	[LoggedBy] [nvarchar](8) NULL,
	[FirstAttendedOn] [datetime] NULL,
	[ClosedOn] [datetime] NULL,
	[FirstAttended] [bit] NOT NULL,
	[Closed] [bit] NOT NULL,
 CONSTRAINT [PK_ADM_Complaints] PRIMARY KEY CLUSTERED 
(
	[CallID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADM_Complaints]  WITH CHECK ADD  CONSTRAINT [FK_ADM_Complaints_ADM_CallStatus] FOREIGN KEY([CallStatusID])
REFERENCES [dbo].[ADM_CallStatus] ([CallStatusID])
GO
ALTER TABLE [dbo].[ADM_Complaints] CHECK CONSTRAINT [FK_ADM_Complaints_ADM_CallStatus]
GO
ALTER TABLE [dbo].[ADM_Complaints]  WITH CHECK ADD  CONSTRAINT [FK_ADM_Complaints_ADM_CallTypes] FOREIGN KEY([CallTypeID])
REFERENCES [dbo].[ADM_CallTypes] ([CallTypeID])
GO
ALTER TABLE [dbo].[ADM_Complaints] CHECK CONSTRAINT [FK_ADM_Complaints_ADM_CallTypes]
GO
ALTER TABLE [dbo].[ADM_Complaints]  WITH CHECK ADD  CONSTRAINT [FK_ADM_Complaints_HRM_Employees] FOREIGN KEY([EndUserID])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ADM_Complaints] CHECK CONSTRAINT [FK_ADM_Complaints_HRM_Employees]
GO
ALTER TABLE [dbo].[ADM_Complaints] ADD  CONSTRAINT [DF_ADM_Complaints_FirstAttended]  DEFAULT ((0)) FOR [FirstAttended]
GO
ALTER TABLE [dbo].[ADM_Complaints] ADD  CONSTRAINT [DF_ADM_Complaints_Closed]  DEFAULT ((0)) FOR [Closed]
GO
