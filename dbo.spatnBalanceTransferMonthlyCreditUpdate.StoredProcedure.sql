USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnBalanceTransferMonthlyCreditUpdate]
  @Original_TranType NVarChar(3), 
  @Original_SubTranType NVarChar(3), 
  @Original_FinYear NVarChar(4), 
  @Original_LeaveTypeID NVarChar(2), 
  @Original_CardNo NVarChar(8), 
  @RecordID Int,
  @TranDate DateTime,
  @Days Decimal(6,2),
  @Remarks NVarChar(256),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_LeaveLedger] SET 
  --[TranDate] = @TranDate
   [Days] = @Days
  ,[Remarks] = @Remarks
  WHERE
  [RecordID] = @RecordID 
  SET @RowCount = @@RowCount
GO
