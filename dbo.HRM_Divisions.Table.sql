USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRM_Divisions](
	[DivisionID] [nvarchar](6) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[DivisionHead] [nvarchar](8) NULL,
	[ERP_EU] [nvarchar](10) NULL,
	[ERP_Div] [nvarchar](10) NULL,
 CONSTRAINT [PK_HRM_Divisions] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HRM_Divisions] ADD  CONSTRAINT [DF_HRM_Divisions_Description]  DEFAULT ('') FOR [Description]
GO
