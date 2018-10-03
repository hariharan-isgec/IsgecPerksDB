USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_PkgListD](
	[SerialNo] [int] NOT NULL,
	[PkgNo] [int] NOT NULL,
	[BOMNo] [int] NOT NULL,
	[ItemNo] [int] NOT NULL,
	[UOMQuantity] [int] NULL,
	[Quantity] [decimal](18, 4) NOT NULL,
	[UOMWeight] [int] NULL,
	[WeightPerUnit] [decimal](18, 4) NOT NULL,
	[TotalWeight] [decimal](18, 4) NOT NULL,
	[PackTypeID] [int] NULL,
	[PackingMark] [nvarchar](50) NULL,
	[PackLength] [decimal](18, 2) NOT NULL,
	[PackWidth] [decimal](18, 2) NOT NULL,
	[PackHeight] [decimal](18, 2) NOT NULL,
	[UOMPack] [int] NULL,
	[Remarks] [nvarchar](100) NULL,
	[QuantityBalance] [decimal](18, 4) NOT NULL,
	[TotalWeightBalance] [decimal](18, 4) NOT NULL,
	[QuantityReceived] [decimal](18, 4) NOT NULL,
	[TotalWeightReceived] [decimal](18, 4) NOT NULL,
	[DocumentNo] [nvarchar](50) NULL,
	[DocumentRevision] [nvarchar](10) NULL,
 CONSTRAINT [PK_PAK_PkgListD] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC,
	[PkgNo] ASC,
	[BOMNo] ASC,
	[ItemNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_PkgListD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PkgListD_BOMNo] FOREIGN KEY([SerialNo], [BOMNo])
REFERENCES [dbo].[PAK_POBOM] ([SerialNo], [BOMNo])
GO
ALTER TABLE [dbo].[PAK_PkgListD] CHECK CONSTRAINT [FK_PAK_PkgListD_BOMNo]
GO
ALTER TABLE [dbo].[PAK_PkgListD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PkgListD_ItemNo] FOREIGN KEY([SerialNo], [BOMNo], [ItemNo])
REFERENCES [dbo].[PAK_POBItems] ([SerialNo], [BOMNo], [ItemNo])
GO
ALTER TABLE [dbo].[PAK_PkgListD] CHECK CONSTRAINT [FK_PAK_PkgListD_ItemNo]
GO
ALTER TABLE [dbo].[PAK_PkgListD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PkgListD_PackTypeID] FOREIGN KEY([PackTypeID])
REFERENCES [dbo].[PAK_PakTypes] ([PackTypeID])
GO
ALTER TABLE [dbo].[PAK_PkgListD] CHECK CONSTRAINT [FK_PAK_PkgListD_PackTypeID]
GO
ALTER TABLE [dbo].[PAK_PkgListD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PkgListD_PkgNo] FOREIGN KEY([SerialNo], [PkgNo])
REFERENCES [dbo].[PAK_PkgListH] ([SerialNo], [PkgNo])
GO
ALTER TABLE [dbo].[PAK_PkgListD] CHECK CONSTRAINT [FK_PAK_PkgListD_PkgNo]
GO
ALTER TABLE [dbo].[PAK_PkgListD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PkgListD_SerialNo] FOREIGN KEY([SerialNo])
REFERENCES [dbo].[PAK_PO] ([SerialNo])
GO
ALTER TABLE [dbo].[PAK_PkgListD] CHECK CONSTRAINT [FK_PAK_PkgListD_SerialNo]
GO
ALTER TABLE [dbo].[PAK_PkgListD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PkgListD_UOMPack] FOREIGN KEY([UOMPack])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[PAK_PkgListD] CHECK CONSTRAINT [FK_PAK_PkgListD_UOMPack]
GO
ALTER TABLE [dbo].[PAK_PkgListD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PkgListD_UOMQuantity] FOREIGN KEY([UOMQuantity])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[PAK_PkgListD] CHECK CONSTRAINT [FK_PAK_PkgListD_UOMQuantity]
GO
ALTER TABLE [dbo].[PAK_PkgListD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PkgListD_UOMWeight] FOREIGN KEY([UOMWeight])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[PAK_PkgListD] CHECK CONSTRAINT [FK_PAK_PkgListD_UOMWeight]
GO
ALTER TABLE [dbo].[PAK_PkgListD] ADD  CONSTRAINT [DF_PAK_PkgListD_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[PAK_PkgListD] ADD  CONSTRAINT [DF_PAK_PkgListD_WeightPerUnit]  DEFAULT ((0)) FOR [WeightPerUnit]
GO
ALTER TABLE [dbo].[PAK_PkgListD] ADD  CONSTRAINT [DF_PAK_PkgListD_WeightPerUnit1]  DEFAULT ((0)) FOR [TotalWeight]
GO
ALTER TABLE [dbo].[PAK_PkgListD] ADD  CONSTRAINT [DF_Table_1_WeightPerUnit1_1]  DEFAULT ((0)) FOR [PackLength]
GO
ALTER TABLE [dbo].[PAK_PkgListD] ADD  CONSTRAINT [DF_Table_1_WeightPerUnit1_2]  DEFAULT ((0)) FOR [PackWidth]
GO
ALTER TABLE [dbo].[PAK_PkgListD] ADD  CONSTRAINT [DF_Table_1_WeightPerUnit1_3]  DEFAULT ((0)) FOR [PackHeight]
GO
ALTER TABLE [dbo].[PAK_PkgListD] ADD  CONSTRAINT [DF_Table_1_QuantityDespatched]  DEFAULT ((0)) FOR [QuantityBalance]
GO
ALTER TABLE [dbo].[PAK_PkgListD] ADD  CONSTRAINT [DF_Table_1_TotalWeightDespatched]  DEFAULT ((0)) FOR [TotalWeightBalance]
GO
ALTER TABLE [dbo].[PAK_PkgListD] ADD  CONSTRAINT [DF_PAK_PkgListD_QuantityReceived]  DEFAULT ((0)) FOR [QuantityReceived]
GO
ALTER TABLE [dbo].[PAK_PkgListD] ADD  CONSTRAINT [DF_PAK_PkgListD_TotalWeightReceived]  DEFAULT ((0)) FOR [TotalWeightReceived]
GO
