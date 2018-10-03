USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnBalanceTransferDelete]
  @Original_TranType NVarChar(3),
  @Original_SubTranType NVarChar(3),
  @Original_FinYear NVarChar(4),
  @Original_LeaveTypeID NVarChar(2),
  @Original_CardNo NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_LeaveLedger]
  WHERE
  [ATN_LeaveLedger].[TranType] = @Original_TranType
  AND [ATN_LeaveLedger].[SubTranType] = @Original_SubTranType
  AND [ATN_LeaveLedger].[FinYear] = @Original_FinYear
  AND [ATN_LeaveLedger].[LeaveTypeID] = @Original_LeaveTypeID
  AND [ATN_LeaveLedger].[CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
