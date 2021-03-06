USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AST_AssetTypes](
	[AssetTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_AST_AssetTypes] PRIMARY KEY CLUSTERED 
(
	[AssetTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AST_AssetTypes] ADD  CONSTRAINT [DF_AST_AsetTypes_Description]  DEFAULT ('') FOR [Description]
GO
