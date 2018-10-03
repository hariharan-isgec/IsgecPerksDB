USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_D_Mileage](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[CityID] [nvarchar](30) NULL,
	[OtherCity] [bit] NOT NULL,
	[AmountPerKM] [decimal](10, 2) NULL,
	[FromDate] [datetime] NOT NULL,
	[TillDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_TA_D_Mileage] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TA_D_Mileage]  WITH CHECK ADD  CONSTRAINT [FK_TA_D_Mileage_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[TA_Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[TA_D_Mileage] CHECK CONSTRAINT [FK_TA_D_Mileage_CategoryID]
GO
ALTER TABLE [dbo].[TA_D_Mileage]  WITH CHECK ADD  CONSTRAINT [FK_TA_D_Mileage_CityID] FOREIGN KEY([CityID])
REFERENCES [dbo].[TA_Cities] ([CityID])
GO
ALTER TABLE [dbo].[TA_D_Mileage] CHECK CONSTRAINT [FK_TA_D_Mileage_CityID]
GO
ALTER TABLE [dbo].[TA_D_Mileage] ADD  CONSTRAINT [DF_TA_D_Mileage_OtherCity]  DEFAULT ((1)) FOR [OtherCity]
GO
ALTER TABLE [dbo].[TA_D_Mileage] ADD  CONSTRAINT [DF_TA_D_Mileage_Active]  DEFAULT ((0)) FOR [Active]
GO
