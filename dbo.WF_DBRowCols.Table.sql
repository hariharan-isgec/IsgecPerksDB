USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WF_DBRowCols](
	[DashboardID] [int] NOT NULL,
	[DBRows] [int] NOT NULL,
	[DBCols] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[DBFieldName] [nvarchar](50) NULL,
	[LinkURL] [nvarchar](500) NULL,
	[cssHeader] [nvarchar](50) NULL,
	[cssCell] [nvarchar](50) NULL,
	[Sequence] [int] NOT NULL,
 CONSTRAINT [PK_WF_DBRowCols] PRIMARY KEY CLUSTERED 
(
	[DashboardID] ASC,
	[DBRows] ASC,
	[DBCols] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WF_DBRowCols]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRowCols_DashboardID] FOREIGN KEY([DashboardID])
REFERENCES [dbo].[WF_Dashboards] ([DashboardID])
GO
ALTER TABLE [dbo].[WF_DBRowCols] CHECK CONSTRAINT [FK_WF_DBRowCols_DashboardID]
GO
ALTER TABLE [dbo].[WF_DBRowCols]  WITH CHECK ADD  CONSTRAINT [FK_WF_DBRowCols_DBRows] FOREIGN KEY([DashboardID], [DBRows])
REFERENCES [dbo].[WF_DBRows] ([DashboardID], [DBRows])
GO
ALTER TABLE [dbo].[WF_DBRowCols] CHECK CONSTRAINT [FK_WF_DBRowCols_DBRows]
GO
ALTER TABLE [dbo].[WF_DBRowCols] ADD  CONSTRAINT [DF_WF_DBRowCols_Sequence]  DEFAULT ((0)) FOR [Sequence]
GO
