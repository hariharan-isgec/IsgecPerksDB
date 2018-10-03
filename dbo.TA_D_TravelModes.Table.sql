USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_D_TravelModes](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[EntitlementText] [nvarchar](250) NULL,
	[TravelModeID] [int] NOT NULL,
	[FromDate] [datetime] NOT NULL,
	[TillDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_TA_D_TravelModes] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TA_D_TravelModes]  WITH CHECK ADD  CONSTRAINT [FK_TA_D_TravelModes_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[TA_Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[TA_D_TravelModes] CHECK CONSTRAINT [FK_TA_D_TravelModes_CategoryID]
GO
ALTER TABLE [dbo].[TA_D_TravelModes]  WITH CHECK ADD  CONSTRAINT [FK_TA_D_TravelModes_TravelModeID] FOREIGN KEY([TravelModeID])
REFERENCES [dbo].[TA_TravelModes] ([ModeID])
GO
ALTER TABLE [dbo].[TA_D_TravelModes] CHECK CONSTRAINT [FK_TA_D_TravelModes_TravelModeID]
GO
ALTER TABLE [dbo].[TA_D_TravelModes] ADD  CONSTRAINT [DF_TA_D_TravelModes_Active]  DEFAULT ((0)) FOR [Active]
GO
