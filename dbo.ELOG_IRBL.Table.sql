USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ELOG_IRBL](
	[IRNo] [int] NOT NULL,
	[SupplierID] [nvarchar](9) NULL,
	[ProjectID] [nvarchar](6) NULL,
	[PONo] [nvarchar](9) NULL,
	[SupplierBillNo] [nvarchar](50) NULL,
	[supplierBillDate] [datetime] NULL,
	[SupplierBillAmount] [decimal](18, 2) NULL,
	[IRDate] [datetime] NULL,
	[BLID] [nvarchar](9) NULL,
	[BLType] [int] NULL,
	[MBLNo] [nvarchar](50) NULL,
	[Remarks] [nvarchar](500) NULL,
	[CreatedBy] [nvarchar](8) NULL,
	[CreatedOn] [datetime] NULL,
	[ShipmentModeID] [int] NULL,
	[CarrierID] [int] NULL,
	[OtherCarrier] [nvarchar](100) NULL,
	[LocationCountryID] [int] NULL,
	[OtherCountry] [nvarchar](100) NULL,
	[CargoTypeID] [int] NULL,
	[PortID] [int] NULL,
	[OtherPortLoadingOrigin] [nvarchar](100) NULL,
	[StatusID] [int] NULL,
 CONSTRAINT [PK_ELOG_IR] PRIMARY KEY CLUSTERED 
(
	[IRNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ELOG_IRBL]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_IRBL_BLID] FOREIGN KEY([BLID])
REFERENCES [dbo].[ELOG_BLHeader] ([BLID])
GO
ALTER TABLE [dbo].[ELOG_IRBL] CHECK CONSTRAINT [FK_ELOG_IRBL_BLID]
GO
ALTER TABLE [dbo].[ELOG_IRBL]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_IRBL_BLType] FOREIGN KEY([BLType])
REFERENCES [dbo].[ELOG_BLTypes] ([BLTypeID])
GO
ALTER TABLE [dbo].[ELOG_IRBL] CHECK CONSTRAINT [FK_ELOG_IRBL_BLType]
GO
ALTER TABLE [dbo].[ELOG_IRBL]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_IRBL_CargoTypeID] FOREIGN KEY([CargoTypeID])
REFERENCES [dbo].[ELOG_CargoTypes] ([CargoTypeID])
GO
ALTER TABLE [dbo].[ELOG_IRBL] CHECK CONSTRAINT [FK_ELOG_IRBL_CargoTypeID]
GO
ALTER TABLE [dbo].[ELOG_IRBL]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_IRBL_CarrierID] FOREIGN KEY([CarrierID])
REFERENCES [dbo].[ELOG_Carriers] ([CarrierID])
GO
ALTER TABLE [dbo].[ELOG_IRBL] CHECK CONSTRAINT [FK_ELOG_IRBL_CarrierID]
GO
ALTER TABLE [dbo].[ELOG_IRBL]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_IRBL_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[ELOG_IRBL] CHECK CONSTRAINT [FK_ELOG_IRBL_CreatedBy]
GO
ALTER TABLE [dbo].[ELOG_IRBL]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_IRBL_LocationCountryID] FOREIGN KEY([LocationCountryID])
REFERENCES [dbo].[ELOG_LocationCountries] ([LocationCountryID])
GO
ALTER TABLE [dbo].[ELOG_IRBL] CHECK CONSTRAINT [FK_ELOG_IRBL_LocationCountryID]
GO
ALTER TABLE [dbo].[ELOG_IRBL]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_IRBL_PortID] FOREIGN KEY([PortID])
REFERENCES [dbo].[ELOG_Ports] ([PortID])
GO
ALTER TABLE [dbo].[ELOG_IRBL] CHECK CONSTRAINT [FK_ELOG_IRBL_PortID]
GO
ALTER TABLE [dbo].[ELOG_IRBL]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_IRBL_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[ELOG_IRBL] CHECK CONSTRAINT [FK_ELOG_IRBL_ProjectID]
GO
ALTER TABLE [dbo].[ELOG_IRBL]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_IRBL_ShipmentModeID] FOREIGN KEY([ShipmentModeID])
REFERENCES [dbo].[ELOG_ShipmentModes] ([ShipmentModeID])
GO
ALTER TABLE [dbo].[ELOG_IRBL] CHECK CONSTRAINT [FK_ELOG_IRBL_ShipmentModeID]
GO
ALTER TABLE [dbo].[ELOG_IRBL]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_IRBL_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[ELOG_IRBLStates] ([StatusID])
GO
ALTER TABLE [dbo].[ELOG_IRBL] CHECK CONSTRAINT [FK_ELOG_IRBL_StatusID]
GO
ALTER TABLE [dbo].[ELOG_IRBL]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_IRBL_SupplierID] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[VR_BusinessPartner] ([BPID])
GO
ALTER TABLE [dbo].[ELOG_IRBL] CHECK CONSTRAINT [FK_ELOG_IRBL_SupplierID]
GO
