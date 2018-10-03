USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COST_FinYear](
	[FinYear] [int] NOT NULL,
	[Descpription] [nvarchar](50) NULL,
 CONSTRAINT [PK_COST_FinYear] PRIMARY KEY CLUSTERED 
(
	[FinYear] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
