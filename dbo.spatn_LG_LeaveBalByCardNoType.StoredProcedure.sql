USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatn_LG_LeaveBalByCardNoType]
  @FinYear NVarChar(4),
  @CardNo NVarChar(8),
  @LeaveType NVarChar(2),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ATN_LeaveLedger].[LeaveTypeID],
		SUM([ATN_LeaveLedger].[Days]) AS Balance 
  FROM [ATN_LeaveLedger] 
  WHERE
       [ATN_LeaveLedger].[CardNo] = @CardNo
  AND [ATN_LeaveLedger].[LeaveTypeID] = @LeaveType
  AND [ATN_LeaveLedger].[FinYear] = @FinYear
  GROUP BY 
		[ATN_LeaveLedger].[LeaveTypeID]

  SET @RecordCount = @@RowCount
GO
