USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtUnbilledBookingsUpdate]
  @Original_BookingID Int, 
  @BillReceived Bit,
  @IRNo Int,
  @IRDt DateTime,
  @StatusID Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PMT_TaxiBooking] SET 
   [BillReceived] = @BillReceived
  ,[IRNo] = @IRNo
  ,[IRDt] = @IRDt
  ,[StatusID] = @StatusID
  WHERE
  [BookingID] = @Original_BookingID
  SET @RowCount = @@RowCount
GO
