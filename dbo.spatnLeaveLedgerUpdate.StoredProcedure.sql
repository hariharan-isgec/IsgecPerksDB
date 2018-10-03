USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnLeaveLedgerUpdate]
  @TranType NVarChar(3),
  @TranDate DateTime,
  @CardNo NVarChar(8),
  @LeaveTypeID NVarChar(2),
  @InProcessDays Decimal(6,2),
  @Days Decimal(6,2),
  @FinYear NVarChar(4),
  @ApplHeaderID Int,
  @ApplDetailID Int,
  @Original_RecordID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_LeaveLedger] SET 
   [TranType] = @TranType
  ,[TranDate] = @TranDate 
  ,[CardNo] = @CardNo
  ,[LeaveTypeID] = @LeaveTypeID
  ,[InProcessDays] = @InProcessDays
  ,[Days] = @Days
  ,[FinYear] = @FinYear
  ,[ApplHeaderID] = @ApplHeaderID
  ,[ApplDetailID] = @ApplDetailID
  WHERE
  [RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
