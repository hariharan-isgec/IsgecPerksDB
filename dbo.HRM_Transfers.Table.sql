USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRM_Transfers](
	[TransferID] [int] IDENTITY(1,1) NOT NULL,
	[CardNo] [nvarchar](8) NOT NULL,
	[TransferedOn] [datetime] NULL,
	[CompanyID] [nvarchar](6) NOT NULL,
	[DivisionID] [nvarchar](6) NOT NULL,
	[OfficeID] [int] NOT NULL,
	[DepartmentID] [nvarchar](6) NOT NULL,
	[ProjectSiteID] [nvarchar](6) NOT NULL,
	[ActiveState] [bit] NOT NULL,
	[Remarks] [nvarchar](250) NOT NULL,
	[Executed] [bit] NOT NULL,
	[Cancelled] [bit] NOT NULL,
	[ProcessedBy] [nvarchar](8) NULL,
	[ProcessedOn] [datetime] NULL,
	[CreateEvent] [bit] NOT NULL,
	[VerifiedBy] [nvarchar](8) NULL,
	[VerifiedOn] [datetime] NULL,
 CONSTRAINT [PK_HRM_Transfers] PRIMARY KEY CLUSTERED 
(
	[TransferID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HRM_Transfers]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Transfers_HRM_Companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[HRM_Companies] ([CompanyID])
GO
ALTER TABLE [dbo].[HRM_Transfers] CHECK CONSTRAINT [FK_HRM_Transfers_HRM_Companies]
GO
ALTER TABLE [dbo].[HRM_Transfers]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Transfers_HRM_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[HRM_Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[HRM_Transfers] CHECK CONSTRAINT [FK_HRM_Transfers_HRM_Departments]
GO
ALTER TABLE [dbo].[HRM_Transfers]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Transfers_HRM_Divisions] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[HRM_Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[HRM_Transfers] CHECK CONSTRAINT [FK_HRM_Transfers_HRM_Divisions]
GO
ALTER TABLE [dbo].[HRM_Transfers]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Transfers_HRM_Employees] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[HRM_Transfers] CHECK CONSTRAINT [FK_HRM_Transfers_HRM_Employees]
GO
ALTER TABLE [dbo].[HRM_Transfers]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Transfers_HRM_Employees1] FOREIGN KEY([ProcessedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[HRM_Transfers] CHECK CONSTRAINT [FK_HRM_Transfers_HRM_Employees1]
GO
ALTER TABLE [dbo].[HRM_Transfers]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Transfers_HRM_Offices] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[HRM_Offices] ([OfficeID])
GO
ALTER TABLE [dbo].[HRM_Transfers] CHECK CONSTRAINT [FK_HRM_Transfers_HRM_Offices]
GO
ALTER TABLE [dbo].[HRM_Transfers] ADD  CONSTRAINT [DF_HRM_Transfers_Remarks]  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[HRM_Transfers] ADD  CONSTRAINT [DF_HRM_Transfers_Executed]  DEFAULT ((0)) FOR [Executed]
GO
ALTER TABLE [dbo].[HRM_Transfers] ADD  CONSTRAINT [DF_HRM_Transfers_Cancelled]  DEFAULT ((0)) FOR [Cancelled]
GO
ALTER TABLE [dbo].[HRM_Transfers] ADD  CONSTRAINT [DF_HRM_Transfers_CreateEvent]  DEFAULT ((1)) FOR [CreateEvent]
GO
