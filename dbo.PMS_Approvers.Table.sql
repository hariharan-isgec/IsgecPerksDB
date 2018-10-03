USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PMS_Approvers](
	[FinYear] [nvarchar](4) NOT NULL,
	[CardNo] [nvarchar](8) NOT NULL,
	[Apparaiser] [nvarchar](8) NULL,
	[ReviewerI] [nvarchar](8) NULL,
	[ReviewerII] [nvarchar](8) NULL,
 CONSTRAINT [PK_PMS_Approvers] PRIMARY KEY CLUSTERED 
(
	[FinYear] ASC,
	[CardNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PMS_Approvers]  WITH CHECK ADD  CONSTRAINT [FK_PMSApprovers_Appraiser] FOREIGN KEY([Apparaiser])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[PMS_Approvers] CHECK CONSTRAINT [FK_PMSApprovers_Appraiser]
GO
ALTER TABLE [dbo].[PMS_Approvers]  WITH CHECK ADD  CONSTRAINT [FK_PMSApprovers_CardNo] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[PMS_Approvers] CHECK CONSTRAINT [FK_PMSApprovers_CardNo]
GO
ALTER TABLE [dbo].[PMS_Approvers]  WITH CHECK ADD  CONSTRAINT [FK_PMSApprovers_FinYear] FOREIGN KEY([FinYear])
REFERENCES [dbo].[PMS_FinYear] ([FinYear])
GO
ALTER TABLE [dbo].[PMS_Approvers] CHECK CONSTRAINT [FK_PMSApprovers_FinYear]
GO
ALTER TABLE [dbo].[PMS_Approvers]  WITH CHECK ADD  CONSTRAINT [FK_PMSApprovers_ReviewerI] FOREIGN KEY([ReviewerI])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[PMS_Approvers] CHECK CONSTRAINT [FK_PMSApprovers_ReviewerI]
GO
ALTER TABLE [dbo].[PMS_Approvers]  WITH CHECK ADD  CONSTRAINT [FK_PMSApprovers_ReviewerII] FOREIGN KEY([ReviewerII])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[PMS_Approvers] CHECK CONSTRAINT [FK_PMSApprovers_ReviewerII]
GO
