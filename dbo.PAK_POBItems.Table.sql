USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_POBItems](
	[SerialNo] [int] NOT NULL,
	[BOMNo] [int] NOT NULL,
	[ItemNo] [int] NOT NULL,
	[ItemCode] [nvarchar](50) NULL,
	[SupplierItemCode] [nvarchar](50) NULL,
	[ItemDescription] [nvarchar](100) NULL,
	[DivisionID] [int] NULL,
	[ElementID] [nvarchar](8) NULL,
	[UOMQuantity] [int] NULL,
	[Quantity] [decimal](18, 4) NOT NULL,
	[UOMWeight] [int] NULL,
	[WeightPerUnit] [decimal](18, 4) NOT NULL,
	[DocumentNo] [int] NULL,
	[ParentItemNo] [int] NULL,
	[StatusID] [int] NULL,
	[ISGECRemarks] [nvarchar](500) NULL,
	[SupplierRemarks] [nvarchar](500) NULL,
	[ISGECQuantity] [decimal](18, 4) NOT NULL,
	[ISGECWeightPerUnit] [decimal](18, 4) NOT NULL,
	[SupplierQuantity] [decimal](18, 4) NOT NULL,
	[SupplierWeightPerUnit] [decimal](18, 4) NOT NULL,
	[Accepted] [bit] NOT NULL,
	[AcceptedBy] [nvarchar](8) NULL,
	[AcceptedOn] [datetime] NULL,
	[Freezed] [bit] NOT NULL,
	[FreezedBy] [nvarchar](8) NULL,
	[FreezedOn] [datetime] NULL,
	[Changed] [bit] NOT NULL,
	[CreatedBySupplier] [bit] NOT NULL,
	[ChangedBySupplier] [bit] NOT NULL,
	[AcceptedBySupplier] [bit] NOT NULL,
	[FreezedBySupplier] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[Root] [bit] NOT NULL,
	[Middle] [bit] NOT NULL,
	[Bottom] [bit] NOT NULL,
	[Free] [bit] NOT NULL,
	[ItemLevel] [int] NOT NULL,
	[Prefix] [nvarchar](1000) NULL,
	[QuantityToPack] [decimal](18, 4) NOT NULL,
	[TotalWeightToPack] [decimal](18, 4) NOT NULL,
	[QuantityToDespatch] [decimal](18, 4) NOT NULL,
	[TotalWeightToDespatch] [decimal](18, 4) NOT NULL,
	[QuantityDespatched] [decimal](18, 4) NOT NULL,
	[TotalWeightDespatched] [decimal](18, 4) NOT NULL,
	[QuantityReceived] [decimal](18, 4) NOT NULL,
	[TotalWeightReceived] [decimal](18, 4) NOT NULL,
	[QualityClearedQty] [decimal](18, 4) NOT NULL,
	[TotalWeight] [decimal](18, 4) NOT NULL,
	[QuantityReceivedAtPort] [decimal](18, 4) NOT NULL,
	[TotalWeightReceivedAtPort] [decimal](18, 4) NOT NULL,
	[QuantityDespatchedFromPort] [decimal](18, 4) NOT NULL,
	[TotalWeightDespatchedFromPort] [decimal](18, 4) NOT NULL,
	[QuantityDespatchedToPort] [decimal](18, 4) NOT NULL,
	[TotalWeightDespatchedToPort] [decimal](18, 4) NOT NULL,
	[QualityClearedQtyStage] [decimal](18, 4) NOT NULL,
	[ItemReference] [nvarchar](200) NULL,
	[SubItem] [nvarchar](9) NULL,
	[SubItem2] [nvarchar](150) NULL,
	[SubItem3] [nvarchar](150) NULL,
	[SubItem4] [nvarchar](150) NULL,
 CONSTRAINT [PK_PAK_POBItems] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC,
	[BOMNo] ASC,
	[ItemNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PAK_POBItems] ON [dbo].[PAK_POBItems] 
(
	[SerialNo] ASC,
	[BOMNo] ASC,
	[ParentItemNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PAK_POBItems_1] ON [dbo].[PAK_POBItems] 
(
	[DivisionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_POBItems]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBItems_AcceptedBy] FOREIGN KEY([AcceptedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[PAK_POBItems] CHECK CONSTRAINT [FK_PAK_POBItems_AcceptedBy]
GO
ALTER TABLE [dbo].[PAK_POBItems]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBItems_DivisionID] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[PAK_Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[PAK_POBItems] CHECK CONSTRAINT [FK_PAK_POBItems_DivisionID]
GO
ALTER TABLE [dbo].[PAK_POBItems]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBItems_DocumentNo] FOREIGN KEY([DocumentNo])
REFERENCES [dbo].[PAK_Documents] ([DocumentNo])
GO
ALTER TABLE [dbo].[PAK_POBItems] CHECK CONSTRAINT [FK_PAK_POBItems_DocumentNo]
GO
ALTER TABLE [dbo].[PAK_POBItems]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBItems_ElementID] FOREIGN KEY([ElementID])
REFERENCES [dbo].[PAK_Elements] ([ElementID])
GO
ALTER TABLE [dbo].[PAK_POBItems] CHECK CONSTRAINT [FK_PAK_POBItems_ElementID]
GO
ALTER TABLE [dbo].[PAK_POBItems]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBItems_FreezedBy] FOREIGN KEY([FreezedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[PAK_POBItems] CHECK CONSTRAINT [FK_PAK_POBItems_FreezedBy]
GO
ALTER TABLE [dbo].[PAK_POBItems]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBItems_PAK_POBOM] FOREIGN KEY([SerialNo], [BOMNo])
REFERENCES [dbo].[PAK_POBOM] ([SerialNo], [BOMNo])
GO
ALTER TABLE [dbo].[PAK_POBItems] CHECK CONSTRAINT [FK_PAK_POBItems_PAK_POBOM]
GO
ALTER TABLE [dbo].[PAK_POBItems]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBItems_ParentItemNo] FOREIGN KEY([SerialNo], [BOMNo], [ParentItemNo])
REFERENCES [dbo].[PAK_POBItems] ([SerialNo], [BOMNo], [ItemNo])
GO
ALTER TABLE [dbo].[PAK_POBItems] CHECK CONSTRAINT [FK_PAK_POBItems_ParentItemNo]
GO
ALTER TABLE [dbo].[PAK_POBItems]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBItems_SerialNo] FOREIGN KEY([SerialNo])
REFERENCES [dbo].[PAK_PO] ([SerialNo])
GO
ALTER TABLE [dbo].[PAK_POBItems] CHECK CONSTRAINT [FK_PAK_POBItems_SerialNo]
GO
ALTER TABLE [dbo].[PAK_POBItems]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBItems_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[PAK_POBOMStatus] ([StatusID])
GO
ALTER TABLE [dbo].[PAK_POBItems] CHECK CONSTRAINT [FK_PAK_POBItems_StatusID]
GO
ALTER TABLE [dbo].[PAK_POBItems]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBItems_UOMQuantity] FOREIGN KEY([UOMQuantity])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[PAK_POBItems] CHECK CONSTRAINT [FK_PAK_POBItems_UOMQuantity]
GO
ALTER TABLE [dbo].[PAK_POBItems]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBItems_UOMWeight] FOREIGN KEY([UOMWeight])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[PAK_POBItems] CHECK CONSTRAINT [FK_PAK_POBItems_UOMWeight]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_WeightPerUnit]  DEFAULT ((0)) FOR [WeightPerUnit]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_SupplierQuantity1]  DEFAULT ((0)) FOR [ISGECQuantity]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_SupplierWeightPerUnit1]  DEFAULT ((0)) FOR [ISGECWeightPerUnit]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_SupplierQuantity]  DEFAULT ((0)) FOR [SupplierQuantity]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_SupplierWeightPerUnit]  DEFAULT ((0)) FOR [SupplierWeightPerUnit]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_Accepted]  DEFAULT ((0)) FOR [Accepted]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_Accepted1]  DEFAULT ((0)) FOR [Freezed]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_Changed]  DEFAULT ((0)) FOR [Changed]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_SupplierCreated]  DEFAULT ((0)) FOR [CreatedBySupplier]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_CreatedBySupplier1]  DEFAULT ((0)) FOR [ChangedBySupplier]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_AcceptedBySupplier]  DEFAULT ((0)) FOR [AcceptedBySupplier]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_FreezedBySupplier]  DEFAULT ((0)) FOR [FreezedBySupplier]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_Root]  DEFAULT ((0)) FOR [Root]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_Middle]  DEFAULT ((0)) FOR [Middle]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_Bottom]  DEFAULT ((0)) FOR [Bottom]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_Free]  DEFAULT ((0)) FOR [Free]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_ItemLevel]  DEFAULT ((0)) FOR [ItemLevel]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_QuantityToDespatch1]  DEFAULT ((0)) FOR [QuantityToPack]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_TotalWeightToDespatch1]  DEFAULT ((0)) FOR [TotalWeightToPack]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_Quantity1]  DEFAULT ((0)) FOR [QuantityToDespatch]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_Quantity2]  DEFAULT ((0)) FOR [TotalWeightToDespatch]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_Quantity3]  DEFAULT ((0)) FOR [QuantityDespatched]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_Quantity4]  DEFAULT ((0)) FOR [TotalWeightDespatched]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_Quantity5]  DEFAULT ((0)) FOR [QuantityReceived]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_Quantity6]  DEFAULT ((0)) FOR [TotalWeightReceived]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_QualityClearedQty]  DEFAULT ((0)) FOR [QualityClearedQty]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_QualityClearedQty1]  DEFAULT ((0)) FOR [TotalWeight]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_QualityClearedQty2]  DEFAULT ((0)) FOR [QuantityReceivedAtPort]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_QualityClearedQty3]  DEFAULT ((0)) FOR [TotalWeightReceivedAtPort]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_QualityClearedQty4]  DEFAULT ((0)) FOR [QuantityDespatchedFromPort]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_QualityClearedQty5]  DEFAULT ((0)) FOR [TotalWeightDespatchedFromPort]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_QualityClearedQty6]  DEFAULT ((0)) FOR [QuantityDespatchedToPort]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_QualityClearedQty7]  DEFAULT ((0)) FOR [TotalWeightDespatchedToPort]
GO
ALTER TABLE [dbo].[PAK_POBItems] ADD  CONSTRAINT [DF_PAK_POBItems_QualityClearedQty8]  DEFAULT ((0)) FOR [QualityClearedQtyStage]
GO
