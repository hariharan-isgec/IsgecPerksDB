USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_POBOM](
	[SerialNo] [int] NOT NULL,
	[BOMNo] [int] IDENTITY(1,1) NOT NULL,
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
	[QualityClearedQty] [decimal](18, 4) NULL,
 CONSTRAINT [PK_PAK_POBOM] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC,
	[BOMNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_POBOM]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBOM_AcceptedBy] FOREIGN KEY([AcceptedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[PAK_POBOM] CHECK CONSTRAINT [FK_PAK_POBOM_AcceptedBy]
GO
ALTER TABLE [dbo].[PAK_POBOM]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBOM_DivisionID] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[PAK_Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[PAK_POBOM] CHECK CONSTRAINT [FK_PAK_POBOM_DivisionID]
GO
ALTER TABLE [dbo].[PAK_POBOM]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBOM_DocumentNo] FOREIGN KEY([DocumentNo])
REFERENCES [dbo].[PAK_Documents] ([DocumentNo])
GO
ALTER TABLE [dbo].[PAK_POBOM] CHECK CONSTRAINT [FK_PAK_POBOM_DocumentNo]
GO
ALTER TABLE [dbo].[PAK_POBOM]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBOM_ElementID] FOREIGN KEY([ElementID])
REFERENCES [dbo].[PAK_Elements] ([ElementID])
GO
ALTER TABLE [dbo].[PAK_POBOM] CHECK CONSTRAINT [FK_PAK_POBOM_ElementID]
GO
ALTER TABLE [dbo].[PAK_POBOM]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBOM_FreezedBy] FOREIGN KEY([FreezedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[PAK_POBOM] CHECK CONSTRAINT [FK_PAK_POBOM_FreezedBy]
GO
ALTER TABLE [dbo].[PAK_POBOM]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBOM_SerialNo] FOREIGN KEY([SerialNo])
REFERENCES [dbo].[PAK_PO] ([SerialNo])
GO
ALTER TABLE [dbo].[PAK_POBOM] CHECK CONSTRAINT [FK_PAK_POBOM_SerialNo]
GO
ALTER TABLE [dbo].[PAK_POBOM]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBOM_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[PAK_POBOMStatus] ([StatusID])
GO
ALTER TABLE [dbo].[PAK_POBOM] CHECK CONSTRAINT [FK_PAK_POBOM_StatusID]
GO
ALTER TABLE [dbo].[PAK_POBOM]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBOM_UOMQuantity] FOREIGN KEY([UOMQuantity])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[PAK_POBOM] CHECK CONSTRAINT [FK_PAK_POBOM_UOMQuantity]
GO
ALTER TABLE [dbo].[PAK_POBOM]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBOM_UOMWeight] FOREIGN KEY([UOMWeight])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[PAK_POBOM] CHECK CONSTRAINT [FK_PAK_POBOM_UOMWeight]
GO
ALTER TABLE [dbo].[PAK_POBOM] ADD  CONSTRAINT [DF_PAK_POBOM_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[PAK_POBOM] ADD  CONSTRAINT [DF_PAK_POBOM_WeightPerUnit]  DEFAULT ((0)) FOR [WeightPerUnit]
GO
ALTER TABLE [dbo].[PAK_POBOM] ADD  CONSTRAINT [DF_PAK_POBOM_SupplierQuantity1]  DEFAULT ((0)) FOR [ISGECQuantity]
GO
ALTER TABLE [dbo].[PAK_POBOM] ADD  CONSTRAINT [DF_PAK_POBOM_SupplierWeightPerUnit1]  DEFAULT ((0)) FOR [ISGECWeightPerUnit]
GO
ALTER TABLE [dbo].[PAK_POBOM] ADD  CONSTRAINT [DF_Table_1_Quantity1]  DEFAULT ((0)) FOR [SupplierQuantity]
GO
ALTER TABLE [dbo].[PAK_POBOM] ADD  CONSTRAINT [DF_Table_1_WeightPerUnit1]  DEFAULT ((0)) FOR [SupplierWeightPerUnit]
GO
ALTER TABLE [dbo].[PAK_POBOM] ADD  CONSTRAINT [DF_PAK_POBOM_Accepted]  DEFAULT ((0)) FOR [Accepted]
GO
ALTER TABLE [dbo].[PAK_POBOM] ADD  CONSTRAINT [DF_PAK_POBOM_Accepted1]  DEFAULT ((0)) FOR [Freezed]
GO
ALTER TABLE [dbo].[PAK_POBOM] ADD  CONSTRAINT [DF_PAK_POBOM_Changed]  DEFAULT ((0)) FOR [Changed]
GO
ALTER TABLE [dbo].[PAK_POBOM] ADD  CONSTRAINT [DF_PAK_POBOM_SupplierCreated]  DEFAULT ((0)) FOR [CreatedBySupplier]
GO
ALTER TABLE [dbo].[PAK_POBOM] ADD  CONSTRAINT [DF_PAK_POBOM_CreatedBySupplier1]  DEFAULT ((0)) FOR [ChangedBySupplier]
GO
ALTER TABLE [dbo].[PAK_POBOM] ADD  CONSTRAINT [DF_PAK_POBOM_AcceptedBySupplier]  DEFAULT ((0)) FOR [AcceptedBySupplier]
GO
ALTER TABLE [dbo].[PAK_POBOM] ADD  CONSTRAINT [DF_PAK_POBOM_FreezedBySupplier]  DEFAULT ((0)) FOR [FreezedBySupplier]
GO
ALTER TABLE [dbo].[PAK_POBOM] ADD  CONSTRAINT [DF_PAK_POBOM_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[PAK_POBOM] ADD  CONSTRAINT [DF_PAK_POBOM_Root]  DEFAULT ((0)) FOR [Root]
GO
ALTER TABLE [dbo].[PAK_POBOM] ADD  CONSTRAINT [DF_PAK_POBOM_Middle]  DEFAULT ((0)) FOR [Middle]
GO
ALTER TABLE [dbo].[PAK_POBOM] ADD  CONSTRAINT [DF_PAK_POBOM_Bottom]  DEFAULT ((0)) FOR [Bottom]
GO
ALTER TABLE [dbo].[PAK_POBOM] ADD  CONSTRAINT [DF_PAK_POBOM_Free]  DEFAULT ((0)) FOR [Free]
GO
ALTER TABLE [dbo].[PAK_POBOM] ADD  CONSTRAINT [DF_PAK_POBOM_ItemLevel]  DEFAULT ((0)) FOR [ItemLevel]
GO
