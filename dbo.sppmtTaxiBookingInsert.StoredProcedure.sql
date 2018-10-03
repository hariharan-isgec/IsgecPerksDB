USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtTaxiBookingInsert]
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
  @Return_BookingID Int = null OUTPUT
  AS
  INSERT [PMT_TaxiBooking]
  (
   [RequestedBy]
  ,[RequestedOn]
  ,[BookedFor]
  ,[FromDate]
  ,[TillDate]
  ,[FromPlace]
  ,[ToPlace]
  ,[TaxiReportingTime]
  ,[VendorID]
  ,[VehicleID]
  ,[EstimatedAmount]
  ,[BookedBy]
  ,[BookedOn]
  ,[StatusID]
  )
  VALUES
  (
   @RequestedBy
  ,@RequestedOn
  ,@BookedFor
  ,@FromDate
  ,@TillDate
  ,@FromPlace
  ,@ToPlace
  ,@TaxiReportingTime
  ,@VendorID
  ,@VehicleID
  ,@EstimatedAmount
  ,@BookedBy
  ,@BookedOn
  ,@StatusID
  )
  SET @Return_BookingID = Scope_Identity()
GO
