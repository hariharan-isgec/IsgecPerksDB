USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRM_Promotions](
	[PromotionID] [int] IDENTITY(1,1) NOT NULL,
	[CardNo] [nvarchar](8) NOT NULL,
	[PromotionOn] [datetime] NULL,
	[DesignationID] [int] NOT NULL,
	[Remarks] [nvarchar](250) NOT NULL,
	[Executed] [bit] NOT NULL,
	[Cancelled] [bit] NOT NULL,
	[ProcessedBy] [nvarchar](8) NULL,
	[ProcessedOn] [datetime] NULL,
 CONSTRAINT [PK_HRM_Promotions] PRIMARY KEY CLUSTERED 
(
	[PromotionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HRM_Promotions]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Promotions_HRM_Designations] FOREIGN KEY([DesignationID])
REFERENCES [dbo].[HRM_Designations] ([DesignationID])
GO
ALTER TABLE [dbo].[HRM_Promotions] CHECK CONSTRAINT [FK_HRM_Promotions_HRM_Designations]
GO
ALTER TABLE [dbo].[HRM_Promotions]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Promotions_HRM_Employees] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[HRM_Promotions] CHECK CONSTRAINT [FK_HRM_Promotions_HRM_Employees]
GO
ALTER TABLE [dbo].[HRM_Promotions]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Promotions_HRM_Employees1] FOREIGN KEY([ProcessedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[HRM_Promotions] CHECK CONSTRAINT [FK_HRM_Promotions_HRM_Employees1]
GO
ALTER TABLE [dbo].[HRM_Promotions] ADD  CONSTRAINT [DF_HRM_Promotions_Remarks]  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[HRM_Promotions] ADD  CONSTRAINT [DF_HRM_Promotions_Executed]  DEFAULT ((0)) FOR [Executed]
GO
ALTER TABLE [dbo].[HRM_Promotions] ADD  CONSTRAINT [DF_HRM_Promotions_Cancelled]  DEFAULT ((0)) FOR [Cancelled]
GO
