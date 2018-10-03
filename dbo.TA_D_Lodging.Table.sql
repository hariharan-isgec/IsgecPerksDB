USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_D_Lodging](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[CityTypeID] [nvarchar](6) NULL,
	[LodgingAmount] [decimal](10, 2) NULL,
	[FromDate] [datetime] NOT NULL,
	[TillDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_TA_D_Lodging] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TA_D_Lodging]  WITH CHECK ADD  CONSTRAINT [FK_TA_D_Lodging_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[TA_Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[TA_D_Lodging] CHECK CONSTRAINT [FK_TA_D_Lodging_CategoryID]
GO
ALTER TABLE [dbo].[TA_D_Lodging]  WITH CHECK ADD  CONSTRAINT [FK_TA_D_Lodging_CityTypeID] FOREIGN KEY([CityTypeID])
REFERENCES [dbo].[TA_CityTypes] ([CityTypeID])
GO
ALTER TABLE [dbo].[TA_D_Lodging] CHECK CONSTRAINT [FK_TA_D_Lodging_CityTypeID]
GO
ALTER TABLE [dbo].[TA_D_Lodging] ADD  CONSTRAINT [DF_TA_D_Lodging_Active]  DEFAULT ((0)) FOR [Active]
GO
