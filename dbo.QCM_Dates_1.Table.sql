USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QCM_Dates_1](
	[date] [datetime] NULL,
	[isweekday] [int] NULL,
	[y] [int] NULL,
	[q] [int] NULL,
	[m] [int] NULL,
	[d] [int] NULL,
	[dw] [int] NULL,
	[monthname] [nvarchar](30) NULL,
	[dayname] [nvarchar](30) NULL,
	[w] [int] NULL
) ON [PRIMARY]
GO
