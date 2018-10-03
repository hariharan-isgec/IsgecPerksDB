USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPMT_RTaxi](
	[RequestID] [int] NOT NULL,
	[FromDate] [datetime] NULL,
	[TillDate] [datetime] NULL,
	[TaxiReportingTime] [datetime] NULL,
	[TaxiReleasingTime] [datetime] NULL,
	[FromPlaceID] [nvarchar](30) NULL,
	[ToPlaceID] [nvarchar](30) NULL,
	[VehicleID] [nvarchar](20) NULL
) ON [PRIMARY]
GO
