USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_QCListD](
	[SerialNo] [int] NOT NULL,
	[QCLNo] [int] NOT NULL,
	[BOMNo] [int] NOT NULL,
	[ItemNo] [int] NOT NULL,
	[UOMQuantity] [int] NULL,
	[Quantity] [decimal](18, 4) NOT NULL,
	[UOMWeight] [int] NULL,
	[WeightPerUnit] [decimal](18, 4) NOT NULL,
	[TotalWeight] [decimal](18, 4) NOT NULL,
	[QualityClearedQty] [decimal](18, 4) NULL,
	[QualityClearedWt] [decimal](18, 4) NOT NULL,
	[Remarks] [nvarchar](500) NULL,
	[ClearedBy] [nvarchar](8) NULL,
	[ClearedOn] [datetime] NULL,
	[InspectionStageID] [int] NULL,
 CONSTRAINT [PK_PAK_QCListD] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC,
	[QCLNo] ASC,
	[BOMNo] ASC,
	[ItemNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_QCListD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_QCListD_BOMNo] FOREIGN KEY([SerialNo], [BOMNo])
REFERENCES [dbo].[PAK_POBOM] ([SerialNo], [BOMNo])
GO
ALTER TABLE [dbo].[PAK_QCListD] CHECK CONSTRAINT [FK_PAK_QCListD_BOMNo]
GO
ALTER TABLE [dbo].[PAK_QCListD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_QCListD_CreatedBy] FOREIGN KEY([ClearedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[PAK_QCListD] CHECK CONSTRAINT [FK_PAK_QCListD_CreatedBy]
GO
ALTER TABLE [dbo].[PAK_QCListD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_QCListD_InspectionStageID] FOREIGN KEY([InspectionStageID])
REFERENCES [dbo].[QCM_InspectionStages] ([InspectionStageID])
GO
ALTER TABLE [dbo].[PAK_QCListD] CHECK CONSTRAINT [FK_PAK_QCListD_InspectionStageID]
GO
ALTER TABLE [dbo].[PAK_QCListD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_QCListD_ItemNo] FOREIGN KEY([SerialNo], [BOMNo], [ItemNo])
REFERENCES [dbo].[PAK_POBItems] ([SerialNo], [BOMNo], [ItemNo])
GO
ALTER TABLE [dbo].[PAK_QCListD] CHECK CONSTRAINT [FK_PAK_QCListD_ItemNo]
GO
ALTER TABLE [dbo].[PAK_QCListD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_QCListD_QCLNo] FOREIGN KEY([SerialNo], [QCLNo])
REFERENCES [dbo].[PAK_QCListH] ([SerialNo], [QCLNo])
GO
ALTER TABLE [dbo].[PAK_QCListD] CHECK CONSTRAINT [FK_PAK_QCListD_QCLNo]
GO
ALTER TABLE [dbo].[PAK_QCListD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_QCListD_SerialNo] FOREIGN KEY([SerialNo])
REFERENCES [dbo].[PAK_PO] ([SerialNo])
GO
ALTER TABLE [dbo].[PAK_QCListD] CHECK CONSTRAINT [FK_PAK_QCListD_SerialNo]
GO
ALTER TABLE [dbo].[PAK_QCListD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_QCListD_UOMQuantity] FOREIGN KEY([UOMQuantity])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[PAK_QCListD] CHECK CONSTRAINT [FK_PAK_QCListD_UOMQuantity]
GO
ALTER TABLE [dbo].[PAK_QCListD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_QCListD_UOMWeight] FOREIGN KEY([UOMWeight])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[PAK_QCListD] CHECK CONSTRAINT [FK_PAK_QCListD_UOMWeight]
GO
ALTER TABLE [dbo].[PAK_QCListD] ADD  CONSTRAINT [DF_PAK_QCListD_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[PAK_QCListD] ADD  CONSTRAINT [DF_PAK_QCListD_WeightPerUnit]  DEFAULT ((0)) FOR [WeightPerUnit]
GO
ALTER TABLE [dbo].[PAK_QCListD] ADD  CONSTRAINT [DF_PAK_QCListD_TotalWeight]  DEFAULT ((0)) FOR [TotalWeight]
GO
ALTER TABLE [dbo].[PAK_QCListD] ADD  CONSTRAINT [DF_Table_1_QuantityBalance]  DEFAULT ((0)) FOR [QualityClearedQty]
GO
ALTER TABLE [dbo].[PAK_QCListD] ADD  CONSTRAINT [DF_PAK_QCListD_TotalWeight1]  DEFAULT ((0)) FOR [QualityClearedWt]
GO
