USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnBalanceTransferSelectByID]
  @TranType NVarChar(3),
  @SubTranType NVarChar(3),
  @FinYear NVarChar(4),
  @LeaveTypeID NVarChar(2),
  @CardNo NVarChar(8) 
  AS
  SELECT
		[ATN_LeaveLedger].[RecordID],
		[ATN_LeaveLedger].[TranType],
		[ATN_LeaveLedger].[SubTranType],
		[ATN_LeaveLedger].[FinYear],
		[ATN_LeaveLedger].[LeaveTypeID],
		[ATN_LeaveLedger].[CardNo],
		[ATN_LeaveLedger].[TranDate],
		[ATN_LeaveLedger].[Days],
		[ATN_LeaveLedger].[Remarks] 
  FROM [ATN_LeaveLedger] 
  WHERE
  [ATN_LeaveLedger].[TranType] = @TranType
  AND [ATN_LeaveLedger].[SubTranType] = @SubTranType
  AND [ATN_LeaveLedger].[FinYear] = @FinYear
  AND [ATN_LeaveLedger].[LeaveTypeID] = @LeaveTypeID
  AND [ATN_LeaveLedger].[CardNo] = @CardNo
GO
