USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtTaxiBookingDelete]
  @Original_BookingID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PMT_TaxiBooking]
  WHERE
  [PMT_TaxiBooking].[BookingID] = @Original_BookingID
  SET @RowCount = @@RowCount
GO
