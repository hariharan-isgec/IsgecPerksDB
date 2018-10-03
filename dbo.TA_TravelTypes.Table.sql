USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_TravelTypes](
	[TravelTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TravelTypeDescription] [nvarchar](50) NULL,
 CONSTRAINT [PK_TA_TravelTypes] PRIMARY KEY CLUSTERED 
(
	[TravelTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
