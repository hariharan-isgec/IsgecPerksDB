USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PMT_IRDocs](
	[IRNo] [int] IDENTITY(1,1) NOT NULL,
	[ReceivedOn] [datetime] NOT NULL,
	[VendorID] [nvarchar](6) NOT NULL,
	[VendorBillNo] [nvarchar](30) NOT NULL,
	[VendorBillDate] [datetime] NULL,
	[BillDistance] [decimal](10, 2) NULL,
	[BillHours] [decimal](10, 2) NULL,
	[BillAmount] [decimal](10, 2) NULL,
	[PassedDistance] [decimal](10, 2) NULL,
	[PassedHours] [decimal](10, 2) NULL,
	[PassedAmount] [decimal](10, 2) NULL,
	[Remarks] [nvarchar](250) NULL,
	[BillCorrected] [bit] NOT NULL,
	[PostedInBaaN] [bit] NOT NULL,
	[PostedOn] [datetime] NULL,
	[PostedBy] [nvarchar](8) NULL,
	[BatchNo] [nvarchar](6) NULL,
	[VoucherNo] [nvarchar](8) NULL,
	[VoucherLineNo] [nvarchar](50) NULL,
	[CQReceived] [bit] NOT NULL,
	[CQRNo] [int] NULL,
	[CQRDt] [datetime] NULL,
	[StatusID] [int] NULL,
 CONSTRAINT [PK_PMT_IRDocs] PRIMARY KEY CLUSTERED 
(
	[IRNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PMT_IRDocs]  WITH CHECK ADD  CONSTRAINT [FK_PMT_IRDocs_HRM_Employees] FOREIGN KEY([PostedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[PMT_IRDocs] CHECK CONSTRAINT [FK_PMT_IRDocs_HRM_Employees]
GO
ALTER TABLE [dbo].[PMT_IRDocs]  WITH CHECK ADD  CONSTRAINT [FK_PMT_IRDocs_PMT_BookingStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[PMT_BookingStatus] ([StatusID])
GO
ALTER TABLE [dbo].[PMT_IRDocs] CHECK CONSTRAINT [FK_PMT_IRDocs_PMT_BookingStatus]
GO
ALTER TABLE [dbo].[PMT_IRDocs]  WITH CHECK ADD  CONSTRAINT [FK_PMT_IRDocs_PMT_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[PMT_Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[PMT_IRDocs] CHECK CONSTRAINT [FK_PMT_IRDocs_PMT_Vendor]
GO
ALTER TABLE [dbo].[PMT_IRDocs] ADD  CONSTRAINT [DF_PMT_IRDocs_BillCorrected]  DEFAULT ((0)) FOR [BillCorrected]
GO
ALTER TABLE [dbo].[PMT_IRDocs] ADD  CONSTRAINT [DF_PMT_IRDocs_PostedInBaaN]  DEFAULT ((0)) FOR [PostedInBaaN]
GO
ALTER TABLE [dbo].[PMT_IRDocs] ADD  CONSTRAINT [DF_PMT_IRDocs_CQReceived]  DEFAULT ((0)) FOR [CQReceived]
GO
ALTER TABLE [dbo].[PMT_IRDocs] ADD  CONSTRAINT [DF_PMT_IRDocs_StatusID]  DEFAULT ((2)) FOR [StatusID]
GO
