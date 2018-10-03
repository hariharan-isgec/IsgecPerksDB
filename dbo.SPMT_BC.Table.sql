USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPMT_BC](
	[BCID] [int] IDENTITY(1,1) NOT NULL,
	[RequestedBy] [nvarchar](8) NOT NULL,
	[RequestedFor] [nvarchar](500) NULL,
	[BookingRQNo] [int] NULL,
	[VendorID] [nvarchar](6) NOT NULL,
	[CreatedBy] [nvarchar](8) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[FromPlaceID] [nvarchar](30) NOT NULL,
	[ToPlaceID] [nvarchar](30) NOT NULL,
	[AirLines] [nvarchar](500) NULL,
	[FlightTime] [datetime] NOT NULL,
	[EstimatedAmount] [decimal](10, 2) NULL,
	[Cancelled] [bit] NOT NULL,
	[CancellationRQNo] [int] NULL,
	[CancelledOn] [datetime] NULL,
	[CancelledBy] [nvarchar](8) NULL,
	[CancellationAmount] [decimal](10, 2) NULL,
	[CancellationRemarks] [nvarchar](500) NULL,
	[BillLinked] [bit] NOT NULL,
	[BillLinkedOn] [datetime] NULL,
	[BillLinkedBy] [nvarchar](8) NULL,
	[BillNo] [nvarchar](100) NULL,
	[BillDate] [datetime] NULL,
	[CancellationBillLinked] [bit] NOT NULL,
	[CancellationBillLinkedBy] [nvarchar](8) NULL,
	[CancellationBillLinkedOn] [datetime] NULL,
	[CancellationBillNo] [nvarchar](100) NULL,
	[CancellationBillDate] [datetime] NULL,
 CONSTRAINT [PK_BCID] PRIMARY KEY CLUSTERED 
(
	[BCID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SPMT_BC]  WITH CHECK ADD  CONSTRAINT [BC_BillLinkedBy] FOREIGN KEY([BillLinkedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_BC] CHECK CONSTRAINT [BC_BillLinkedBy]
GO
ALTER TABLE [dbo].[SPMT_BC]  WITH CHECK ADD  CONSTRAINT [BC_CancellationBillLinkedBy] FOREIGN KEY([CancellationBillLinkedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_BC] CHECK CONSTRAINT [BC_CancellationBillLinkedBy]
GO
ALTER TABLE [dbo].[SPMT_BC]  WITH CHECK ADD  CONSTRAINT [BC_CancelledBy] FOREIGN KEY([CancelledBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_BC] CHECK CONSTRAINT [BC_CancelledBy]
GO
ALTER TABLE [dbo].[SPMT_BC]  WITH CHECK ADD  CONSTRAINT [BC_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_BC] CHECK CONSTRAINT [BC_CreatedBy]
GO
ALTER TABLE [dbo].[SPMT_BC]  WITH CHECK ADD  CONSTRAINT [BC_FromPlaceID] FOREIGN KEY([FromPlaceID])
REFERENCES [dbo].[SPMT_Places] ([PlaceID])
GO
ALTER TABLE [dbo].[SPMT_BC] CHECK CONSTRAINT [BC_FromPlaceID]
GO
ALTER TABLE [dbo].[SPMT_BC]  WITH CHECK ADD  CONSTRAINT [BC_RequestedBy] FOREIGN KEY([RequestedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[SPMT_BC] CHECK CONSTRAINT [BC_RequestedBy]
GO
ALTER TABLE [dbo].[SPMT_BC]  WITH CHECK ADD  CONSTRAINT [BC_ToPlaceID] FOREIGN KEY([ToPlaceID])
REFERENCES [dbo].[SPMT_Places] ([PlaceID])
GO
ALTER TABLE [dbo].[SPMT_BC] CHECK CONSTRAINT [BC_ToPlaceID]
GO
ALTER TABLE [dbo].[SPMT_BC]  WITH CHECK ADD  CONSTRAINT [BC_VendorID] FOREIGN KEY([VendorID])
REFERENCES [dbo].[SPMT_Vendors] ([VendorID])
GO
ALTER TABLE [dbo].[SPMT_BC] CHECK CONSTRAINT [BC_VendorID]
GO
ALTER TABLE [dbo].[SPMT_BC] ADD  CONSTRAINT [DF_SPMT_BC_Cancelled]  DEFAULT ((0)) FOR [Cancelled]
GO
ALTER TABLE [dbo].[SPMT_BC] ADD  CONSTRAINT [DF_SPMT_BC_BillLinked]  DEFAULT ((0)) FOR [BillLinked]
GO
ALTER TABLE [dbo].[SPMT_BC] ADD  CONSTRAINT [DF_SPMT_BC_CancellationBillLinked]  DEFAULT ((0)) FOR [CancellationBillLinked]
GO
