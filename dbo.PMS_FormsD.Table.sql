USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PMS_FormsD](
	[FinYear] [nvarchar](4) NOT NULL,
	[CardNo] [nvarchar](8) NOT NULL,
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[KRA] [nvarchar](500) NULL,
	[KPI] [nvarchar](1000) NULL,
	[Competancy] [nvarchar](500) NULL,
	[DetailTypeID] [nvarchar](6) NULL,
 CONSTRAINT [PK_PMS_FormsD] PRIMARY KEY CLUSTERED 
(
	[FinYear] ASC,
	[CardNo] ASC,
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PMS_FormsD]  WITH CHECK ADD  CONSTRAINT [FK_PMSFormsD_CardNo] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[PMS_FormsD] CHECK CONSTRAINT [FK_PMSFormsD_CardNo]
GO
ALTER TABLE [dbo].[PMS_FormsD]  WITH CHECK ADD  CONSTRAINT [FK_PMSFormsD_DetailType] FOREIGN KEY([DetailTypeID])
REFERENCES [dbo].[PMS_DetailTypes] ([DetailTypeID])
GO
ALTER TABLE [dbo].[PMS_FormsD] CHECK CONSTRAINT [FK_PMSFormsD_DetailType]
GO
ALTER TABLE [dbo].[PMS_FormsD]  WITH CHECK ADD  CONSTRAINT [FK_PMSFormsD_FinYear] FOREIGN KEY([FinYear])
REFERENCES [dbo].[PMS_FinYear] ([FinYear])
GO
ALTER TABLE [dbo].[PMS_FormsD] CHECK CONSTRAINT [FK_PMSFormsD_FinYear]
GO
ALTER TABLE [dbo].[PMS_FormsD]  WITH CHECK ADD  CONSTRAINT [FK_PMSFormsD_FinYearCardNo] FOREIGN KEY([FinYear], [CardNo])
REFERENCES [dbo].[PMS_FormsH] ([FinYear], [CardNo])
GO
ALTER TABLE [dbo].[PMS_FormsD] CHECK CONSTRAINT [FK_PMSFormsD_FinYearCardNo]
GO
