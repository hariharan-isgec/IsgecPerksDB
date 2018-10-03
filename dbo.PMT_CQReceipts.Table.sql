USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PMT_CQReceipts](
	[CQRNo] [int] IDENTITY(1,1) NOT NULL,
	[CQRDt] [datetime] NOT NULL,
	[VendorID] [nvarchar](6) NOT NULL,
	[CQNumber] [nvarchar](50) NULL,
	[CQDate] [datetime] NULL,
	[CQAmount] [decimal](10, 2) NULL,
	[Delivered] [bit] NOT NULL,
	[DeliveredOn] [datetime] NULL,
	[Remarks] [nvarchar](250) NULL,
	[StatusID] [int] NULL,
 CONSTRAINT [PK_PMT_CQReceipts] PRIMARY KEY CLUSTERED 
(
	[CQRNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PMT_CQReceipts]  WITH CHECK ADD  CONSTRAINT [FK_PMT_CQReceipts_PMT_BookingStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[PMT_BookingStatus] ([StatusID])
GO
ALTER TABLE [dbo].[PMT_CQReceipts] CHECK CONSTRAINT [FK_PMT_CQReceipts_PMT_BookingStatus]
GO
ALTER TABLE [dbo].[PMT_CQReceipts]  WITH CHECK ADD  CONSTRAINT [FK_PMT_CQReceipts_PMT_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[PMT_Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[PMT_CQReceipts] CHECK CONSTRAINT [FK_PMT_CQReceipts_PMT_Vendor]
GO
ALTER TABLE [dbo].[PMT_CQReceipts] ADD  CONSTRAINT [DF_PMT_CQReceipts_Delivered]  DEFAULT ((0)) FOR [Delivered]
GO
