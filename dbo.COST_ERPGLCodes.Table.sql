USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COST_ERPGLCodes](
	[GLCode] [nvarchar](7) NOT NULL,
	[GLDescription] [nvarchar](50) NULL,
 CONSTRAINT [PK_COST_ERPGLCodes] PRIMARY KEY CLUSTERED 
(
	[GLCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
