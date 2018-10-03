USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatn_LG_GetOPBRecordForMonth]
  @CardNo NVarChar(8),
  @SubTranType NvarChar(2), 
  @ForMonth Int,
  @FinYear NVarChar(4)  
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
  WHERE [ATN_LeaveLedger].[TranType] = 'OPB'   
    AND [ATN_LeaveLedger].[SubTranType] = @SubTranType      
    AND [ATN_LeaveLedger].[FinYear] = @FinYear
    AND [ATN_LeaveLedger].[CardNo] = @CardNo   
    AND MONTH([ATN_LeaveLedger].[TranDate]) = @ForMonth
GO
