USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPMT_SupplierBill](
	[IRNo] [int] IDENTITY(1,1) NOT NULL,
	[TranTypeID] [nvarchar](3) NOT NULL,
	[IRReceivedOn] [datetime] NULL,
	[VendorID] [nvarchar](6) NULL,
	[BillNumber] [nvarchar](50) NOT NULL,
	[BillDate] [datetime] NOT NULL,
	[BillAmount] [decimal](18, 2) NOT NULL,
	[BillRemarks] [nvarchar](500) NULL,
	[BillStatusID] [int] NOT NULL,
	[BillStatusDate] [datetime] NOT NULL,
	[BillStatusUser] [nvarchar](8) NOT NULL,
	[LogisticLinked] [bit] NOT NULL,
	[ApprovedAmount] [decimal](18, 2) NULL,
	[Remarks] [nvarchar](500) NULL,
	[PassedAmount] [decimal](18, 2) NULL,
	[RemarksAC] [nvarchar](500) NULL,
	[ReturnedByAC] [bit] NOT NULL,
	[ReasonID] [int] NULL,
	[AdviceNo] [int] NULL,
	[ConcernedHOD] [nvarchar](8) NULL,
	[CostCenter] [nvarchar](50) NULL,
	[ProjectID] [nvarchar](6) NULL,
	[ElementID] [nvarchar](8) NULL,
	[EmployeeID] [nvarchar](8) NULL,
	[DepartmentID] [nvarchar](6) NULL,
	[CostCenterID] [nvarchar](6) NULL,
	[VoucherNo] [int] NULL,
	[DocumentNo] [nvarchar](50) NULL,
	[DocumentLine] [nvarchar](50) NULL,
	[BaaNCompany] [nvarchar](10) NULL,
	[BaaNLedger] [nvarchar](20) NULL,
	[IsgecGSTIN] [int] NULL,
	[BPID] [nvarchar](9) NULL,
	[SupplierGSTIN] [int] NULL,
	[BillType] [int] NULL,
	[HSNSACCode] [nvarchar](20) NULL,
	[UOM] [nvarchar](3) NULL,
	[ShipToState] [nvarchar](2) NULL,
	[Quantity] [decimal](18, 2) NULL,
	[BasicValue] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[ServiceCharge] [decimal](18, 2) NULL,
	[AssessableValue] [decimal](18, 2) NULL,
	[TaxRate] [decimal](18, 2) NULL,
	[TaxAmount] [decimal](18, 2) NULL,
	[CessRate] [decimal](18, 2) NULL,
	[CessAmount] [decimal](18, 2) NULL,
	[TotalGST] [decimal](18, 2) NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[RemarksGST] [nvarchar](250) NULL,
	[Currency] [nvarchar](50) NULL,
	[ConversionFactorINR] [decimal](18, 6) NULL,
	[TotalAmountINR] [decimal](18, 2) NULL,
	[PurchaseType] [nvarchar](50) NULL,
	[IGSTRate] [decimal](18, 2) NULL,
	[IGSTAmount] [decimal](18, 2) NULL,
	[SGSTRate] [decimal](18, 2) NULL,
	[SGSTAmount] [decimal](18, 2) NULL,
	[CGSTRate] [decimal](18, 2) NULL,
	[CGSTAmount] [decimal](18, 2) NULL,
	[BatchNo] [nvarchar](10) NULL,
	[DocNo] [nvarchar](10) NULL,
	[DocLine] [nvarchar](10) NULL,
	[SupplierName] [nvarchar](100) NULL,
	[SupplierGSTINNumber] [nvarchar](50) NULL,
	[UploadBatchNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_SPMT_SupplierBill] PRIMARY KEY CLUSTERED 
(
	[IRNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SPMT_SupplierBill] ON [dbo].[SPMT_SupplierBill] 
(
	[UploadBatchNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SPMT_SupplierBill_1] ON [dbo].[SPMT_SupplierBill] 
(
	[AdviceNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_SupplierBill_aspnet_Users] FOREIGN KEY([BillStatusUser])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] CHECK CONSTRAINT [FK_SPMT_SupplierBill_aspnet_Users]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_SupplierBill_aspnet_Users1] FOREIGN KEY([ConcernedHOD])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] CHECK CONSTRAINT [FK_SPMT_SupplierBill_aspnet_Users1]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_SupplierBill_aspnet_Users2] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] CHECK CONSTRAINT [FK_SPMT_SupplierBill_aspnet_Users2]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_SupplierBill_BillType] FOREIGN KEY([BillType])
