USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_TravelModes](
	[ModeID] [int] IDENTITY(1,1) NOT NULL,
	[ModeName] [nvarchar](50) NULL,
	[Sequence] [int] NULL,
	[OutOfSequence] [bit] NOT NULL,
	[UnderMilageClaim] [bit] NOT NULL,
 CONSTRAINT [PK_TA_TravelModes] PRIMARY KEY CLUSTERED 
(
	[ModeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TA_TravelModes] ADD  CONSTRAINT [DF_TA_TravelModes_AllowedToAll]  DEFAULT ((0)) FOR [OutOfSequence]
GO
ALTER TABLE [dbo].[TA_TravelModes] ADD  CONSTRAINT [DF_TA_TravelModes_UnderMilageClaim]  DEFAULT ((0)) FOR [UnderMilageClaim]
GO
