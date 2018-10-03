USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASM_AstHistory](
	[MrnID] [int] NOT NULL,
	[AssetID] [int] NOT NULL,
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[ActivityID] [nvarchar](20) NOT NULL,
	[AssetTypeID] [nvarchar](10) NOT NULL,
	[MrnDate] [datetime] NULL,
	[MrnDescription] [nvarchar](50) NOT NULL,
	[SupplierID] [int] NULL,
	[DateOfPurchase] [datetime] NULL,
	[WarrantyTill] [datetime] NULL,
	[InsuranceTill] [datetime] NULL,
	[BrandID] [nvarchar](15) NULL,
	[ModelNo] [nvarchar](50) NULL,
	[OtherSpecifications] [nvarchar](50) NULL,
	[PurchasedQuantity] [int] NULL,
	[RecievedAt] [int] NULL,
	[RecievedOn] [datetime] NULL,
	[Remarks] [nvarchar](50) NULL,
	[RecievedBy] [nvarchar](8) NULL,
	[AssetNo] [nvarchar](50) NULL,
	[AssetSerialNo] [nvarchar](50) NULL,
	[IssueToLocation] [bit] NOT NULL,
	[UserID] [nvarchar](8) NULL,
	[LocationID] [nvarchar](20) NULL,
	[Issued] [bit] NOT NULL,
	[StandBy] [bit] NOT NULL,
	[ReplacedTill] [datetime] NULL,
	[Returnable] [bit] NOT NULL,
	[ExpectedDate] [datetime] NULL,
	[Transferred] [bit] NOT NULL,
	[ToOfficeID] [int] NULL,
	[RecievedTransfered] [bit] NOT NULL,
	[FromOfficeID] [int] NULL,
	[Upgraded] [bit] NOT NULL,
	[ProblemDetails] [nvarchar](100) NULL,
	[OnRepair] [bit] NOT NULL,
	[ToSupplierID] [int] NULL,
	[Discarded] [bit] NOT NULL,
	[Modified] [bit] NOT NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](8) NULL,
	[ModificationRemarks] [nvarchar](50) NULL,
	[IPAddress] [nvarchar](50) NULL,
	[HostName] [nvarchar](50) NULL,
	[INDomain] [bit] NOT NULL,
	[DomainName] [nvarchar](50) NULL,
	[MapDrive] [bit] NOT NULL,
	[PenDriveDisable] [bit] NOT NULL,
	[CDROMDisable] [bit] NOT NULL,
	[InternetAccess] [bit] NOT NULL,
	[Keyboard] [bit] NOT NULL,
	[Mouse] [bit] NOT NULL,
	[FloppyDrive] [bit] NOT NULL,
	[CPUBrandID] [nvarchar](15) NULL,
	[NoOfCPUs] [int] NULL,
	[CPUDetails] [nvarchar](50) NULL,
	[CPUSerialNo] [nvarchar](100) NULL,
	[RAMID] [nvarchar](10) NULL,
	[SizeOfRAM] [int] NULL,
	[HDDBrandID] [nvarchar](15) NULL,
	[NoOfHDD] [int] NULL,
	[SizeOfHDD] [int] NULL,
	[HDDDetails] [nvarchar](50) NULL,
	[HDDSerialNo] [nvarchar](100) NULL,
	[CDROMBrandID] [nvarchar](15) NULL,
	[NoOfCDROM] [int] NULL,
	[CDROMDetails] [nvarchar](50) NULL,
	[CDROMSerialNo] [nvarchar](100) NULL,
	[VDUBrandID] [nvarchar](15) NULL,
	[VDUDetails] [nvarchar](50) NULL,
	[VDUSerialNo] [nvarchar](100) NULL,
	[PCOSID] [nvarchar](15) NULL,
	[PCOSDetails] [nvarchar](50) NULL,
	[PCOSSerialNo] [nvarchar](100) NULL,
 CONSTRAINT [PK_ASM_AstHistory] PRIMARY KEY CLUSTERED 
(
	[MrnID] ASC,
	[AssetID] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ASM_AstHistory]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHistory_ASM_Activities] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[ASM_Activities] ([ActivityID])