REFERENCES [dbo].[SPMT_BillTypes] ([BillType])
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] CHECK CONSTRAINT [FK_SPMT_SupplierBill_BillType]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_SupplierBill_BPID] FOREIGN KEY([BPID])
REFERENCES [dbo].[VR_BusinessPartner] ([BPID])
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] CHECK CONSTRAINT [FK_SPMT_SupplierBill_BPID]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_SupplierBill_HRM_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[HRM_Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] CHECK CONSTRAINT [FK_SPMT_SupplierBill_HRM_Departments]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_SupplierBill_HSNSACCode] FOREIGN KEY([BillType], [HSNSACCode])
REFERENCES [dbo].[SPMT_HSNSACCodes] ([BillType], [HSNSACCode])
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] CHECK CONSTRAINT [FK_SPMT_SupplierBill_HSNSACCode]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_SupplierBill_IDM_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] CHECK CONSTRAINT [FK_SPMT_SupplierBill_IDM_Projects]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_SupplierBill_IDM_WBS] FOREIGN KEY([ElementID])
REFERENCES [dbo].[IDM_WBS] ([WBSID])
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] CHECK CONSTRAINT [FK_SPMT_SupplierBill_IDM_WBS]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_SupplierBill_IsgecGSTIN] FOREIGN KEY([IsgecGSTIN])
REFERENCES [dbo].[SPMT_IsgecGSTIN] ([GSTID])
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] CHECK CONSTRAINT [FK_SPMT_SupplierBill_IsgecGSTIN]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill]  WITH NOCHECK ADD  CONSTRAINT [FK_SPMT_SupplierBill_ShipToState] FOREIGN KEY([ShipToState])
REFERENCES [dbo].[SPMT_ERPStates] ([StateID])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] NOCHECK CONSTRAINT [FK_SPMT_SupplierBill_ShipToState]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_SupplierBill_SPMT_ACVouchers] FOREIGN KEY([VoucherNo])
REFERENCES [dbo].[SPMT_ACVouchers] ([VoucherNo])
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] CHECK CONSTRAINT [FK_SPMT_SupplierBill_SPMT_ACVouchers]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_SupplierBill_SPMT_BillStatus] FOREIGN KEY([BillStatusID])
REFERENCES [dbo].[SPMT_BillStatus] ([BillStatusID])
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] CHECK CONSTRAINT [FK_SPMT_SupplierBill_SPMT_BillStatus]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_SupplierBill_SPMT_CostCenters] FOREIGN KEY([CostCenterID])
REFERENCES [dbo].[SPMT_CostCenters] ([CostCenterID])
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] CHECK CONSTRAINT [FK_SPMT_SupplierBill_SPMT_CostCenters]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_SupplierBill_SPMT_PaymentAdvice] FOREIGN KEY([AdviceNo])
REFERENCES [dbo].[SPMT_PaymentAdvice] ([AdviceNo])
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] CHECK CONSTRAINT [FK_SPMT_SupplierBill_SPMT_PaymentAdvice]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_SupplierBill_SPMT_ReturnReason] FOREIGN KEY([ReasonID])
REFERENCES [dbo].[SPMT_ReturnReason] ([ReasonID])
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] CHECK CONSTRAINT [FK_SPMT_SupplierBill_SPMT_ReturnReason]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_SupplierBill_SPMT_TranTypes] FOREIGN KEY([TranTypeID])
REFERENCES [dbo].[SPMT_TranTypes] ([TranTypeID])
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] CHECK CONSTRAINT [FK_SPMT_SupplierBill_SPMT_TranTypes]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_SupplierBill_SPMT_Vendors] FOREIGN KEY([VendorID])
REFERENCES [dbo].[SPMT_Vendors] ([VendorID])
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] CHECK CONSTRAINT [FK_SPMT_SupplierBill_SPMT_Vendors]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_SupplierBill_SupplierGSTIN] FOREIGN KEY([BPID], [SupplierGSTIN])
REFERENCES [dbo].[VR_BPGSTIN] ([BPID], [GSTIN])
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] CHECK CONSTRAINT [FK_SPMT_SupplierBill_SupplierGSTIN]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_SupplierBill_UOM] FOREIGN KEY([UOM])
REFERENCES [dbo].[SPMT_ERPUnits] ([UOM])
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] CHECK CONSTRAINT [FK_SPMT_SupplierBill_UOM]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] ADD  CONSTRAINT [DF_SPMT_SupplierBill_LogisticLinked]  DEFAULT ((0)) FOR [LogisticLinked]
GO
ALTER TABLE [dbo].[SPMT_SupplierBill] ADD  CONSTRAINT [DF_SPMT_SupplierBill_ReturnedByAC]  DEFAULT ((0)) FOR [ReturnedByAC]
GO
