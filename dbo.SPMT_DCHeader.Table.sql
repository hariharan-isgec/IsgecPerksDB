USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPMT_DCHeader](
	[ChallanID] [nvarchar](20) NOT NULL,
	[ChallanDate] [datetime] NULL,
	[CreatedBy] [nvarchar](8) NULL,
	[CreatedOn] [datetime] NULL,
	[StatusID] [int] NULL,
	[IssuerID] [int] NULL,
	[IssuerCompanyName] [nvarchar](50) NULL,
	[IssuerAddress1Line] [nvarchar](200) NULL,
	[IssuerAddress2Line] [nvarchar](200) NULL,
	[IssuerPAN] [nvarchar](50) NULL,
	[IssuerCIN] [nvarchar](50) NULL,
	[ProjectID] [nvarchar](6) NULL,
	[UnitID] [nvarchar](6) NULL,
	[PONo] [nvarchar](9) NULL,
	[PlaceOfSupply] [nvarchar](2) NULL,
	[PlaceOfDelivery] [nvarchar](2) NULL,
	[ConsigneeIsgecID] [int] NULL,
	[ConsigneeBPID] [nvarchar](9) NULL,
	[ConsigneeGSTIN] [int] NULL,
	[ConsigneeName] [nvarchar](50) NULL,
	[ConsigneeGSTINNo] [nvarchar](50) NULL,
	[ConsigneeAddress1Line] [nvarchar](100) NULL,
	[ConsigneeAddress2Line] [nvarchar](100) NULL,
	[ConsigneeAddress3Line] [nvarchar](100) NULL,
	[ConsigneeStateID] [nvarchar](2) NULL,
	[ConsignerIsgecID] [int] NULL,
	[ConsignerBPID] [nvarchar](9) NULL,
	[ConsignerGSTIN] [int] NULL,
	[ConsignerName] [nvarchar](50) NULL,
	[ConsignerGSTINNo] [nvarchar](50) NULL,
	[ConsignerAddress1Line] [nvarchar](100) NULL,
	[ConsignerAddress2Line] [nvarchar](100) NULL,
	[ConsignerAddress3Line] [nvarchar](100) NULL,
	[ConsignerStateID] [nvarchar](2) NULL,
	[Purpose] [nvarchar](250) NULL,
	[ExpectedReturnDate] [datetime] NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[TotalAmountInWords] [nvarchar](500) NULL,
	[ModeOfTransportID] [int] NULL,
	[VehicleNo] [nvarchar](50) NULL,
	[GRNo] [nvarchar](50) NULL,
	[GRDate] [datetime] NULL,
	[TransporterID] [nvarchar](9) NULL,
	[TransporterName] [nvarchar](50) NULL,
	[FromPlace] [nvarchar](50) NULL,
	[ToPlace] [nvarchar](50) NULL,
	[Declaration1Line] [nvarchar](250) NULL,
	[Declaration2Line] [nvarchar](250) NULL,
	[LinkedChallanID] [nvarchar](20) NULL,
	[DestinationIsgecID] [int] NULL,
	[DestinationBPID] [nvarchar](9) NULL,
	[DestinationGSTIN] [int] NULL,
	[DestinationName] [nvarchar](50) NULL,
	[DestinationGSTINNo] [nvarchar](50) NULL,
	[DestinationAddress1Line] [nvarchar](100) NULL,
	[DestinationAddress2Line] [nvarchar](100) NULL,
	[DestinationAddress3Line] [nvarchar](100) NULL,
	[DestinationStateID] [nvarchar](2) NULL,
	[ReceivedDate] [datetime] NULL,
	[ReceivedRemarks] [nvarchar](500) NULL,
	[ReceivedOn] [datetime] NULL,
	[ReceivedBy] [nvarchar](8) NULL,
	[ClosureRemarks] [nvarchar](500) NULL,
	[ClosureDate] [datetime] NULL,
	[ClosedBy] [nvarchar](8) NULL,
	[ClosedOn] [datetime] NULL,
	[IsgecInvoiceNo] [nvarchar](50) NULL,
	[IsgecInvoiceDate] [datetime] NULL,
 CONSTRAINT [PK_SPMT_DCHeader] PRIMARY KEY CLUSTERED 
(
	[ChallanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_ClosedBy] FOREIGN KEY([ClosedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_ClosedBy]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_CongigneeIsgecID] FOREIGN KEY([ConsigneeIsgecID])
REFERENCES [dbo].[SPMT_IsgecGSTIN] ([GSTID])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_CongigneeIsgecID]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_ConsigneeBPID] FOREIGN KEY([ConsigneeBPID])
REFERENCES [dbo].[VR_BusinessPartner] ([BPID])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_ConsigneeBPID]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_ConsigneeGISTIN] FOREIGN KEY([ConsigneeBPID], [ConsigneeGSTIN])
REFERENCES [dbo].[VR_BPGSTIN] ([BPID], [GSTIN])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_ConsigneeGISTIN]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_ConsigneeStateID] FOREIGN KEY([ConsigneeStateID])
REFERENCES [dbo].[SPMT_ERPStates] ([StateID])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_ConsigneeStateID]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_ConsignerBPID] FOREIGN KEY([ConsignerBPID])
REFERENCES [dbo].[VR_BusinessPartner] ([BPID])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_ConsignerBPID]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_ConsignerGSTIN] FOREIGN KEY([ConsignerBPID], [ConsignerGSTIN])
REFERENCES [dbo].[VR_BPGSTIN] ([BPID], [GSTIN])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_ConsignerGSTIN]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_ConsignerIsgecID] FOREIGN KEY([ConsignerIsgecID])
REFERENCES [dbo].[SPMT_IsgecGSTIN] ([GSTID])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_ConsignerIsgecID]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_consignerStateID] FOREIGN KEY([ConsignerStateID])
REFERENCES [dbo].[SPMT_ERPStates] ([StateID])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_consignerStateID]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_CreatedBy]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_DestinationBPID] FOREIGN KEY([DestinationBPID])
REFERENCES [dbo].[VR_BusinessPartner] ([BPID])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_DestinationBPID]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_DestinationGSTIN] FOREIGN KEY([DestinationBPID], [DestinationGSTIN])
REFERENCES [dbo].[VR_BPGSTIN] ([BPID], [GSTIN])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_DestinationGSTIN]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_DestinationIsgecID] FOREIGN KEY([DestinationIsgecID])
REFERENCES [dbo].[SPMT_IsgecGSTIN] ([GSTID])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_DestinationIsgecID]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_DestinationStateID] FOREIGN KEY([DestinationStateID])
REFERENCES [dbo].[SPMT_ERPStates] ([StateID])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_DestinationStateID]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_IssuerID] FOREIGN KEY([IssuerID])
REFERENCES [dbo].[SPMT_IsgecGSTIN] ([GSTID])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_IssuerID]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_LinkedChallanID] FOREIGN KEY([LinkedChallanID])
REFERENCES [dbo].[SPMT_DCHeader] ([ChallanID])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_LinkedChallanID]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_ModeOfTransportID] FOREIGN KEY([ModeOfTransportID])
REFERENCES [dbo].[SPMT_ModeOfTransport] ([ModeID])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_ModeOfTransportID]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_PlaceOfDelivery] FOREIGN KEY([PlaceOfDelivery])
REFERENCES [dbo].[SPMT_ERPStates] ([StateID])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_PlaceOfDelivery]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_PlaceOfSupply] FOREIGN KEY([PlaceOfSupply])
REFERENCES [dbo].[SPMT_ERPStates] ([StateID])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_PlaceOfSupply]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_ProjectID]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_ReceivedBy] FOREIGN KEY([ReceivedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_ReceivedBy]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[SPMT_DCStates] ([StatusID])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_StatusID]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_TransporterID] FOREIGN KEY([TransporterID])
REFERENCES [dbo].[VR_BusinessPartner] ([BPID])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_TransporterID]
GO
ALTER TABLE [dbo].[SPMT_DCHeader]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_DCHeader_UnitID] FOREIGN KEY([UnitID])
REFERENCES [dbo].[HRM_Companies] ([CompanyID])
GO
ALTER TABLE [dbo].[SPMT_DCHeader] CHECK CONSTRAINT [FK_SPMT_DCHeader_UnitID]
GO
