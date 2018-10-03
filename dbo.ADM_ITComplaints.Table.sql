USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADM_ITComplaints](
	[CallID] [int] IDENTITY(1,1) NOT NULL,
	[EndUserID] [nvarchar](8) NULL,
	[CallTypeID] [nvarchar](20) NULL,
	[CallSubTypeID] [int] NULL,
	[Description] [nvarchar](2500) NULL,
	[AssignedTo] [nvarchar](8) NULL,
	[CallStatusID] [nvarchar](20) NULL,
	[LoggedOn] [datetime] NULL,
	[LoggedBy] [nvarchar](8) NULL,
	[FirstAttendedOn] [datetime] NULL,
	[ClosedOn] [datetime] NULL,
	[FirstAttended] [bit] NOT NULL,
	[Closed] [bit] NOT NULL,
	[CallReceivedOn] [datetime] NULL,
	[CallConverted] [bit] NULL,
	[ConvertedReference] [nvarchar](50) NULL,
	[ConvertedRemarks] [nvarchar](500) NULL,
	[Feedback] [nvarchar](5) NULL,
 CONSTRAINT [PK_ADM_ITComplaints] PRIMARY KEY CLUSTERED 
(
	[CallID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADM_ITComplaints]  WITH CHECK ADD  CONSTRAINT [FK_ADM_ITComplaints_ADM_ITCallStatus] FOREIGN KEY([CallStatusID])
REFERENCES [dbo].[ADM_ITCallStatus] ([CallStatusID])
GO
ALTER TABLE [dbo].[ADM_ITComplaints] CHECK CONSTRAINT [FK_ADM_ITComplaints_ADM_ITCallStatus]
GO
ALTER TABLE [dbo].[ADM_ITComplaints]  WITH CHECK ADD  CONSTRAINT [FK_ADM_ITComplaints_ADM_ITCallTypes] FOREIGN KEY([CallTypeID])
REFERENCES [dbo].[ADM_ITCallTypes] ([CallTypeID])
GO
ALTER TABLE [dbo].[ADM_ITComplaints] CHECK CONSTRAINT [FK_ADM_ITComplaints_ADM_ITCallTypes]
GO
ALTER TABLE [dbo].[ADM_ITComplaints]  WITH CHECK ADD  CONSTRAINT [FK_ADM_ITComplaints_CallSubTypeID] FOREIGN KEY([CallTypeID], [CallSubTypeID])
REFERENCES [dbo].[ADM_ITCallSubTypes] ([CallTypeID], [CallSubTypeID])
GO
ALTER TABLE [dbo].[ADM_ITComplaints] CHECK CONSTRAINT [FK_ADM_ITComplaints_CallSubTypeID]
GO
ALTER TABLE [dbo].[ADM_ITComplaints]  WITH CHECK ADD  CONSTRAINT [FK_ADM_ITComplaints_HRM_Employees] FOREIGN KEY([EndUserID])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ADM_ITComplaints] CHECK CONSTRAINT [FK_ADM_ITComplaints_HRM_Employees]
GO
ALTER TABLE [dbo].[ADM_ITComplaints] ADD  CONSTRAINT [DF_ADM_ITComplaints_FirstAttended]  DEFAULT ((0)) FOR [FirstAttended]
GO
ALTER TABLE [dbo].[ADM_ITComplaints] ADD  CONSTRAINT [DF_ADM_ITComplaints_Closed]  DEFAULT ((0)) FOR [Closed]
GO
ALTER TABLE [dbo].[ADM_ITComplaints] ADD  CONSTRAINT [DF_ADM_ITComplaints_CMDBorProject]  DEFAULT ((0)) FOR [CallConverted]
GO
