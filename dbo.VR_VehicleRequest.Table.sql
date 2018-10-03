USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VR_VehicleRequest](
	[RequestNo] [int] IDENTITY(1,1) NOT NULL,
	[RequestDescription] [nvarchar](50) NULL,
	[SupplierID] [nvarchar](9) NOT NULL,
	[SupplierLocation] [nvarchar](250) NOT NULL,
	[ProjectID] [nvarchar](6) NOT NULL,
	[ProjectType] [nvarchar](10) NOT NULL,
	[DeliveryLocation] [nvarchar](400) NOT NULL,
	[ItemDescription] [nvarchar](500) NOT NULL,
	[MaterialSize] [nvarchar](50) NOT NULL,
	[SizeUnit] [int] NULL,
	[Height] [decimal](6, 2) NOT NULL,
	[Width] [decimal](6, 2) NOT NULL,
	[Length] [decimal](6, 2) NOT NULL,
	[MaterialWeight] [decimal](18, 2) NOT NULL,
	[WeightUnit] [int] NULL,
	[NoOfPackages] [int] NOT NULL,
	[VehicleTypeID] [int] NOT NULL,
	[VehicleRequiredOn] [datetime] NULL,
	[OverDimentionConsignement] [bit] NOT NULL,
	[ODCReasonID] [int] NULL,
	[MICN] [bit] NOT NULL,
	[CustomInvoiceNo] [nvarchar](100) NULL,
	[Remarks] [nvarchar](500) NULL,
	[RequestedBy] [nvarchar](8) NOT NULL,
	[RequestedOn] [datetime] NOT NULL,
	[RequesterDivisionID] [nvarchar](6) NULL,
	[RequestStatus] [int] NOT NULL,
	[ReturnedOn] [datetime] NULL,
	[ReturnedBy] [nvarchar](8) NULL,
	[ReturnRemarks] [nvarchar](100) NULL,
	[SRNNo] [int] NULL,
	[ValidRequest] [bit] NOT NULL,
	[ODCAtSupplierLoading] [bit] NOT NULL,
	[FromLocation] [nvarchar](50) NULL,
	[ToLocation] [nvarchar](50) NULL,
	[CustomInvoiceIssued] [bit] NOT NULL,
	[CT1Issued] [bit] NOT NULL,
	[ARE1Issued] [bit] NOT NULL,
	[DIIssued] [bit] NOT NULL,
	[PaymentChecked] [bit] NOT NULL,
	[GoodsPacked] [bit] NOT NULL,
	[POApproved] [bit] NOT NULL,
	[WayBill] [bit] NOT NULL,
	[MarkingDetails] [bit] NOT NULL,
	[TarpaulineRequired] [bit] NOT NULL,
	[PackageStckable] [bit] NOT NULL,
	[InvoiceValue] [decimal](13, 2) NOT NULL,
	[OutOfContract] [bit] NOT NULL,
	[ERPPONumber] [nvarchar](10) NULL,
	[BuyerInERP] [nvarchar](8) NULL,
	[ExecuterReasonID] [int] NULL,
	[ExecuterID] [nvarchar](8) NULL,
	[ReasonEneteredOn] [datetime] NULL,
 CONSTRAINT [PK_VR_VehicleRequest] PRIMARY KEY CLUSTERED 
(
	[RequestNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VR_VehicleRequest]  WITH CHECK ADD  CONSTRAINT [FK_VR_VehicleRequest_BuyerInERP] FOREIGN KEY([BuyerInERP])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VR_VehicleRequest] CHECK CONSTRAINT [FK_VR_VehicleRequest_BuyerInERP]
GO
ALTER TABLE [dbo].[VR_VehicleRequest]  WITH CHECK ADD  CONSTRAINT [FK_VR_VehicleRequest_ExecuterID] FOREIGN KEY([ExecuterID])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VR_VehicleRequest] CHECK CONSTRAINT [FK_VR_VehicleRequest_ExecuterID]
GO
ALTER TABLE [dbo].[VR_VehicleRequest]  WITH CHECK ADD  CONSTRAINT [FK_VR_VehicleRequest_ExecuterReasonID] FOREIGN KEY([ExecuterReasonID])
REFERENCES [dbo].[VR_RequestReasons] ([ReasonID])
GO
ALTER TABLE [dbo].[VR_VehicleRequest] CHECK CONSTRAINT [FK_VR_VehicleRequest_ExecuterReasonID]
GO
ALTER TABLE [dbo].[VR_VehicleRequest]  WITH CHECK ADD  CONSTRAINT [FK_VR_VehicleRequest_ODCReasonID] FOREIGN KEY([ODCReasonID])
REFERENCES [dbo].[VR_ODCReasons] ([ReasonID])
GO
ALTER TABLE [dbo].[VR_VehicleRequest] CHECK CONSTRAINT [FK_VR_VehicleRequest_ODCReasonID]
GO
ALTER TABLE [dbo].[VR_VehicleRequest]  WITH CHECK ADD  CONSTRAINT [FK_VR_VehicleRequest_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[VR_VehicleRequest] CHECK CONSTRAINT [FK_VR_VehicleRequest_ProjectID]
GO
ALTER TABLE [dbo].[VR_VehicleRequest]  WITH CHECK ADD  CONSTRAINT [FK_VR_VehicleRequest_RequestedBy] FOREIGN KEY([RequestedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VR_VehicleRequest] CHECK CONSTRAINT [FK_VR_VehicleRequest_RequestedBy]
GO
ALTER TABLE [dbo].[VR_VehicleRequest]  WITH CHECK ADD  CONSTRAINT [FK_VR_VehicleRequest_RequesterDivisionID] FOREIGN KEY([RequesterDivisionID])
REFERENCES [dbo].[HRM_Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[VR_VehicleRequest] CHECK CONSTRAINT [FK_VR_VehicleRequest_RequesterDivisionID]
GO
ALTER TABLE [dbo].[VR_VehicleRequest]  WITH CHECK ADD  CONSTRAINT [FK_VR_VehicleRequest_RequestState] FOREIGN KEY([RequestStatus])
REFERENCES [dbo].[VR_RequestStates] ([StatusID])
GO
ALTER TABLE [dbo].[VR_VehicleRequest] CHECK CONSTRAINT [FK_VR_VehicleRequest_RequestState]
GO
ALTER TABLE [dbo].[VR_VehicleRequest]  WITH CHECK ADD  CONSTRAINT [FK_VR_VehicleRequest_ReturnedBy] FOREIGN KEY([ReturnedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VR_VehicleRequest] CHECK CONSTRAINT [FK_VR_VehicleRequest_ReturnedBy]
GO
ALTER TABLE [dbo].[VR_VehicleRequest]  WITH CHECK ADD  CONSTRAINT [FK_VR_VehicleRequest_SizeUnit] FOREIGN KEY([SizeUnit])
REFERENCES [dbo].[VR_Units] ([UnitID])
GO
ALTER TABLE [dbo].[VR_VehicleRequest] CHECK CONSTRAINT [FK_VR_VehicleRequest_SizeUnit]
GO
ALTER TABLE [dbo].[VR_VehicleRequest]  WITH CHECK ADD  CONSTRAINT [FK_VR_VehicleRequest_SRNNo] FOREIGN KEY([SRNNo])
REFERENCES [dbo].[VR_RequestExecution] ([SRNNo])
GO
ALTER TABLE [dbo].[VR_VehicleRequest] CHECK CONSTRAINT [FK_VR_VehicleRequest_SRNNo]
GO
ALTER TABLE [dbo].[VR_VehicleRequest]  WITH CHECK ADD  CONSTRAINT [FK_VR_VehicleRequest_SupplierID] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[IDM_Vendors] ([VendorID])
GO
ALTER TABLE [dbo].[VR_VehicleRequest] CHECK CONSTRAINT [FK_VR_VehicleRequest_SupplierID]
GO
ALTER TABLE [dbo].[VR_VehicleRequest]  WITH CHECK ADD  CONSTRAINT [FK_VR_VehicleRequest_VehicleTypeID] FOREIGN KEY([VehicleTypeID])
REFERENCES [dbo].[VR_VehicleTypes] ([VehicleTypeID])
GO
ALTER TABLE [dbo].[VR_VehicleRequest] CHECK CONSTRAINT [FK_VR_VehicleRequest_VehicleTypeID]
GO
ALTER TABLE [dbo].[VR_VehicleRequest]  WITH CHECK ADD  CONSTRAINT [FK_VR_VehicleRequest_WeightUnit] FOREIGN KEY([WeightUnit])
REFERENCES [dbo].[VR_Units] ([UnitID])
GO
ALTER TABLE [dbo].[VR_VehicleRequest] CHECK CONSTRAINT [FK_VR_VehicleRequest_WeightUnit]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_MaterialSize]  DEFAULT ((0)) FOR [MaterialSize]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_HeightInFt]  DEFAULT ((0)) FOR [Height]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_WidthInFt]  DEFAULT ((0)) FOR [Width]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_LengthInFt]  DEFAULT ((0)) FOR [Length]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_MaterialWeight]  DEFAULT ((0)) FOR [MaterialWeight]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_NoOfPackages]  DEFAULT ((0)) FOR [NoOfPackages]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_MICN1]  DEFAULT ((0)) FOR [OverDimentionConsignement]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_MICN]  DEFAULT ((0)) FOR [MICN]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_ValidRequest]  DEFAULT ((0)) FOR [ValidRequest]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_ODCAtSupplierLoading]  DEFAULT ((0)) FOR [ODCAtSupplierLoading]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_CustomInvoiceIssued_1]  DEFAULT ((0)) FOR [CustomInvoiceIssued]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_CT1Issued]  DEFAULT ((0)) FOR [CT1Issued]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_ARE1Issued_1]  DEFAULT ((0)) FOR [ARE1Issued]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_DIIssued]  DEFAULT ((0)) FOR [DIIssued]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_PaymentChecked]  DEFAULT ((0)) FOR [PaymentChecked]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_GoodsPacked]  DEFAULT ((0)) FOR [GoodsPacked]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_POApproved]  DEFAULT ((0)) FOR [POApproved]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_WayBill]  DEFAULT ((0)) FOR [WayBill]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_MarkingDetails]  DEFAULT ((0)) FOR [MarkingDetails]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_TarpaulineRequired]  DEFAULT ((0)) FOR [TarpaulineRequired]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_PackageStckable]  DEFAULT ((0)) FOR [PackageStckable]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_InvoiceValue]  DEFAULT ((0)) FOR [InvoiceValue]
GO
ALTER TABLE [dbo].[VR_VehicleRequest] ADD  CONSTRAINT [DF_VR_VehicleRequest_OutOfContract]  DEFAULT ((0)) FOR [OutOfContract]
GO
