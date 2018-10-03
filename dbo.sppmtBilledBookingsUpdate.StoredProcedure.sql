USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtBilledBookingsUpdate]
  @Original_BookingID Int, 
  @BillReceived Bit,
  @BillPosted Bit,
  @IRNo Int,
  @IRDt DateTime,
  @StatusID Int,
  @CQDelivered Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PMT_TaxiBooking] SET 
   [BillReceived] = @BillReceived
  ,[BillPosted] = @BillPosted   
  ,[IRNo] = @IRNo
  ,[IRDt] = @IRDt
  ,[StatusID] = @StatusID
  ,[CQDelivered] = @CQDelivered
  WHERE
  [BookingID] = @Original_BookingID
  SET @RowCount = @@RowCount
GO
