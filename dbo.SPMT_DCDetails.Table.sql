USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPMT_DCDetails](
	[ChallanID] [nvarchar](20) NOT NULL,
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[ItemDescription] [nvarchar](250) NULL,
	[BillTypeID] [int] NULL,
	[HSNSACCode] [nvarchar](20) NULL,
	[UOM] [nvarchar](3) NULL,
	[Quantity] [decimal](18, 2) NULL,
	[Price] [decimal](18, 2) NULL,
	[AssessableValue] [decimal](18, 2) NULL,
	[IGSTRate] [decimal](18, 2) NULL,
	[IGSTAmount] [decimal](18, 2) NULL,
	[SGSTRate] [decimal](18, 2) NULL,
	[SGSTAmount] [decimal](18, 2) NULL,
	[CGSTRate] [decimal](18, 2) NULL,
	[CGSTAmount] [decimal](18, 2) NULL,
	[CessRate] [decimal](18, 2) NULL,
	[CessAmount] [decimal](18, 2) NULL,
	[TotalGST] [decimal](18, 2) NULL,
	[TotalAmount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_SPMT_DCDetails] PRIMARY KEY CLUSTERED 
(
	[ChallanID] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SPMT_DCDetails]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCDetails_BillTypeID] FOREIGN KEY([BillTypeID])
REFERENCES [dbo].[SPMT_BillTypes] ([BillType])
GO
ALTER TABLE [dbo].[SPMT_DCDetails] CHECK CONSTRAINT [FK_SPMT_DCDetails_BillTypeID]
GO
ALTER TABLE [dbo].[SPMT_DCDetails]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCDetails_ChallanID] FOREIGN KEY([ChallanID])
REFERENCES [dbo].[SPMT_DCHeader] ([ChallanID])
GO
ALTER TABLE [dbo].[SPMT_DCDetails] CHECK CONSTRAINT [FK_SPMT_DCDetails_ChallanID]
GO
ALTER TABLE [dbo].[SPMT_DCDetails]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCDetails_HSNSACCode] FOREIGN KEY([BillTypeID], [HSNSACCode])
REFERENCES [dbo].[SPMT_HSNSACCodes] ([BillType], [HSNSACCode])
GO
ALTER TABLE [dbo].[SPMT_DCDetails] CHECK CONSTRAINT [FK_SPMT_DCDetails_HSNSACCode]
GO
ALTER TABLE [dbo].[SPMT_DCDetails]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCDetails_UOM] FOREIGN KEY([UOM])
REFERENCES [dbo].[SPMT_ERPUnits] ([UOM])
GO
ALTER TABLE [dbo].[SPMT_DCDetails] CHECK CONSTRAINT [FK_SPMT_DCDetails_UOM]
GO
