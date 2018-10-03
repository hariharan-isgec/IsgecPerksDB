USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VR_RequestExecution](
	[SRNNo] [int] IDENTITY(1,1) NOT NULL,
	[ExecutionDescription] [nvarchar](50) NULL,
	[TransporterID] [nvarchar](9) NOT NULL,
	[VehiclePlacedOn] [datetime] NOT NULL,
	[VehicleTypeID] [int] NOT NULL,
	[VehicleNo] [nvarchar](20) NOT NULL,
	[ArrangedBy] [nvarchar](8) NOT NULL,
	[ArrangedOn] [datetime] NOT NULL,
	[TraficOfficerDivisionID] [nvarchar](6) NULL,
	[RequestStatusID] [int] NOT NULL,
	[ApprovalRemarks] [nvarchar](200) NULL,
	[ApprovedBy] [nvarchar](8) NULL,
	[ApprovedOn] [datetime] NULL,
	[GRNo] [nvarchar](50) NULL,
	[GRDate] [datetime] NULL,
	[LoadedAtSupplier] [bit] NOT NULL,
	[LoadedOn] [datetime] NULL,
	[Remarks] [nvarchar](500) NULL,
	[TransShipment] [bit] NOT NULL,
	[TransGRNO] [nvarchar](50) NULL,
	[TransGRDate] [datetime] NULL,
	[TransVehicleNo] [nvarchar](20) NULL,
	[TransVehicleTypeID] [int] NULL,
	[TransTransporterID] [nvarchar](9) NULL,
	[ReceiptAtSite] [bit] NOT NULL,
	[ReceiptBy] [nvarchar](8) NULL,
	[ReceiptOn] [datetime] NULL,
	[MaterialStateID] [int] NULL,
	[ReceiptMaterialSize] [nvarchar](50) NOT NULL,
	[ReceiptSizeUnit] [int] NULL,
	[ReceiptMaterialWeight] [decimal](18, 2) NOT NULL,
	[ReceiptNoOfPackages] [int] NOT NULL,
	[ReachedAtSite] [bit] NOT NULL,
	[ReachedOn] [datetime] NULL,
	[UnloadedAtSite] [bit] NOT NULL,
	[UnloadedOn] [datetime] NULL,
	[SiteReceiptNo] [nvarchar](50) NULL,
	[SiteReceiptDate] [datetime] NULL,
	[ReceiptRemarks] [nvarchar](500) NULL,
	[TransShipmentAtSite] [bit] NOT NULL,
	[SiteGRNO] [nvarchar](50) NULL,
	[SiteGRDate] [datetime] NULL,
	[SiteVehicleNo] [nvarchar](20) NULL,
	[SiteVehicleTypeID] [int] NULL,
	[SiteTransporterID] [nvarchar](9) NULL,
	[IRNo] [int] NULL,
	[MaterialSize] [nvarchar](50) NOT NULL,
	[SizeUnit] [int] NULL,
	[Height] [decimal](6, 2) NOT NULL,
	[Width] [decimal](6, 2) NOT NULL,
	[Length] [decimal](6, 2) NOT NULL,
	[MaterialWeight] [decimal](18, 2) NOT NULL,
	[WeightUnit] [int] NULL,
	[NoOfPackages] [int] NOT NULL,
	[OverDimentionConsignement] [bit] NOT NULL,
	[GRRemarks] [nvarchar](500) NULL,
	[TransRemarks] [nvarchar](500) NULL,
	[ReachedAtSupplierOn] [datetime] NULL,
	[ODCByRequest] [bit] NOT NULL,
	[Linked] [bit] NOT NULL,
	[LinkID] [int] NULL,
	[VehicleNotPlaced] [bit] NOT NULL,
	[DelayedPlacement] [bit] NOT NULL,
	[EmptyReturn] [bit] NOT NULL,
	[DetentionAtSupplier] [bit] NOT NULL,
	[DebitToTransporter] [bit] NOT NULL,
	[PayableToTransporter] [bit] NOT NULL,
	[BorneByISGEC] [bit] NOT NULL,
	[BorneBySupplier] [bit] NOT NULL,
	[DebitAmount] [decimal](18, 2) NOT NULL,
	[PayableAmount] [decimal](18, 2) NOT NULL,
	[ISGECAmount] [decimal](18, 2) NOT NULL,
	[SupplierAmount] [decimal](18, 2) NOT NULL,
	[EmptyReturnRemarks] [nvarchar](250) NULL,
	[ODCReasonID] [int] NULL,
	[EstimatedDistance] [decimal](10, 2) NOT NULL,
	[EstimatedRatePerKM] [decimal](8, 2) NOT NULL,
	[EstimatedAmount] [decimal](12, 2) NOT NULL,
	[EstimatedPOBalance] [decimal](12, 2) NOT NULL,
	[POValue] [decimal](12, 2) NOT NULL,
	[SanctionExceeded] [bit] NOT NULL,
	[SanctionExceededApproved] [bit] NOT NULL,
	[SanctionApprovalRemarks] [nvarchar](250) NULL,
	[SanctionApprovedBy] [nvarchar](8) NULL,
	[SanctionApprovedOn] [datetime] NULL,
 CONSTRAINT [PK_VR_RequestExecution] PRIMARY KEY CLUSTERED 
(
	[SRNNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_VR_RequestExecution] ON [dbo].[VR_RequestExecution] 
(
	[LinkID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VR_RequestExecution]  WITH CHECK ADD  CONSTRAINT [FK_VR_RequestExecution_ApprovedBy] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VR_RequestExecution] CHECK CONSTRAINT [FK_VR_RequestExecution_ApprovedBy]
GO
ALTER TABLE [dbo].[VR_RequestExecution]  WITH CHECK ADD  CONSTRAINT [FK_VR_RequestExecution_ArrangedBy] FOREIGN KEY([ArrangedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VR_RequestExecution] CHECK CONSTRAINT [FK_VR_RequestExecution_ArrangedBy]
GO
ALTER TABLE [dbo].[VR_RequestExecution]  WITH CHECK ADD  CONSTRAINT [FK_VR_RequestExecution_IRNo] FOREIGN KEY([IRNo])
REFERENCES [dbo].[VR_TransporterBill] ([IRNo])
GO
ALTER TABLE [dbo].[VR_RequestExecution] CHECK CONSTRAINT [FK_VR_RequestExecution_IRNo]
GO
ALTER TABLE [dbo].[VR_RequestExecution]  WITH NOCHECK ADD  CONSTRAINT [FK_VR_RequestExecution_LinkID] FOREIGN KEY([LinkID], [SRNNo])
REFERENCES [dbo].[VR_LinkExecutions] ([LinkID], [SRNNo])
GO
ALTER TABLE [dbo].[VR_RequestExecution] NOCHECK CONSTRAINT [FK_VR_RequestExecution_LinkID]
GO
ALTER TABLE [dbo].[VR_RequestExecution]  WITH CHECK ADD  CONSTRAINT [FK_VR_RequestExecution_MaterialStateID] FOREIGN KEY([MaterialStateID])
REFERENCES [dbo].[VR_MaterialStates] ([MaterialStateID])
GO
ALTER TABLE [dbo].[VR_RequestExecution] CHECK CONSTRAINT [FK_VR_RequestExecution_MaterialStateID]
GO
ALTER TABLE [dbo].[VR_RequestExecution]  WITH CHECK ADD  CONSTRAINT [FK_VR_RequestExecution_ODCReasonID] FOREIGN KEY([ODCReasonID])
REFERENCES [dbo].[VR_ODCReasons] ([ReasonID])
GO
ALTER TABLE [dbo].[VR_RequestExecution] CHECK CONSTRAINT [FK_VR_RequestExecution_ODCReasonID]
GO
ALTER TABLE [dbo].[VR_RequestExecution]  WITH CHECK ADD  CONSTRAINT [FK_VR_RequestExecution_ReceiptBy] FOREIGN KEY([ReceiptBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VR_RequestExecution] CHECK CONSTRAINT [FK_VR_RequestExecution_ReceiptBy]
GO
ALTER TABLE [dbo].[VR_RequestExecution]  WITH CHECK ADD  CONSTRAINT [FK_VR_RequestExecution_ReceiptSizeUnit] FOREIGN KEY([ReceiptSizeUnit])
REFERENCES [dbo].[VR_Units] ([UnitID])
GO
ALTER TABLE [dbo].[VR_RequestExecution] CHECK CONSTRAINT [FK_VR_RequestExecution_ReceiptSizeUnit]
GO
ALTER TABLE [dbo].[VR_RequestExecution]  WITH CHECK ADD  CONSTRAINT [FK_VR_RequestExecution_RequestStatusID] FOREIGN KEY([RequestStatusID])
REFERENCES [dbo].[VR_RequestStates] ([StatusID])
GO
ALTER TABLE [dbo].[VR_RequestExecution] CHECK CONSTRAINT [FK_VR_RequestExecution_RequestStatusID]
GO
ALTER TABLE [dbo].[VR_RequestExecution]  WITH CHECK ADD  CONSTRAINT [FK_VR_RequestExecution_SanctionApprovedBy] FOREIGN KEY([SanctionApprovedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VR_RequestExecution] CHECK CONSTRAINT [FK_VR_RequestExecution_SanctionApprovedBy]
GO
ALTER TABLE [dbo].[VR_RequestExecution]  WITH CHECK ADD  CONSTRAINT [FK_VR_RequestExecution_SiteTransporterID] FOREIGN KEY([SiteTransporterID])
REFERENCES [dbo].[VR_Transporters] ([TransporterID])
GO
ALTER TABLE [dbo].[VR_RequestExecution] CHECK CONSTRAINT [FK_VR_RequestExecution_SiteTransporterID]
GO
ALTER TABLE [dbo].[VR_RequestExecution]  WITH CHECK ADD  CONSTRAINT [FK_VR_RequestExecution_SiteVehicleTypeID] FOREIGN KEY([SiteVehicleTypeID])
REFERENCES [dbo].[VR_VehicleTypes] ([VehicleTypeID])
GO
ALTER TABLE [dbo].[VR_RequestExecution] CHECK CONSTRAINT [FK_VR_RequestExecution_SiteVehicleTypeID]
GO
ALTER TABLE [dbo].[VR_RequestExecution]  WITH CHECK ADD  CONSTRAINT [FK_VR_RequestExecution_SizeUnit] FOREIGN KEY([SizeUnit])
REFERENCES [dbo].[VR_Units] ([UnitID])
GO
ALTER TABLE [dbo].[VR_RequestExecution] CHECK CONSTRAINT [FK_VR_RequestExecution_SizeUnit]
GO
ALTER TABLE [dbo].[VR_RequestExecution]  WITH CHECK ADD  CONSTRAINT [FK_VR_RequestExecution_TraficOfficerDivisionID] FOREIGN KEY([TraficOfficerDivisionID])
REFERENCES [dbo].[HRM_Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[VR_RequestExecution] CHECK CONSTRAINT [FK_VR_RequestExecution_TraficOfficerDivisionID]
GO
ALTER TABLE [dbo].[VR_RequestExecution]  WITH CHECK ADD  CONSTRAINT [FK_VR_RequestExecution_TransporterID] FOREIGN KEY([TransporterID])
REFERENCES [dbo].[VR_Transporters] ([TransporterID])
GO
ALTER TABLE [dbo].[VR_RequestExecution] CHECK CONSTRAINT [FK_VR_RequestExecution_TransporterID]
GO
ALTER TABLE [dbo].[VR_RequestExecution]  WITH CHECK ADD  CONSTRAINT [FK_VR_RequestExecution_TransTransporterID] FOREIGN KEY([TransTransporterID])
REFERENCES [dbo].[VR_Transporters] ([TransporterID])
GO
ALTER TABLE [dbo].[VR_RequestExecution] CHECK CONSTRAINT [FK_VR_RequestExecution_TransTransporterID]
GO
ALTER TABLE [dbo].[VR_RequestExecution]  WITH CHECK ADD  CONSTRAINT [FK_VR_RequestExecution_TransVehicleTypeID] FOREIGN KEY([TransVehicleTypeID])
REFERENCES [dbo].[VR_VehicleTypes] ([VehicleTypeID])
GO
ALTER TABLE [dbo].[VR_RequestExecution] CHECK CONSTRAINT [FK_VR_RequestExecution_TransVehicleTypeID]
GO
ALTER TABLE [dbo].[VR_RequestExecution]  WITH CHECK ADD  CONSTRAINT [FK_VR_RequestExecution_VehicleTypeID] FOREIGN KEY([VehicleTypeID])
REFERENCES [dbo].[VR_VehicleTypes] ([VehicleTypeID])
GO
ALTER TABLE [dbo].[VR_RequestExecution] CHECK CONSTRAINT [FK_VR_RequestExecution_VehicleTypeID]
GO
ALTER TABLE [dbo].[VR_RequestExecution]  WITH CHECK ADD  CONSTRAINT [FK_VR_RequestExecution_WeightUnit] FOREIGN KEY([WeightUnit])
REFERENCES [dbo].[VR_Units] ([UnitID])
GO
ALTER TABLE [dbo].[VR_RequestExecution] CHECK CONSTRAINT [FK_VR_RequestExecution_WeightUnit]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_LoadedAtSupplier]  DEFAULT ((0)) FOR [LoadedAtSupplier]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_TransShipment]  DEFAULT ((0)) FOR [TransShipment]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_ReceiptAtSite]  DEFAULT ((0)) FOR [ReceiptAtSite]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_ReceiptMaterialSize]  DEFAULT ((0)) FOR [ReceiptMaterialSize]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_ReceiptMaterialWeight]  DEFAULT ((0)) FOR [ReceiptMaterialWeight]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_ReceiptNoOfPackages]  DEFAULT ((0)) FOR [ReceiptNoOfPackages]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_ReachedAtSite]  DEFAULT ((0)) FOR [ReachedAtSite]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_UnloadedAtSite]  DEFAULT ((0)) FOR [UnloadedAtSite]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_TransShipmentAtSite]  DEFAULT ((0)) FOR [TransShipmentAtSite]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_MaterialSize_1]  DEFAULT ((0)) FOR [MaterialSize]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_Height_1]  DEFAULT ((0)) FOR [Height]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_Width_1]  DEFAULT ((0)) FOR [Width]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_Length_1]  DEFAULT ((0)) FOR [Length]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_MaterialWeight_1]  DEFAULT ((0)) FOR [MaterialWeight]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_NoOfPackages_1]  DEFAULT ((0)) FOR [NoOfPackages]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_OverDimentionConsignement_1]  DEFAULT ((0)) FOR [OverDimentionConsignement]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_ODCByRequest_1]  DEFAULT ((0)) FOR [ODCByRequest]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_Linked_1]  DEFAULT ((0)) FOR [Linked]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_VehicleNotPlaced_1]  DEFAULT ((0)) FOR [VehicleNotPlaced]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_DelayedPlacement_1]  DEFAULT ((0)) FOR [DelayedPlacement]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_EmptyReturn_1]  DEFAULT ((0)) FOR [EmptyReturn]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_DetentionAtSupplier_1]  DEFAULT ((0)) FOR [DetentionAtSupplier]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_DebitToTransporter_1]  DEFAULT ((0)) FOR [DebitToTransporter]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_PayableToTransporter_1]  DEFAULT ((0)) FOR [PayableToTransporter]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_BorneByISGEC_1]  DEFAULT ((0)) FOR [BorneByISGEC]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_BorneBySupplier_1]  DEFAULT ((0)) FOR [BorneBySupplier]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_DebitAmount_1]  DEFAULT ((0)) FOR [DebitAmount]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_PayableAmount_1]  DEFAULT ((0)) FOR [PayableAmount]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_ISGECAmount]  DEFAULT ((0)) FOR [ISGECAmount]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_SupplierAmount]  DEFAULT ((0)) FOR [SupplierAmount]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_EstimatedDistance_1]  DEFAULT ((0)) FOR [EstimatedDistance]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_EstimatedRatePerKM_1]  DEFAULT ((0)) FOR [EstimatedRatePerKM]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_EstimatedAmount_1]  DEFAULT ((0)) FOR [EstimatedAmount]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_EstimatedPOBalance_1]  DEFAULT ((0)) FOR [EstimatedPOBalance]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_POValue_1]  DEFAULT ((0)) FOR [POValue]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_SanctionExceeded]  DEFAULT ((0)) FOR [SanctionExceeded]
GO
ALTER TABLE [dbo].[VR_RequestExecution] ADD  CONSTRAINT [DF_VR_RequestExecution_SanctionExceededApproved]  DEFAULT ((0)) FOR [SanctionExceededApproved]
GO
