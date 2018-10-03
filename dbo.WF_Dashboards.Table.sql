USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WF_Dashboards](
	[DashboardID] [int] IDENTITY(1,1) NOT NULL,
	[DBDescription] [nvarchar](50) NULL,
	[Active] [bit] NOT NULL,
	[InitializedByMe] [bit] NOT NULL,
	[DBRowTypeID] [int] NULL,
	[ConvertForGraph] [bit] NOT NULL,
	[NotToDraw] [bit] NOT NULL,
	[GraphTypeID] [int] NULL,
	[DBIconID] [int] NULL,
	[DBTitle] [nvarchar](100) NULL,
	[TitleStyle] [nvarchar](250) NULL,
 CONSTRAINT [PK_WF_Dashboards] PRIMARY KEY CLUSTERED 
(
	[DashboardID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WF_Dashboards]  WITH CHECK ADD  CONSTRAINT [FK_WF_Dashboards_DBIconID] FOREIGN KEY([DBIconID])
REFERENCES [dbo].[WF_DBIcons] ([DBIconID])
GO
ALTER TABLE [dbo].[WF_Dashboards] CHECK CONSTRAINT [FK_WF_Dashboards_DBIconID]
GO
ALTER TABLE [dbo].[WF_Dashboards]  WITH CHECK ADD  CONSTRAINT [FK_WF_Dashboards_DBRowTypeID] FOREIGN KEY([DBRowTypeID])
REFERENCES [dbo].[WF_DBRowTypes] ([RowTypeID])
GO
ALTER TABLE [dbo].[WF_Dashboards] CHECK CONSTRAINT [FK_WF_Dashboards_DBRowTypeID]
GO
ALTER TABLE [dbo].[WF_Dashboards]  WITH CHECK ADD  CONSTRAINT [FK_WF_Dashboards_GraphTypeID] FOREIGN KEY([GraphTypeID])
REFERENCES [dbo].[WF_GraphTypes] ([GraphTypeID])
GO
ALTER TABLE [dbo].[WF_Dashboards] CHECK CONSTRAINT [FK_WF_Dashboards_GraphTypeID]
GO
ALTER TABLE [dbo].[WF_Dashboards] ADD  CONSTRAINT [DF_WF_Dashboards_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[WF_Dashboards] ADD  CONSTRAINT [DF_WF_Dashboards_InitializedByMe]  DEFAULT ((0)) FOR [InitializedByMe]
GO
ALTER TABLE [dbo].[WF_Dashboards] ADD  CONSTRAINT [DF_WF_Dashboards_ConvertForGraph]  DEFAULT ((0)) FOR [ConvertForGraph]
GO
ALTER TABLE [dbo].[WF_Dashboards] ADD  CONSTRAINT [DF_WF_Dashboards_NotToDraw]  DEFAULT ((1)) FOR [NotToDraw]
GO
