USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AST_MrnPC](
	[MrnID] [int] IDENTITY(1,1) NOT NULL,
	[MrnDate] [datetime] NOT NULL,
	[MrnDescription] [nvarchar](30) NOT NULL,
	[DateOfPurchase] [datetime] NULL,
	[WarrantyTill] [datetime] NULL,
	[InsuranceTill] [datetime] NULL,
	[SupplierID] [int] NOT NULL,
	[Keyboard] [bit] NOT NULL,
	[Mouse] [bit] NOT NULL,
	[FloppyDrive] [bit] NOT NULL,
	[PurchasedQuantity] [int] NOT NULL,
	[IssuedQuantity] [int] NOT NULL,
	[WriteoffQuantity] [int] NOT NULL,
	[pcBrandID] [int] NULL,
	[NoOfCPUs] [int] NOT NULL,
	[cpuBrandID] [int] NULL,
	[CPUModel] [nvarchar](100) NOT NULL,
	[RamID] [int] NULL,
	[NoOfHDDs] [int] NOT NULL,
	[TotalHDDGB] [int] NOT NULL,
	[HDDDetails] [nvarchar](200) NOT NULL,
	[NoOfCDROMs] [int] NOT NULL,
	[CDRomDetails] [nvarchar](200) NOT NULL,
	[vduBrandID] [int] NULL,
	[pcOSID] [int] NULL,
	[pcOSDetails] [nvarchar](100) NOT NULL,
	[Remarks] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_AST_MrnPC] PRIMARY KEY CLUSTERED 
