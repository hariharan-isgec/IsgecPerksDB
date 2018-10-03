USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ELOG_ChargeCategories](
	[ChargeCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ShipmentModeID] [int] NULL,
	[LocationCountryID] [int] NULL,
	[CargoTypeID] [int] NULL,
	[StuffingTypeID] [int] NULL,
	[StuffingPointID] [int] NULL,
	[BreakbulkTypeID] [int] NULL,
	[ChargeTypeID] [int] NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_ELOG_ChargeCategories] PRIMARY KEY CLUSTERED 
(
	[ChargeCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ELOG_ChargeCategories]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_ChargeCategories_BreakbulkTypeID] FOREIGN KEY([BreakbulkTypeID])
REFERENCES [dbo].[ELOG_BreakbulkTypes] ([BreakbulkTypeID])
GO
ALTER TABLE [dbo].[ELOG_ChargeCategories] CHECK CONSTRAINT [FK_ELOG_ChargeCategories_BreakbulkTypeID]
GO
ALTER TABLE [dbo].[ELOG_ChargeCategories]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_ChargeCategories_CargoTypeID] FOREIGN KEY([CargoTypeID])
REFERENCES [dbo].[ELOG_CargoTypes] ([CargoTypeID])
GO
ALTER TABLE [dbo].[ELOG_ChargeCategories] CHECK CONSTRAINT [FK_ELOG_ChargeCategories_CargoTypeID]
GO
ALTER TABLE [dbo].[ELOG_ChargeCategories]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_ChargeCategories_ChargeTypeID] FOREIGN KEY([ChargeTypeID])
REFERENCES [dbo].[ELOG_ChargeTypes] ([ChargeTypeID])
GO
ALTER TABLE [dbo].[ELOG_ChargeCategories] CHECK CONSTRAINT [FK_ELOG_ChargeCategories_ChargeTypeID]
GO
ALTER TABLE [dbo].[ELOG_ChargeCategories]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_ChargeCategories_LocationCountryID] FOREIGN KEY([LocationCountryID])
REFERENCES [dbo].[ELOG_LocationCountries] ([LocationCountryID])
GO
ALTER TABLE [dbo].[ELOG_ChargeCategories] CHECK CONSTRAINT [FK_ELOG_ChargeCategories_LocationCountryID]
GO
ALTER TABLE [dbo].[ELOG_ChargeCategories]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_ChargeCategories_ShipmentModeID] FOREIGN KEY([ShipmentModeID])
REFERENCES [dbo].[ELOG_ShipmentModes] ([ShipmentModeID])
GO
ALTER TABLE [dbo].[ELOG_ChargeCategories] CHECK CONSTRAINT [FK_ELOG_ChargeCategories_ShipmentModeID]
GO
ALTER TABLE [dbo].[ELOG_ChargeCategories]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_ChargeCategories_StuffingPointID] FOREIGN KEY([StuffingPointID])
REFERENCES [dbo].[ELOG_StuffingPoints] ([StuffingPointID])
GO
ALTER TABLE [dbo].[ELOG_ChargeCategories] CHECK CONSTRAINT [FK_ELOG_ChargeCategories_StuffingPointID]
GO
ALTER TABLE [dbo].[ELOG_ChargeCategories]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_ChargeCategories_StuffingTypeID] FOREIGN KEY([StuffingTypeID])
REFERENCES [dbo].[ELOG_StuffingTypes] ([StuffingTypeID])
GO
ALTER TABLE [dbo].[ELOG_ChargeCategories] CHECK CONSTRAINT [FK_ELOG_ChargeCategories_StuffingTypeID]
GO
