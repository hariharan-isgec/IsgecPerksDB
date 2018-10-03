USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AST_Locations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[Descriptions] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_AST_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'text:Location ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AST_Locations', @level2type=N'COLUMN',@level2name=N'LocationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'text:Location' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AST_Locations', @level2type=N'COLUMN',@level2name=N'Descriptions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'text:Locations|ddcol:LocaName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AST_Locations'
GO
ALTER TABLE [dbo].[AST_Locations] ADD  CONSTRAINT [DF_Locations_LocaName]  DEFAULT ('') FOR [Descriptions]
GO