(
	[MrnID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AST_MrnPC]  WITH CHECK ADD  CONSTRAINT [FK_AST_MrnPC_AST_Brands] FOREIGN KEY([pcBrandID])
REFERENCES [dbo].[AST_Brands] ([BrandID])
GO
ALTER TABLE [dbo].[AST_MrnPC] CHECK CONSTRAINT [FK_AST_MrnPC_AST_Brands]
GO
ALTER TABLE [dbo].[AST_MrnPC]  WITH CHECK ADD  CONSTRAINT [FK_AST_MrnPC_AST_Brands1] FOREIGN KEY([cpuBrandID])
REFERENCES [dbo].[AST_Brands] ([BrandID])
GO
ALTER TABLE [dbo].[AST_MrnPC] CHECK CONSTRAINT [FK_AST_MrnPC_AST_Brands1]
GO
ALTER TABLE [dbo].[AST_MrnPC]  WITH CHECK ADD  CONSTRAINT [FK_AST_MrnPC_AST_Brands2] FOREIGN KEY([vduBrandID])
REFERENCES [dbo].[AST_Brands] ([BrandID])
GO
ALTER TABLE [dbo].[AST_MrnPC] CHECK CONSTRAINT [FK_AST_MrnPC_AST_Brands2]
GO
ALTER TABLE [dbo].[AST_MrnPC]  WITH CHECK ADD  CONSTRAINT [FK_AST_MrnPC_AST_MrnPC] FOREIGN KEY([MrnID])
REFERENCES [dbo].[AST_MrnPC] ([MrnID])
GO
ALTER TABLE [dbo].[AST_MrnPC] CHECK CONSTRAINT [FK_AST_MrnPC_AST_MrnPC]
GO
ALTER TABLE [dbo].[AST_MrnPC]  WITH CHECK ADD  CONSTRAINT [FK_AST_MrnPC_AST_Rams] FOREIGN KEY([RamID])
REFERENCES [dbo].[AST_Rams] ([RamID])
GO
ALTER TABLE [dbo].[AST_MrnPC] CHECK CONSTRAINT [FK_AST_MrnPC_AST_Rams]
GO
ALTER TABLE [dbo].[AST_MrnPC]  WITH CHECK ADD  CONSTRAINT [FK_AST_MrnPC_AST_Softwares] FOREIGN KEY([pcOSID])
REFERENCES [dbo].[AST_Softwares] ([SoftwareID])
GO
ALTER TABLE [dbo].[AST_MrnPC] CHECK CONSTRAINT [FK_AST_MrnPC_AST_Softwares]
GO
ALTER TABLE [dbo].[AST_MrnPC]  WITH CHECK ADD  CONSTRAINT [FK_AST_MrnPC_AST_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[AST_Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[AST_MrnPC] CHECK CONSTRAINT [FK_AST_MrnPC_AST_Suppliers]
GO
ALTER TABLE [dbo].[AST_MrnPC] ADD  CONSTRAINT [DF_AST_MRNComputers_MrnDate]  DEFAULT (getdate()) FOR [MrnDate]
GO
ALTER TABLE [dbo].[AST_MrnPC] ADD  CONSTRAINT [DF_AST_MrnPC_MrnDescription]  DEFAULT ('') FOR [MrnDescription]
GO
ALTER TABLE [dbo].[AST_MrnPC] ADD  CONSTRAINT [DF_AST_Computers_SupplierID]  DEFAULT ((1)) FOR [SupplierID]
GO
ALTER TABLE [dbo].[AST_MrnPC] ADD  CONSTRAINT [DF_AST_Computers_Keyboard]  DEFAULT ((1)) FOR [Keyboard]
GO
ALTER TABLE [dbo].[AST_MrnPC] ADD  CONSTRAINT [DF_AST_Computers_Mouse]  DEFAULT ((1)) FOR [Mouse]
GO
ALTER TABLE [dbo].[AST_MrnPC] ADD  CONSTRAINT [DF_AST_Computers_FloppyDrive]  DEFAULT ((0)) FOR [FloppyDrive]
GO
ALTER TABLE [dbo].[AST_MrnPC] ADD  CONSTRAINT [DF_AST_Computers_PurchasedQuantity]  DEFAULT ((0)) FOR [PurchasedQuantity]
GO
ALTER TABLE [dbo].[AST_MrnPC] ADD  CONSTRAINT [DF_AST_Computers_IssuedQuantity]  DEFAULT ((0)) FOR [IssuedQuantity]
GO
ALTER TABLE [dbo].[AST_MrnPC] ADD  CONSTRAINT [DF_AST_Computers_WriteoffQuantity]  DEFAULT ((0)) FOR [WriteoffQuantity]
GO
ALTER TABLE [dbo].[AST_MrnPC] ADD  CONSTRAINT [DF_AST_MRNComputers_NoOfCPUs]  DEFAULT ((0)) FOR [NoOfCPUs]
GO
ALTER TABLE [dbo].[AST_MrnPC] ADD  CONSTRAINT [DF_AST_MRNComputers_CPUModel]  DEFAULT ('') FOR [CPUModel]
GO
ALTER TABLE [dbo].[AST_MrnPC] ADD  CONSTRAINT [DF_AST_MRNComputers_NoOfHDDs]  DEFAULT ((0)) FOR [NoOfHDDs]
GO
ALTER TABLE [dbo].[AST_MrnPC] ADD  CONSTRAINT [DF_AST_MRNComputers_TotalHDDGB]  DEFAULT ((0)) FOR [TotalHDDGB]
GO
ALTER TABLE [dbo].[AST_MrnPC] ADD  CONSTRAINT [DF_AST_MRNComputers_HDDDetails]  DEFAULT ('') FOR [HDDDetails]
GO
ALTER TABLE [dbo].[AST_MrnPC] ADD  CONSTRAINT [DF_AST_MRNComputers_NoOfCDROMs]  DEFAULT ((0)) FOR [NoOfCDROMs]
GO
ALTER TABLE [dbo].[AST_MrnPC] ADD  CONSTRAINT [DF_AST_MRNComputers_CDRomDetails]  DEFAULT ('') FOR [CDRomDetails]
GO
ALTER TABLE [dbo].[AST_MrnPC] ADD  CONSTRAINT [DF_AST_MRNComputers_pcOSDetails]  DEFAULT ('') FOR [pcOSDetails]
GO
ALTER TABLE [dbo].[AST_MrnPC] ADD  CONSTRAINT [DF_AST_MRNComputers_Remarks]  DEFAULT ('') FOR [Remarks]
GO
