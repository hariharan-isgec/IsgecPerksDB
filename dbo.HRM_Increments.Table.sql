USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRM_Increments](
	[IncrementID] [int] IDENTITY(1,1) NOT NULL,
	[CardNo] [nvarchar](8) NOT NULL,
	[IncrementOn] [datetime] NULL,
	[BasicSalary] [decimal](12, 2) NOT NULL,
	[Remarks] [nvarchar](250) NOT NULL,
	[Executed] [bit] NOT NULL,
	[Cancelled] [bit] NOT NULL,
	[ProcessedBy] [nvarchar](8) NULL,
	[ProcessedOn] [datetime] NULL,
 CONSTRAINT [PK_HRM_Increments] PRIMARY KEY CLUSTERED 
(
	[IncrementID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HRM_Increments]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Increments_HRM_Employees] FOREIGN KEY([ProcessedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[HRM_Increments] CHECK CONSTRAINT [FK_HRM_Increments_HRM_Employees]
GO
ALTER TABLE [dbo].[HRM_Increments]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Increments_HRM_Increments] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[HRM_Increments] CHECK CONSTRAINT [FK_HRM_Increments_HRM_Increments]
GO
ALTER TABLE [dbo].[HRM_Increments] ADD  CONSTRAINT [DF_HRM_Increments_BasicSalary]  DEFAULT ((0)) FOR [BasicSalary]
GO
ALTER TABLE [dbo].[HRM_Increments] ADD  CONSTRAINT [DF_HRM_Increments_Remarks]  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[HRM_Increments] ADD  CONSTRAINT [DF_HRM_Increments_Executed]  DEFAULT ((0)) FOR [Executed]
GO
ALTER TABLE [dbo].[HRM_Increments] ADD  CONSTRAINT [DF_HRM_Increments_Cancelled]  DEFAULT ((0)) FOR [Cancelled]
GO
