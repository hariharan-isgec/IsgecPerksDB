USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRM_Resignations](
	[ResignID] [int] IDENTITY(1,1) NOT NULL,
	[CardNo] [nvarchar](8) NOT NULL,
	[ResignedOn] [datetime] NULL,
	[ReleavedOn] [datetime] NULL,
	[StatusID] [nvarchar](2) NOT NULL,
	[Remarks] [nvarchar](250) NOT NULL,
	[Executed] [bit] NOT NULL,
	[Cancelled] [bit] NOT NULL,
	[ProcessedBy] [nvarchar](8) NULL,
	[ProcessedOn] [datetime] NULL,
 CONSTRAINT [PK_HRM_Resignations] PRIMARY KEY CLUSTERED 
(
	[ResignID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HRM_Resignations]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Resignations_HRM_Employees] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[HRM_Resignations] CHECK CONSTRAINT [FK_HRM_Resignations_HRM_Employees]
GO
ALTER TABLE [dbo].[HRM_Resignations]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Resignations_HRM_Employees1] FOREIGN KEY([ProcessedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[HRM_Resignations] CHECK CONSTRAINT [FK_HRM_Resignations_HRM_Employees1]
GO
ALTER TABLE [dbo].[HRM_Resignations]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Resignations_HRM_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[HRM_Status] ([StatusID])
GO
ALTER TABLE [dbo].[HRM_Resignations] CHECK CONSTRAINT [FK_HRM_Resignations_HRM_Status]
GO
ALTER TABLE [dbo].[HRM_Resignations] ADD  CONSTRAINT [DF_HRM_Resignations_Remarks]  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[HRM_Resignations] ADD  CONSTRAINT [DF_HRM_Resignations_Executed]  DEFAULT ((0)) FOR [Executed]
GO
ALTER TABLE [dbo].[HRM_Resignations] ADD  CONSTRAINT [DF_HRM_Resignations_Cancelled]  DEFAULT ((0)) FOR [Cancelled]
GO
