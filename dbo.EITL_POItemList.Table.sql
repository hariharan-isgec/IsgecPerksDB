USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EITL_POItemList](
	[SerialNo] [int] NOT NULL,
	[ItemLineNo] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
	[UOM] [nvarchar](3) NULL,
	[Quantity] [int] NULL,
	[WeightInKG] [decimal](18, 2) NULL,
	[DocumentLineNo] [int] NULL,
	[ReadyToDespatch] [bit] NOT NULL,
	[Despatched] [bit] NOT NULL,
	[DespatchDate] [datetime] NULL,
	[VR_ExecutionNo] [int] NULL,
	[QuantityReceipt] [int] NULL,
	[WeightInKGReceipt] [decimal](18, 2) NULL,
	[MaterialStateID] [int] NULL,
	[ReceivedBy] [nvarchar](8) NULL,
	[ReceivedOn] [datetime] NULL,
	[ItemStatusID] [int] NULL,
 CONSTRAINT [PK_EITL_POItemList] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC,
	[ItemLineNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EITL_POItemList]  WITH CHECK ADD  CONSTRAINT [FK_EITL_POItemList_DocumentLineNo] FOREIGN KEY([SerialNo], [DocumentLineNo])
REFERENCES [dbo].[EITL_PODocumentList] ([SerialNo], [DocumentLineNo])
GO
ALTER TABLE [dbo].[EITL_POItemList] CHECK CONSTRAINT [FK_EITL_POItemList_DocumentLineNo]
GO
ALTER TABLE [dbo].[EITL_POItemList]  WITH CHECK ADD  CONSTRAINT [FK_EITL_POItemList_ItemStatusID] FOREIGN KEY([ItemStatusID])
REFERENCES [dbo].[EITL_POItemStatus] ([StatusID])
GO
ALTER TABLE [dbo].[EITL_POItemList] CHECK CONSTRAINT [FK_EITL_POItemList_ItemStatusID]
GO
ALTER TABLE [dbo].[EITL_POItemList]  WITH CHECK ADD  CONSTRAINT [FK_EITL_POItemList_MaterialStateID] FOREIGN KEY([MaterialStateID])
REFERENCES [dbo].[EITL_MaterialState] ([StateID])
GO
ALTER TABLE [dbo].[EITL_POItemList] CHECK CONSTRAINT [FK_EITL_POItemList_MaterialStateID]
GO
ALTER TABLE [dbo].[EITL_POItemList]  WITH CHECK ADD  CONSTRAINT [FK_EITL_POItemList_ReceivedBy] FOREIGN KEY([ReceivedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[EITL_POItemList] CHECK CONSTRAINT [FK_EITL_POItemList_ReceivedBy]
GO
ALTER TABLE [dbo].[EITL_POItemList]  WITH CHECK ADD  CONSTRAINT [FK_EITL_POItemList_SerialNo] FOREIGN KEY([SerialNo])
REFERENCES [dbo].[EITL_POList] ([SerialNo])
GO
ALTER TABLE [dbo].[EITL_POItemList] CHECK CONSTRAINT [FK_EITL_POItemList_SerialNo]
GO
ALTER TABLE [dbo].[EITL_POItemList]  WITH CHECK ADD  CONSTRAINT [FK_EITL_POItemList_UOM] FOREIGN KEY([UOM])
REFERENCES [dbo].[EITL_Units] ([UnitID])
GO
ALTER TABLE [dbo].[EITL_POItemList] CHECK CONSTRAINT [FK_EITL_POItemList_UOM]
GO
ALTER TABLE [dbo].[EITL_POItemList] ADD  CONSTRAINT [DF_EITL_POItemList_ReadyToDespatch]  DEFAULT ((0)) FOR [ReadyToDespatch]
GO
ALTER TABLE [dbo].[EITL_POItemList] ADD  CONSTRAINT [DF_EITL_POItemList_Despatched]  DEFAULT ((0)) FOR [Despatched]
GO
ALTER TABLE [dbo].[EITL_POItemList] ADD  CONSTRAINT [DF_EITL_POItemList_QuantityReceipt]  DEFAULT ((0)) FOR [QuantityReceipt]
GO
ALTER TABLE [dbo].[EITL_POItemList] ADD  CONSTRAINT [DF_EITL_POItemList_WeightInKGReceipt]  DEFAULT ((0)) FOR [WeightInKGReceipt]
GO
