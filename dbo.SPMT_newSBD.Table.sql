USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPMT_newSBD](
	[IRNo] [int] NOT NULL,
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[ItemDescription] [nvarchar](100) NULL,
	[BillType] [int] NULL,
	[HSNSACCode] [nvarchar](20) NULL,
	[UOM] [nvarchar](3) NULL,
	[Quantity] [decimal](18, 2) NULL,
	[Currency] [nvarchar](50) NULL,
	[ConversionFactorINR] [decimal](18, 6) NULL,
	[BasicValue] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[ServiceCharge] [decimal](18, 2) NULL,
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
	[TotalGSTINR] [decimal](18, 2) NULL,
	[TotalAmountINR] [decimal](18, 2) NULL,
	[ProjectID] [nvarchar](6) NULL,
	[ElementID] [nvarchar](8) NULL,
	[EmployeeID] [nvarchar](8) NULL,
	[DepartmentID] [nvarchar](6) NULL,
	[CostCenterID] [nvarchar](6) NULL,
	[UploadBatchNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_SPMT_newSBD] PRIMARY KEY CLUSTERED 
(
	[IRNo] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SPMT_newSBD]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_newSBD_BillType] FOREIGN KEY([BillType])
REFERENCES [dbo].[SPMT_BillTypes] ([BillType])
GO
ALTER TABLE [dbo].[SPMT_newSBD] CHECK CONSTRAINT [FK_SPMT_newSBD_BillType]
GO
ALTER TABLE [dbo].[SPMT_newSBD]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_newSBD_CostCenterID] FOREIGN KEY([CostCenterID])
REFERENCES [dbo].[SPMT_CostCenters] ([CostCenterID])
GO
ALTER TABLE [dbo].[SPMT_newSBD] CHECK CONSTRAINT [FK_SPMT_newSBD_CostCenterID]
GO
ALTER TABLE [dbo].[SPMT_newSBD]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_newSBD_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[HRM_Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[SPMT_newSBD] CHECK CONSTRAINT [FK_SPMT_newSBD_DepartmentID]
GO
ALTER TABLE [dbo].[SPMT_newSBD]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_newSBD_ElementID] FOREIGN KEY([ElementID])
REFERENCES [dbo].[IDM_WBS] ([WBSID])
GO
ALTER TABLE [dbo].[SPMT_newSBD] CHECK CONSTRAINT [FK_SPMT_newSBD_ElementID]
GO
ALTER TABLE [dbo].[SPMT_newSBD]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_newSBD_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[SPMT_newSBD] CHECK CONSTRAINT [FK_SPMT_newSBD_EmployeeID]
GO
ALTER TABLE [dbo].[SPMT_newSBD]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_newSBD_HSNSACCode] FOREIGN KEY([BillType], [HSNSACCode])
REFERENCES [dbo].[SPMT_HSNSACCodes] ([BillType], [HSNSACCode])
GO
ALTER TABLE [dbo].[SPMT_newSBD] CHECK CONSTRAINT [FK_SPMT_newSBD_HSNSACCode]
GO
ALTER TABLE [dbo].[SPMT_newSBD]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_newSBD_IRNo] FOREIGN KEY([IRNo])
REFERENCES [dbo].[SPMT_newSBH] ([IRNo])
GO
ALTER TABLE [dbo].[SPMT_newSBD] CHECK CONSTRAINT [FK_SPMT_newSBD_IRNo]
GO
ALTER TABLE [dbo].[SPMT_newSBD]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_newSBD_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[SPMT_newSBD] CHECK CONSTRAINT [FK_SPMT_newSBD_ProjectID]
GO
ALTER TABLE [dbo].[SPMT_newSBD]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_newSBD_UOM] FOREIGN KEY([UOM])
REFERENCES [dbo].[SPMT_ERPUnits] ([UOM])
GO
ALTER TABLE [dbo].[SPMT_newSBD] CHECK CONSTRAINT [FK_SPMT_newSBD_UOM]
GO
