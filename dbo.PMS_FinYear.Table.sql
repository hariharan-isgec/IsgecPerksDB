USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PMS_FinYear](
	[FinYear] [nvarchar](4) NOT NULL,
	[Description] [nvarchar](30) NOT NULL,
	[Active] [bit] NOT NULL,
	[PlanningOpen] [bit] NOT NULL,
	[MidTermOpen] [bit] NOT NULL,
	[FinalOpen] [bit] NOT NULL,
 CONSTRAINT [PK_PMS_FinYear] PRIMARY KEY CLUSTERED 
(
	[FinYear] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PMS_FinYear] ADD  CONSTRAINT [DF_PMS_FinYear_Active]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[PMS_FinYear] ADD  CONSTRAINT [DF_PMS_FinYear_PlanningOpen]  DEFAULT ((0)) FOR [PlanningOpen]
GO
ALTER TABLE [dbo].[PMS_FinYear] ADD  CONSTRAINT [DF_PMS_FinYear_MidTermOpen]  DEFAULT ((0)) FOR [MidTermOpen]
GO
ALTER TABLE [dbo].[PMS_FinYear] ADD  CONSTRAINT [DF_PMS_FinYear_FinalOpen]  DEFAULT ((0)) FOR [FinalOpen]
GO