GO
ALTER TABLE [dbo].[ASM_AstHistory] CHECK CONSTRAINT [FK_ASM_AstHistory_ASM_Activities]
GO
ALTER TABLE [dbo].[ASM_AstHistory]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHistory_ASM_AstBrands] FOREIGN KEY([BrandID])
REFERENCES [dbo].[ASM_AstBrands] ([BrandID])
GO
ALTER TABLE [dbo].[ASM_AstHistory] CHECK CONSTRAINT [FK_ASM_AstHistory_ASM_AstBrands]
GO
ALTER TABLE [dbo].[ASM_AstHistory]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHistory_ASM_AstBrands1] FOREIGN KEY([CPUBrandID])
REFERENCES [dbo].[ASM_AstBrands] ([BrandID])
GO
ALTER TABLE [dbo].[ASM_AstHistory] CHECK CONSTRAINT [FK_ASM_AstHistory_ASM_AstBrands1]
GO
ALTER TABLE [dbo].[ASM_AstHistory]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHistory_ASM_AstBrands2] FOREIGN KEY([HDDBrandID])
REFERENCES [dbo].[ASM_AstBrands] ([BrandID])
GO
ALTER TABLE [dbo].[ASM_AstHistory] CHECK CONSTRAINT [FK_ASM_AstHistory_ASM_AstBrands2]
GO
ALTER TABLE [dbo].[ASM_AstHistory]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHistory_ASM_AstBrands3] FOREIGN KEY([CDROMBrandID])
REFERENCES [dbo].[ASM_AstBrands] ([BrandID])
GO
ALTER TABLE [dbo].[ASM_AstHistory] CHECK CONSTRAINT [FK_ASM_AstHistory_ASM_AstBrands3]
GO
ALTER TABLE [dbo].[ASM_AstHistory]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHistory_ASM_AstBrands4] FOREIGN KEY([VDUBrandID])
REFERENCES [dbo].[ASM_AstBrands] ([BrandID])
GO
ALTER TABLE [dbo].[ASM_AstHistory] CHECK CONSTRAINT [FK_ASM_AstHistory_ASM_AstBrands4]
GO
ALTER TABLE [dbo].[ASM_AstHistory]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHistory_ASM_AstDetails] FOREIGN KEY([MrnID], [AssetID])
REFERENCES [dbo].[ASM_AstDetails] ([MrnID], [AssetID])
GO
ALTER TABLE [dbo].[ASM_AstHistory] CHECK CONSTRAINT [FK_ASM_AstHistory_ASM_AstDetails]
GO
ALTER TABLE [dbo].[ASM_AstHistory]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHistory_ASM_AstLocations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[ASM_AstLocations] ([LocationID])
GO
ALTER TABLE [dbo].[ASM_AstHistory] CHECK CONSTRAINT [FK_ASM_AstHistory_ASM_AstLocations]
GO
ALTER TABLE [dbo].[ASM_AstHistory]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHistory_ASM_AstRAMS] FOREIGN KEY([RAMID])
REFERENCES [dbo].[ASM_AstRAMS] ([RAMID])
GO
ALTER TABLE [dbo].[ASM_AstHistory] CHECK CONSTRAINT [FK_ASM_AstHistory_ASM_AstRAMS]
GO
ALTER TABLE [dbo].[ASM_AstHistory]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHistory_ASM_AstSoftwares] FOREIGN KEY([PCOSID])
REFERENCES [dbo].[ASM_AstSoftwares] ([SoftwareID])
GO
ALTER TABLE [dbo].[ASM_AstHistory] CHECK CONSTRAINT [FK_ASM_AstHistory_ASM_AstSoftwares]
GO
ALTER TABLE [dbo].[ASM_AstHistory]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHistory_ASM_AstTypes] FOREIGN KEY([AssetTypeID])
REFERENCES [dbo].[ASM_AstTypes] ([AssetTypeID])
GO
ALTER TABLE [dbo].[ASM_AstHistory] CHECK CONSTRAINT [FK_ASM_AstHistory_ASM_AstTypes]
GO
ALTER TABLE [dbo].[ASM_AstHistory]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHistory_ASM_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[ASM_Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[ASM_AstHistory] CHECK CONSTRAINT [FK_ASM_AstHistory_ASM_Suppliers]
GO
ALTER TABLE [dbo].[ASM_AstHistory]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHistory_ASM_Suppliers1] FOREIGN KEY([ToSupplierID])
REFERENCES [dbo].[ASM_Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[ASM_AstHistory] CHECK CONSTRAINT [FK_ASM_AstHistory_ASM_Suppliers1]
GO
ALTER TABLE [dbo].[ASM_AstHistory]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHistory_HRM_Employees] FOREIGN KEY([RecievedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ASM_AstHistory] CHECK CONSTRAINT [FK_ASM_AstHistory_HRM_Employees]
GO
ALTER TABLE [dbo].[ASM_AstHistory]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHistory_HRM_Employees1] FOREIGN KEY([UserID])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ASM_AstHistory] CHECK CONSTRAINT [FK_ASM_AstHistory_HRM_Employees1]
GO
ALTER TABLE [dbo].[ASM_AstHistory]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHistory_HRM_Offices] FOREIGN KEY([RecievedAt])
REFERENCES [dbo].[HRM_Offices] ([OfficeID])
GO
ALTER TABLE [dbo].[ASM_AstHistory] CHECK CONSTRAINT [FK_ASM_AstHistory_HRM_Offices]
GO
ALTER TABLE [dbo].[ASM_AstHistory]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHistory_HRM_Offices1] FOREIGN KEY([ToOfficeID])
REFERENCES [dbo].[HRM_Offices] ([OfficeID])
GO
ALTER TABLE [dbo].[ASM_AstHistory] CHECK CONSTRAINT [FK_ASM_AstHistory_HRM_Offices1]
GO
ALTER TABLE [dbo].[ASM_AstHistory]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHistory_HRM_Offices2] FOREIGN KEY([FromOfficeID])
REFERENCES [dbo].[HRM_Offices] ([OfficeID])
GO
ALTER TABLE [dbo].[ASM_AstHistory] CHECK CONSTRAINT [FK_ASM_AstHistory_HRM_Offices2]
GO
ALTER TABLE [dbo].[ASM_AstHistory] ADD  CONSTRAINT [DF_ASM_AstHistory_IssueToUser]  DEFAULT ((0)) FOR [IssueToLocation]
GO
ALTER TABLE [dbo].[ASM_AstHistory] ADD  CONSTRAINT [DF_ASM_AstHistory_Issued]  DEFAULT ((0)) FOR [Issued]
GO
ALTER TABLE [dbo].[ASM_AstHistory] ADD  CONSTRAINT [DF_ASM_AstHistory_StandBy]  DEFAULT ((0)) FOR [StandBy]
GO
ALTER TABLE [dbo].[ASM_AstHistory] ADD  CONSTRAINT [DF_ASM_AstHistory_Returnable]  DEFAULT ((0)) FOR [Returnable]
GO
ALTER TABLE [dbo].[ASM_AstHistory] ADD  CONSTRAINT [DF_ASM_AstHistory_Transferred]  DEFAULT ((0)) FOR [Transferred]
GO
ALTER TABLE [dbo].[ASM_AstHistory] ADD  CONSTRAINT [DF_ASM_AstHistory_RecievedTransfered]  DEFAULT ((0)) FOR [RecievedTransfered]
GO
ALTER TABLE [dbo].[ASM_AstHistory] ADD  CONSTRAINT [DF_ASM_AstHistory_Upgraded]  DEFAULT ((0)) FOR [Upgraded]
GO
ALTER TABLE [dbo].[ASM_AstHistory] ADD  CONSTRAINT [DF_ASM_AstHistory_OnRepair]  DEFAULT ((0)) FOR [OnRepair]
GO
ALTER TABLE [dbo].[ASM_AstHistory] ADD  CONSTRAINT [DF_ASM_AstHistory_Discarded]  DEFAULT ((0)) FOR [Discarded]
GO
ALTER TABLE [dbo].[ASM_AstHistory] ADD  CONSTRAINT [DF_ASM_AstHistory_Modified]  DEFAULT ((0)) FOR [Modified]
GO
ALTER TABLE [dbo].[ASM_AstHistory] ADD  CONSTRAINT [DF_ASM_AstHistory_INDomain]  DEFAULT ((0)) FOR [INDomain]
GO
ALTER TABLE [dbo].[ASM_AstHistory] ADD  CONSTRAINT [DF_ASM_AstHistory_MapDrive]  DEFAULT ((0)) FOR [MapDrive]
GO
ALTER TABLE [dbo].[ASM_AstHistory] ADD  CONSTRAINT [DF_ASM_AstHistory_PenDriveDisable]  DEFAULT ((0)) FOR [PenDriveDisable]
GO
ALTER TABLE [dbo].[ASM_AstHistory] ADD  CONSTRAINT [DF_ASM_AstHistory_CDROMDisable]  DEFAULT ((0)) FOR [CDROMDisable]
GO
ALTER TABLE [dbo].[ASM_AstHistory] ADD  CONSTRAINT [DF_ASM_AstHistory_InternetAccess]  DEFAULT ((0)) FOR [InternetAccess]
GO
ALTER TABLE [dbo].[ASM_AstHistory] ADD  CONSTRAINT [DF_ASM_AstHistory_Keyboard]  DEFAULT ((0)) FOR [Keyboard]
GO
ALTER TABLE [dbo].[ASM_AstHistory] ADD  CONSTRAINT [DF_ASM_AstHistory_Mouse]  DEFAULT ((0)) FOR [Mouse]
GO
ALTER TABLE [dbo].[ASM_AstHistory] ADD  CONSTRAINT [DF_ASM_AstHistory_FloppyDrive]  DEFAULT ((0)) FOR [FloppyDrive]
GO
