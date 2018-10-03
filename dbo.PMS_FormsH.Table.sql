USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PMS_FormsH](
	[FinYear] [nvarchar](4) NOT NULL,
	[CardNo] [nvarchar](8) NOT NULL,
	[FormStatusID] [nvarchar](30) NOT NULL,
	[SubmittedOn] [datetime] NULL,
	[ApprovedOn] [datetime] NULL,
	[ApprovedBy] [nvarchar](8) NULL,
	[SubmittedToHROn] [datetime] NULL,
 CONSTRAINT [PK_PMS_FormsH] PRIMARY KEY CLUSTERED 
(
	[FinYear] ASC,
	[CardNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PMS_FormsH]  WITH CHECK ADD  CONSTRAINT [FK_PMSFormsH_ApprovedBy] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[PMS_FormsH] CHECK CONSTRAINT [FK_PMSFormsH_ApprovedBy]
GO
ALTER TABLE [dbo].[PMS_FormsH]  WITH CHECK ADD  CONSTRAINT [FK_PMSFormsH_CardNo] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[PMS_FormsH] CHECK CONSTRAINT [FK_PMSFormsH_CardNo]
GO
ALTER TABLE [dbo].[PMS_FormsH]  WITH CHECK ADD  CONSTRAINT [FK_PMSFormsH_FinYear] FOREIGN KEY([FinYear])
REFERENCES [dbo].[PMS_FinYear] ([FinYear])
GO
ALTER TABLE [dbo].[PMS_FormsH] CHECK CONSTRAINT [FK_PMSFormsH_FinYear]
GO
ALTER TABLE [dbo].[PMS_FormsH]  WITH CHECK ADD  CONSTRAINT [FK_PMSFormsH_FinYearCardNo] FOREIGN KEY([FinYear], [CardNo])
REFERENCES [dbo].[PMS_Approvers] ([FinYear], [CardNo])
GO
ALTER TABLE [dbo].[PMS_FormsH] CHECK CONSTRAINT [FK_PMSFormsH_FinYearCardNo]
GO
ALTER TABLE [dbo].[PMS_FormsH]  WITH CHECK ADD  CONSTRAINT [FK_PMSFormsH_FormStatus] FOREIGN KEY([FormStatusID])
REFERENCES [dbo].[PMS_FormStatus] ([FormStatusID])
GO
ALTER TABLE [dbo].[PMS_FormsH] CHECK CONSTRAINT [FK_PMSFormsH_FormStatus]
GO
