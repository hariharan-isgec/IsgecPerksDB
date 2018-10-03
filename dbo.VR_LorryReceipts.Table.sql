USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VR_LorryReceipts](
	[ProjectID] [nvarchar](6) NOT NULL,
	[MRNNo] [int] NOT NULL,
	[MRNDate] [datetime] NULL,
	[RequestExecutionNo] [int] NULL,
	[CustomerID] [nvarchar](9) NULL,
	[VehicleInDate] [datetime] NULL,
	[VehicleOutDate] [datetime] NULL,
	[TransporterID] [nvarchar](9) NULL,
	[TransporterName] [nvarchar](50) NULL,
	[VehicleRegistrationNo] [nvarchar](50) NULL,
	[WayBillFormNo] [nvarchar](50) NULL,
	[PaymentMadeAtSite] [bit] NOT NULL,
	[AmountPaid] [decimal](10, 2) NOT NULL,
	[CreatedBy] [nvarchar](8) NULL,
	[CreatedOn] [datetime] NULL,
	[LRStatusID] [int] NOT NULL,
	[VehicleTypeID] [int] NULL,
	[VehicleType] [nvarchar](50) NULL,
	[VehicleLengthInFt] [decimal](6, 2) NULL,
	[VechicleWidthInFt] [decimal](6, 2) NULL,
	[VehicleHeightInFt] [decimal](6, 2) NULL,
	[OverDimensionConsignment] [nvarchar](10) NOT NULL,
	[DetentionAtSite] [nvarchar](10) NOT NULL,
	[ReasonForDetention] [nvarchar](500) NULL,
	[OtherRemarks] [nvarchar](500) NULL,
	[MaterialStateID] [int] NULL,
	[RemarksForDamageOrShortage] [nvarchar](500) NULL,
	[DriverNameAndContactNo] [nvarchar](50) NULL,
	[TempMRNNo] [int] NULL,
 CONSTRAINT [PK_VR_LorryReceipts] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[MRNNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VR_LorryReceipts]  WITH CHECK ADD  CONSTRAINT [FK_VR_LorryReceipts_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VR_LorryReceipts] CHECK CONSTRAINT [FK_VR_LorryReceipts_CreatedBy]
GO
ALTER TABLE [dbo].[VR_LorryReceipts]  WITH NOCHECK ADD  CONSTRAINT [FK_VR_LorryReceipts_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[VR_BusinessPartner] ([BPID])
GO
ALTER TABLE [dbo].[VR_LorryReceipts] NOCHECK CONSTRAINT [FK_VR_LorryReceipts_CustomerID]
GO
ALTER TABLE [dbo].[VR_LorryReceipts]  WITH CHECK ADD  CONSTRAINT [FK_VR_LorryReceipts_ExecutionNo] FOREIGN KEY([RequestExecutionNo])
REFERENCES [dbo].[VR_RequestExecution] ([SRNNo])
GO
ALTER TABLE [dbo].[VR_LorryReceipts] CHECK CONSTRAINT [FK_VR_LorryReceipts_ExecutionNo]
GO
ALTER TABLE [dbo].[VR_LorryReceipts]  WITH CHECK ADD  CONSTRAINT [FK_VR_LorryReceipts_LRStatusID] FOREIGN KEY([LRStatusID])
REFERENCES [dbo].[VR_LorryReceiptStatus] ([LRStatusID])
GO
ALTER TABLE [dbo].[VR_LorryReceipts] CHECK CONSTRAINT [FK_VR_LorryReceipts_LRStatusID]
GO
ALTER TABLE [dbo].[VR_LorryReceipts]  WITH CHECK ADD  CONSTRAINT [FK_VR_LorryReceipts_MaterialStatusID] FOREIGN KEY([MaterialStateID])
REFERENCES [dbo].[VR_MaterialStates] ([MaterialStateID])
GO
ALTER TABLE [dbo].[VR_LorryReceipts] CHECK CONSTRAINT [FK_VR_LorryReceipts_MaterialStatusID]
GO
ALTER TABLE [dbo].[VR_LorryReceipts]  WITH CHECK ADD  CONSTRAINT [FK_VR_LorryReceipts_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[VR_LorryReceipts] CHECK CONSTRAINT [FK_VR_LorryReceipts_ProjectID]
GO
ALTER TABLE [dbo].[VR_LorryReceipts]  WITH NOCHECK ADD  CONSTRAINT [FK_VR_LorryReceipts_TransporterID] FOREIGN KEY([TransporterID])
REFERENCES [dbo].[VR_Transporters] ([TransporterID])
GO
ALTER TABLE [dbo].[VR_LorryReceipts] NOCHECK CONSTRAINT [FK_VR_LorryReceipts_TransporterID]
GO
ALTER TABLE [dbo].[VR_LorryReceipts]  WITH CHECK ADD  CONSTRAINT [FK_VR_LorryReceipts_VehicleTypeID] FOREIGN KEY([VehicleTypeID])
REFERENCES [dbo].[VR_VehicleTypes] ([VehicleTypeID])
GO
ALTER TABLE [dbo].[VR_LorryReceipts] CHECK CONSTRAINT [FK_VR_LorryReceipts_VehicleTypeID]
GO
ALTER TABLE [dbo].[VR_LorryReceipts] ADD  CONSTRAINT [DF_VR_LorryReceipts_PaymentMadeAtSite]  DEFAULT ((0)) FOR [PaymentMadeAtSite]
GO
ALTER TABLE [dbo].[VR_LorryReceipts] ADD  CONSTRAINT [DF_VR_LorryReceipts_AmountPaid]  DEFAULT ((0)) FOR [AmountPaid]
GO
ALTER TABLE [dbo].[VR_LorryReceipts] ADD  CONSTRAINT [DF_VR_LorryReceipts_MRNStatus]  DEFAULT ((0)) FOR [LRStatusID]
GO
ALTER TABLE [dbo].[VR_LorryReceipts] ADD  CONSTRAINT [DF_VR_LorryReceipts_OverDimensionConsignment]  DEFAULT (N'NO') FOR [OverDimensionConsignment]
GO
ALTER TABLE [dbo].[VR_LorryReceipts] ADD  CONSTRAINT [DF_VR_LorryReceipts_DetentionAtSite]  DEFAULT (N'NO') FOR [DetentionAtSite]
GO
