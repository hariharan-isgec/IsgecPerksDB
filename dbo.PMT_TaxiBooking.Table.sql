USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PMT_TaxiBooking](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[RequestedBy] [nvarchar](8) NOT NULL,
	[RequestedOn] [datetime] NOT NULL,
	[BookedFor] [nvarchar](250) NOT NULL,
	[FromDate] [datetime] NULL,
	[TillDate] [datetime] NULL,
	[FromPlace] [nvarchar](30) NULL,
	[ToPlace] [nvarchar](30) NULL,
	[TaxiReportingTime] [datetime] NULL,
	[VendorID] [nvarchar](6) NULL,
	[VehicleID] [nvarchar](30) NULL,
	[EstimatedAmount] [decimal](10, 2) NULL,
	[BookedOn] [datetime] NULL,
	[BookedBy] [nvarchar](8) NULL,
	[BillReceived] [bit] NOT NULL,
	[IRNo] [int] NULL,
	[IRDt] [datetime] NULL,
	[BillPosted] [bit] NOT NULL,
	[CQReceived] [bit] NOT NULL,
	[CQDelivered] [bit] NOT NULL,
	[StatusID] [int] NULL,
 CONSTRAINT [PK_PMT_TaxiBooking] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PMT_TaxiBooking]  WITH CHECK ADD  CONSTRAINT [FK_PMT_TaxiBooking_HRM_Employees] FOREIGN KEY([RequestedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[PMT_TaxiBooking] CHECK CONSTRAINT [FK_PMT_TaxiBooking_HRM_Employees]
GO
ALTER TABLE [dbo].[PMT_TaxiBooking]  WITH CHECK ADD  CONSTRAINT [FK_PMT_TaxiBooking_HRM_Employees1] FOREIGN KEY([BookedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[PMT_TaxiBooking] CHECK CONSTRAINT [FK_PMT_TaxiBooking_HRM_Employees1]
GO
ALTER TABLE [dbo].[PMT_TaxiBooking]  WITH CHECK ADD  CONSTRAINT [FK_PMT_TaxiBooking_PMT_BookingStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[PMT_BookingStatus] ([StatusID])
GO
ALTER TABLE [dbo].[PMT_TaxiBooking] CHECK CONSTRAINT [FK_PMT_TaxiBooking_PMT_BookingStatus]
GO
ALTER TABLE [dbo].[PMT_TaxiBooking]  WITH CHECK ADD  CONSTRAINT [FK_PMT_TaxiBooking_PMT_Places] FOREIGN KEY([FromPlace])
REFERENCES [dbo].[PMT_Places] ([PlaceID])
GO
ALTER TABLE [dbo].[PMT_TaxiBooking] CHECK CONSTRAINT [FK_PMT_TaxiBooking_PMT_Places]
GO
ALTER TABLE [dbo].[PMT_TaxiBooking]  WITH CHECK ADD  CONSTRAINT [FK_PMT_TaxiBooking_PMT_Places1] FOREIGN KEY([ToPlace])
REFERENCES [dbo].[PMT_Places] ([PlaceID])
GO
ALTER TABLE [dbo].[PMT_TaxiBooking] CHECK CONSTRAINT [FK_PMT_TaxiBooking_PMT_Places1]
GO
ALTER TABLE [dbo].[PMT_TaxiBooking]  WITH CHECK ADD  CONSTRAINT [FK_PMT_TaxiBooking_PMT_Vehicle] FOREIGN KEY([VehicleID])
REFERENCES [dbo].[PMT_Vehicle] ([VehicleID])
GO
ALTER TABLE [dbo].[PMT_TaxiBooking] CHECK CONSTRAINT [FK_PMT_TaxiBooking_PMT_Vehicle]
GO
ALTER TABLE [dbo].[PMT_TaxiBooking]  WITH CHECK ADD  CONSTRAINT [FK_PMT_TaxiBooking_PMT_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[PMT_Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[PMT_TaxiBooking] CHECK CONSTRAINT [FK_PMT_TaxiBooking_PMT_Vendor]
GO
ALTER TABLE [dbo].[PMT_TaxiBooking] ADD  CONSTRAINT [DF_PMT_TaxiBooking_BillReceived]  DEFAULT ((0)) FOR [BillReceived]
GO
ALTER TABLE [dbo].[PMT_TaxiBooking] ADD  CONSTRAINT [DF_PMT_TaxiBooking_BillPosted]  DEFAULT ((0)) FOR [BillPosted]
GO
ALTER TABLE [dbo].[PMT_TaxiBooking] ADD  CONSTRAINT [DF_PMT_TaxiBooking_CQReceived]  DEFAULT ((0)) FOR [CQReceived]
GO
ALTER TABLE [dbo].[PMT_TaxiBooking] ADD  CONSTRAINT [DF_PMT_TaxiBooking_CQDelivered]  DEFAULT ((0)) FOR [CQDelivered]
GO
