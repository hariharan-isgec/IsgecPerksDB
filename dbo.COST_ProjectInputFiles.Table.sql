USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COST_ProjectInputFiles](
	[ProjectGroupID] [int] NOT NULL,
	[FinYear] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[SerialNo] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
	[FileName] [nvarchar](250) NULL,
	[DiskFile] [nvarchar](250) NULL,
 CONSTRAINT [PK_COST_ProjectInputFiles] PRIMARY KEY CLUSTERED 
(
	[ProjectGroupID] ASC,
	[FinYear] ASC,
	[Quarter] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COST_ProjectInputFiles]  WITH CHECK ADD  CONSTRAINT [FK_COST_ProjectInputFiles_FinYear] FOREIGN KEY([FinYear])
REFERENCES [dbo].[COST_FinYear] ([FinYear])
GO
ALTER TABLE [dbo].[COST_ProjectInputFiles] CHECK CONSTRAINT [FK_COST_ProjectInputFiles_FinYear]
GO
ALTER TABLE [dbo].[COST_ProjectInputFiles]  WITH CHECK ADD  CONSTRAINT [FK_COST_ProjectInputFiles_ProjectGroupID] FOREIGN KEY([ProjectGroupID])
REFERENCES [dbo].[COST_ProjectGroups] ([ProjectGroupID])
GO
ALTER TABLE [dbo].[COST_ProjectInputFiles] CHECK CONSTRAINT [FK_COST_ProjectInputFiles_ProjectGroupID]
GO
ALTER TABLE [dbo].[COST_ProjectInputFiles]  WITH CHECK ADD  CONSTRAINT [FK_COST_ProjectInputFiles_ProjectInput] FOREIGN KEY([ProjectGroupID], [FinYear], [Quarter])
REFERENCES [dbo].[COST_ProjectsInput] ([ProjectGroupID], [FinYear], [Quarter])
GO
ALTER TABLE [dbo].[COST_ProjectInputFiles] CHECK CONSTRAINT [FK_COST_ProjectInputFiles_ProjectInput]
GO
ALTER TABLE [dbo].[COST_ProjectInputFiles]  WITH CHECK ADD  CONSTRAINT [FK_COST_ProjectInputFiles_Quarter] FOREIGN KEY([Quarter])
REFERENCES [dbo].[COST_Quarters] ([Quarter])
GO
ALTER TABLE [dbo].[COST_ProjectInputFiles] CHECK CONSTRAINT [FK_COST_ProjectInputFiles_Quarter]
GO
