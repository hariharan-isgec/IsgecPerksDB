USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASM_AstHeader](
	[MrnID] [int] IDENTITY(1,1) NOT NULL,
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
	[IssuedQuantity] [int] NULL,
	[WriteOffQuantity] [int] NULL,
	[Keyboard] [bit] NOT NULL,
	[Mouse] [bit] NOT NULL,
	[FloppyDrive] [bit] NOT NULL,
	[CPUBrandID] [nvarchar](15) NULL,
	[NoOfCPUs] [int] NULL,
	[CPUDetails] [nvarchar](50) NULL,
	[RAMID] [nvarchar](10) NULL,
	[SizeOfRAM] [int] NULL,
	[HDDBrandID] [nvarchar](15) NULL,
	[NoOfHDD] [int] NULL,
	[SizeOfHDD] [int] NULL,
	[HDDDetails] [nvarchar](50) NULL,
	[CDROMBrandID] [nvarchar](15) NULL,
	[NoOfCDROM] [int] NULL,
	[CDROMDetails] [nvarchar](50) NULL,
	[VDUBrandID] [nvarchar](15) NULL,
	[VDUDetails] [nvarchar](50) NULL,
	[PCOSID] [nvarchar](15) NULL,
	[PCOSDetails] [nvarchar](50) NULL,
 CONSTRAINT [PK_ASM_AstHeader] PRIMARY KEY CLUSTERED 
(
	[MrnID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ASM_AstHeader]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHeader_ASM_AstBrands] FOREIGN KEY([BrandID])
REFERENCES [dbo].[ASM_AstBrands] ([BrandID])
GO
ALTER TABLE [dbo].[ASM_AstHeader] CHECK CONSTRAINT [FK_ASM_AstHeader_ASM_AstBrands]
GO
ALTER TABLE [dbo].[ASM_AstHeader]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHeader_ASM_AstBrands1] FOREIGN KEY([CPUBrandID])
REFERENCES [dbo].[ASM_AstBrands] ([BrandID])
GO
ALTER TABLE [dbo].[ASM_AstHeader] CHECK CONSTRAINT [FK_ASM_AstHeader_ASM_AstBrands1]
GO
ALTER TABLE [dbo].[ASM_AstHeader]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHeader_ASM_AstBrands2] FOREIGN KEY([HDDBrandID])
REFERENCES [dbo].[ASM_AstBrands] ([BrandID])
GO
ALTER TABLE [dbo].[ASM_AstHeader] CHECK CONSTRAINT [FK_ASM_AstHeader_ASM_AstBrands2]
GO
ALTER TABLE [dbo].[ASM_AstHeader]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHeader_ASM_AstBrands3] FOREIGN KEY([CDROMBrandID])
REFERENCES [dbo].[ASM_AstBrands] ([BrandID])
GO
ALTER TABLE [dbo].[ASM_AstHeader] CHECK CONSTRAINT [FK_ASM_AstHeader_ASM_AstBrands3]
GO
ALTER TABLE [dbo].[ASM_AstHeader]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHeader_ASM_AstBrands4] FOREIGN KEY([VDUBrandID])
REFERENCES [dbo].[ASM_AstBrands] ([BrandID])
GO
ALTER TABLE [dbo].[ASM_AstHeader] CHECK CONSTRAINT [FK_ASM_AstHeader_ASM_AstBrands4]
GO
ALTER TABLE [dbo].[ASM_AstHeader]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHeader_ASM_AstRAMS] FOREIGN KEY([RAMID])
REFERENCES [dbo].[ASM_AstRAMS] ([RAMID])
GO
ALTER TABLE [dbo].[ASM_AstHeader] CHECK CONSTRAINT [FK_ASM_AstHeader_ASM_AstRAMS]
GO
ALTER TABLE [dbo].[ASM_AstHeader]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHeader_ASM_AstSoftwares] FOREIGN KEY([PCOSID])
REFERENCES [dbo].[ASM_AstSoftwares] ([SoftwareID])
GO
ALTER TABLE [dbo].[ASM_AstHeader] CHECK CONSTRAINT [FK_ASM_AstHeader_ASM_AstSoftwares]
GO
ALTER TABLE [dbo].[ASM_AstHeader]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHeader_ASM_AstTypes] FOREIGN KEY([AssetTypeID])
REFERENCES [dbo].[ASM_AstTypes] ([AssetTypeID])
GO
ALTER TABLE [dbo].[ASM_AstHeader] CHECK CONSTRAINT [FK_ASM_AstHeader_ASM_AstTypes]
GO
ALTER TABLE [dbo].[ASM_AstHeader]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHeader_ASM_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[ASM_Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[ASM_AstHeader] CHECK CONSTRAINT [FK_ASM_AstHeader_ASM_Suppliers]
GO
ALTER TABLE [dbo].[ASM_AstHeader]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHeader_HRM_Employees] FOREIGN KEY([RecievedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ASM_AstHeader] CHECK CONSTRAINT [FK_ASM_AstHeader_HRM_Employees]
GO
ALTER TABLE [dbo].[ASM_AstHeader]  WITH CHECK ADD  CONSTRAINT [FK_ASM_AstHeader_HRM_Offices] FOREIGN KEY([RecievedAt])
REFERENCES [dbo].[HRM_Offices] ([OfficeID])
GO
ALTER TABLE [dbo].[ASM_AstHeader] CHECK CONSTRAINT [FK_ASM_AstHeader_HRM_Offices]
GO
ALTER TABLE [dbo].[ASM_AstHeader] ADD  CONSTRAINT [DF_ASM_AstHeader_Keyboard]  DEFAULT ((0)) FOR [Keyboard]
GO
ALTER TABLE [dbo].[ASM_AstHeader] ADD  CONSTRAINT [DF_ASM_AstHeader_Mouse]  DEFAULT ((0)) FOR [Mouse]
GO
ALTER TABLE [dbo].[ASM_AstHeader] ADD  CONSTRAINT [DF_ASM_AstHeader_FloppyDrive]  DEFAULT ((0)) FOR [FloppyDrive]
GO
