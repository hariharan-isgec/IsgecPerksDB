USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRM_Companies](
	[CompanyID] [nvarchar](6) NOT NULL,
	[Description] [nvarchar](60) NOT NULL,
	[ShortName] [nvarchar](20) NOT NULL,
	[BaaNID] [nvarchar](3) NULL,
 CONSTRAINT [PK_HRM_Companies] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HRM_Companies] ADD  CONSTRAINT [DF_HRM_Companies_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[HRM_Companies] ADD  CONSTRAINT [DF_HRM_Companies_ShortName]  DEFAULT ('') FOR [ShortName]
GO
ALTER TABLE [dbo].[HRM_Companies] ADD  CONSTRAINT [DF_HRM_Companies_BaaNID]  DEFAULT ('') FOR [BaaNID]
GO
