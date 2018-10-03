USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spatn_LG_LeaveLedgerByApplDetailID]
  @ApplDetailID Int
  AS
  SELECT
		[ATN_LeaveLedger].[RecordID],
		[ATN_LeaveLedger].[TranType],
		[ATN_LeaveLedger].[TranDate],
		[ATN_LeaveLedger].[CardNo],
		[ATN_LeaveLedger].[LeaveTypeID],
		[ATN_LeaveLedger].[InProcessDays],
		[ATN_LeaveLedger].[Days],
		[ATN_LeaveLedger].[FinYear],
		[ATN_LeaveLedger].[ApplHeaderID],
		[ATN_LeaveLedger].[ApplDetailID]
  FROM [ATN_LeaveLedger]  
  WHERE
  [ATN_LeaveLedger].[ApplDetailID] = @ApplDetailID
GO
