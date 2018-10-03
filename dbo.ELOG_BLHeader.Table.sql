USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ELOG_BLHeader](
	[BLID] [nvarchar](9) NOT NULL,
	[BLNumber] [nvarchar](50) NULL,
	[BLDate] [datetime] NULL,
	[PortOfLoading] [nvarchar](100) NULL,
	[VesselOrFlightNo] [nvarchar](100) NULL,
	[VoyageNo] [nvarchar](100) NULL,
	[TransShipmentPortID] [int] NULL,
	[PrepaidFlight] [bit] NULL,
	[ShippingLine] [nvarchar](100) NULL,
	[SOBDate] [datetime] NULL,
	[MBLNo] [nvarchar](50) NULL,
	[PreCarriageBy] [nvarchar](100) NULL,
	[PlaceOfReceiptBy] [nvarchar](100) NULL,
	[Air1Freight] [nvarchar](100) NULL,
	[Air2Freight] [nvarchar](100) NULL,
	[Air3Freight] [nvarchar](100) NULL,
	[Air4Freight] [nvarchar](100) NULL,
 CONSTRAINT [PK_ELOG_BLHeader] PRIMARY KEY CLUSTERED 
(
	[BLID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ELOG_BLHeader]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_BLHeader_TransShipmentPortID] FOREIGN KEY([TransShipmentPortID])
REFERENCES [dbo].[ELOG_Ports] ([PortID])
GO
ALTER TABLE [dbo].[ELOG_BLHeader] CHECK CONSTRAINT [FK_ELOG_BLHeader_TransShipmentPortID]
GO
