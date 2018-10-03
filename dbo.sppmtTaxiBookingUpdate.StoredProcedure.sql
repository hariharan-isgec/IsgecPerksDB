USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtTaxiBookingUpdate]
  @Original_BookingID Int, 
  @RequestedBy NVarChar(8),
  @RequestedOn DateTime,
  @BookedFor NVarChar(250),
  @FromDate DateTime,
  @TillDate DateTime,
  @FromPlace NVarChar(30),
  @ToPlace NVarChar(30),
  @TaxiReportingTime DateTime,
  @VendorID NVarChar(6),
  @VehicleID NVarChar(30),
  @EstimatedAmount Decimal(10,2),
  @BookedBy NVarChar(8),
  @BookedOn DateTime,
  @StatusID Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PMT_TaxiBooking] SET 
   [RequestedBy] = @RequestedBy
  ,[RequestedOn] = @RequestedOn
  ,[BookedFor] = @BookedFor
  ,[FromDate] = @FromDate
  ,[TillDate] = @TillDate
  ,[FromPlace] = @FromPlace
  ,[ToPlace] = @ToPlace
  ,[TaxiReportingTime] = @TaxiReportingTime
  ,[VendorID] = @VendorID
  ,[VehicleID] = @VehicleID
  ,[EstimatedAmount] = @EstimatedAmount
  ,[BookedBy] = @BookedBy
  ,[BookedOn] = @BookedOn
  ,[StatusID] = @StatusID
  WHERE
  [BookingID] = @Original_BookingID
  SET @RowCount = @@RowCount
GO
