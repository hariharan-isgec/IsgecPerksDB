USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPMT_FE](
	[FEID] [int] IDENTITY(1,1) NOT NULL,
	[RequestedBy] [nvarchar](8) NOT NULL,
	[ContactDetails] [nvarchar](100) NULL,
	[RequestedFor] [nvarchar](500) NULL,
	[Nationality] [nvarchar](30) NULL,
	[PassportNumber] [nvarchar](20) NULL,
	[PlaceOfIssue] [nvarchar](30) NULL,
	[DateOfIssue] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
	[ExchangeAmountRequired] [decimal](6, 0) NOT NULL,
	[RequiredOn] [datetime] NOT NULL,
	[FOREXTypeID] [nvarchar](20) NOT NULL,
	[IBRRate] [decimal](6, 2) NOT NULL,
	[TimeOfBooking] [datetime] NOT NULL,
	[PayableRate] [decimal](6, 2) NOT NULL,
	[DiscountPerUnit] [decimal](6, 2) NOT NULL,
	[DiscountLimitAmount] [decimal](6, 2) NOT NULL,
	[EstimatedPayableAmount] [decimal](10, 2) NULL,
	[PlaceToBeVisited] [nvarchar](30) NULL,
	[DurationOfVisit] [decimal](3, 0) NOT NULL,
	[TotalExpenditure] [decimal](8, 2) NOT NULL,
	[BookingRQNo] [int] NULL,
	[VendorID] [nvarchar](6) NOT NULL,
	[CreatedBy] [nvarchar](8) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
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
 CONSTRAINT [PK_SPMT_FE] PRIMARY KEY CLUSTERED 
(
	[FEID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SPMT_FE]  WITH CHECK ADD  CONSTRAINT [FE_BillLinkedBy] FOREIGN KEY([BillLinkedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_FE] CHECK CONSTRAINT [FE_BillLinkedBy]
GO
ALTER TABLE [dbo].[SPMT_FE]  WITH CHECK ADD  CONSTRAINT [FE_CancellationBillLinkedBy] FOREIGN KEY([CancellationBillLinkedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_FE] CHECK CONSTRAINT [FE_CancellationBillLinkedBy]
GO
ALTER TABLE [dbo].[SPMT_FE]  WITH CHECK ADD  CONSTRAINT [FE_CancelledBy] FOREIGN KEY([CancelledBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_FE] CHECK CONSTRAINT [FE_CancelledBy]
GO
ALTER TABLE [dbo].[SPMT_FE]  WITH CHECK ADD  CONSTRAINT [FE_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_FE] CHECK CONSTRAINT [FE_CreatedBy]
GO
ALTER TABLE [dbo].[SPMT_FE]  WITH CHECK ADD  CONSTRAINT [FE_ForexTypeID] FOREIGN KEY([FOREXTypeID])
REFERENCES [dbo].[SPMT_ForexTypes] ([FOREXTypeID])
GO
ALTER TABLE [dbo].[SPMT_FE] CHECK CONSTRAINT [FE_ForexTypeID]
GO
ALTER TABLE [dbo].[SPMT_FE]  WITH CHECK ADD  CONSTRAINT [FE_PlaceOfIssue] FOREIGN KEY([PlaceOfIssue])
REFERENCES [dbo].[SPMT_Places] ([PlaceID])
GO
ALTER TABLE [dbo].[SPMT_FE] CHECK CONSTRAINT [FE_PlaceOfIssue]
GO
ALTER TABLE [dbo].[SPMT_FE]  WITH CHECK ADD  CONSTRAINT [FE_PlaceToBeVisited] FOREIGN KEY([PlaceToBeVisited])
REFERENCES [dbo].[SPMT_Places] ([PlaceID])
GO
ALTER TABLE [dbo].[SPMT_FE] CHECK CONSTRAINT [FE_PlaceToBeVisited]
GO
ALTER TABLE [dbo].[SPMT_FE]  WITH CHECK ADD  CONSTRAINT [FE_RequestedBy] FOREIGN KEY([RequestedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[SPMT_FE] CHECK CONSTRAINT [FE_RequestedBy]
GO
ALTER TABLE [dbo].[SPMT_FE]  WITH CHECK ADD  CONSTRAINT [FE_VendorID] FOREIGN KEY([VendorID])
REFERENCES [dbo].[SPMT_Vendors] ([VendorID])
GO
ALTER TABLE [dbo].[SPMT_FE] CHECK CONSTRAINT [FE_VendorID]
GO
ALTER TABLE [dbo].[SPMT_FE] ADD  CONSTRAINT [DF_SPMT_FE_DurationOfVisit]  DEFAULT ((0)) FOR [DurationOfVisit]
GO
ALTER TABLE [dbo].[SPMT_FE] ADD  CONSTRAINT [DF_SPMT_FE_TotalExpenditure]  DEFAULT ((0)) FOR [TotalExpenditure]
GO
ALTER TABLE [dbo].[SPMT_FE] ADD  CONSTRAINT [DF_SPMT_FE_Cancelled]  DEFAULT ((0)) FOR [Cancelled]
GO
ALTER TABLE [dbo].[SPMT_FE] ADD  CONSTRAINT [DF_SPMT_FE_BillLinked]  DEFAULT ((0)) FOR [BillLinked]
GO
ALTER TABLE [dbo].[SPMT_FE] ADD  CONSTRAINT [DF_SPMT_FE_CancellationBillLinked]  DEFAULT ((0)) FOR [CancellationBillLinked]
GO
