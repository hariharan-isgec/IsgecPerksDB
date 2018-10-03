USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPMT_PaymentAdvice](
	[AdviceNo] [int] IDENTITY(1,1) NOT NULL,
	[TranTypeID] [nvarchar](3) NOT NULL,
	[VendorID] [nvarchar](6) NULL,
	[BPID] [nvarchar](9) NULL,
	[CostCenter] [nvarchar](50) NULL,
	[ConcernedHOD] [nvarchar](8) NULL,
	[AdviceStatusID] [int] NOT NULL,
	[AdviceStatusOn] [datetime] NOT NULL,
	[AdviceStatusUser] [nvarchar](8) NOT NULL,
	[Remarks] [nvarchar](500) NULL,
	[RemarksHOD] [nvarchar](500) NULL,
	[RemarksHR] [nvarchar](500) NULL,
	[RemarksAC] [nvarchar](500) NULL,
	[Returned] [bit] NULL,
	[Forward] [bit] NULL,
	[ProjectID] [nvarchar](6) NULL,
	[ElementID] [nvarchar](8) NULL,
	[EmployeeID] [nvarchar](8) NULL,
	[DepartmentID] [nvarchar](6) NULL,
	[CostCenterID] [nvarchar](6) NULL,
	[VoucherNo] [int] NULL,
	[DocumentNo] [nvarchar](50) NULL,
	[BaaNCompany] [nvarchar](10) NULL,
	[BaaNLedger] [nvarchar](20) NULL,
	[SupplierName] [nvarchar](100) NULL,
	[AdvanceRate] [decimal](18, 2) NOT NULL,
	[AdvanceAmount] [decimal](18, 2) NOT NULL,
	[RetensionRate] [decimal](18, 2) NOT NULL,
	[RetensionAmount] [decimal](18, 2) NOT NULL,
	[UploadBatchNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_SPMT_PaymentAdvice] PRIMARY KEY CLUSTERED 
(
	[AdviceNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SPMT_PaymentAdvice] ON [dbo].[SPMT_PaymentAdvice] 
(
	[UploadBatchNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SPMT_PaymentAdvice_1] ON [dbo].[SPMT_PaymentAdvice] 
(
	[VoucherNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_PaymentAdvice_aspnet_Users] FOREIGN KEY([AdviceStatusUser])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice] CHECK CONSTRAINT [FK_SPMT_PaymentAdvice_aspnet_Users]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_PaymentAdvice_aspnet_Users1] FOREIGN KEY([ConcernedHOD])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice] CHECK CONSTRAINT [FK_SPMT_PaymentAdvice_aspnet_Users1]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_PaymentAdvice_aspnet_Users2] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice] CHECK CONSTRAINT [FK_SPMT_PaymentAdvice_aspnet_Users2]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_PaymentAdvice_BPID] FOREIGN KEY([BPID])
REFERENCES [dbo].[VR_BusinessPartner] ([BPID])
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice] CHECK CONSTRAINT [FK_SPMT_PaymentAdvice_BPID]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_PaymentAdvice_HRM_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[HRM_Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice] CHECK CONSTRAINT [FK_SPMT_PaymentAdvice_HRM_Departments]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_PaymentAdvice_IDM_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice] CHECK CONSTRAINT [FK_SPMT_PaymentAdvice_IDM_Projects]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_PaymentAdvice_IDM_WBS] FOREIGN KEY([ElementID])
REFERENCES [dbo].[IDM_WBS] ([WBSID])
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice] CHECK CONSTRAINT [FK_SPMT_PaymentAdvice_IDM_WBS]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice]  WITH NOCHECK ADD  CONSTRAINT [FK_SPMT_PaymentAdvice_SPMT_ACVouchers] FOREIGN KEY([VoucherNo])
REFERENCES [dbo].[SPMT_ACVouchers] ([VoucherNo])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice] NOCHECK CONSTRAINT [FK_SPMT_PaymentAdvice_SPMT_ACVouchers]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_PaymentAdvice_SPMT_CostCenters] FOREIGN KEY([CostCenterID])
REFERENCES [dbo].[SPMT_CostCenters] ([CostCenterID])
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice] CHECK CONSTRAINT [FK_SPMT_PaymentAdvice_SPMT_CostCenters]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_PaymentAdvice_SPMT_PAStatus] FOREIGN KEY([AdviceStatusID])
REFERENCES [dbo].[SPMT_PAStatus] ([AdviceStatusID])
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice] CHECK CONSTRAINT [FK_SPMT_PaymentAdvice_SPMT_PAStatus]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_PaymentAdvice_SPMT_TranTypes] FOREIGN KEY([TranTypeID])
REFERENCES [dbo].[SPMT_TranTypes] ([TranTypeID])
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice] CHECK CONSTRAINT [FK_SPMT_PaymentAdvice_SPMT_TranTypes]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_PaymentAdvice_SPMT_Vendors] FOREIGN KEY([VendorID])
REFERENCES [dbo].[SPMT_Vendors] ([VendorID])
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice] CHECK CONSTRAINT [FK_SPMT_PaymentAdvice_SPMT_Vendors]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice] ADD  CONSTRAINT [DF_SPMT_PaymentAdvice_Returned]  DEFAULT ((0)) FOR [Returned]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice] ADD  CONSTRAINT [DF_SPMT_PaymentAdvice_Forward]  DEFAULT ((0)) FOR [Forward]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice] ADD  CONSTRAINT [DF_SPMT_PaymentAdvice_AdvanceRate]  DEFAULT ((0)) FOR [AdvanceRate]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice] ADD  CONSTRAINT [DF_SPMT_PaymentAdvice_AdvanceAmount]  DEFAULT ((0)) FOR [AdvanceAmount]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice] ADD  CONSTRAINT [DF_SPMT_PaymentAdvice_RetensionRate]  DEFAULT ((0)) FOR [RetensionRate]
GO
ALTER TABLE [dbo].[SPMT_PaymentAdvice] ADD  CONSTRAINT [DF_SPMT_PaymentAdvice_RetensionAmount]  DEFAULT ((0)) FOR [RetensionAmount]
GO
