USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatn_LG_LeaveCardByCardNo]
  @FinYear NVarChar(4),
  @CardNo NVarChar(8),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ATN_LeaveLedger].[LeaveTypeID],
		SUM([ATN_LeaveLedger].[InProcessDays]) AS InProcessDays,
		SUM([ATN_LeaveLedger].[Days]) AS Days,
		[ATN_LeaveTypes3].[Description] AS ATN_LeaveTypes3_Description
  FROM [ATN_LeaveLedger] 
  INNER JOIN [ATN_LeaveTypes] AS [ATN_LeaveTypes3]
    ON [ATN_LeaveLedger].[LeaveTypeID] = [ATN_LeaveTypes3].[LeaveTypeID]
  WHERE
       [ATN_LeaveLedger].[CardNo] = @CardNo
  AND [ATN_LeaveLedger].[FinYear] = @FinYear
  AND [ATN_LeaveTypes3].[Applyiable] = 1
  GROUP BY 
		[ATN_LeaveLedger].[LeaveTypeID],
		[ATN_LeaveTypes3].[Description]

  SET @RecordCount = @@RowCount
GO
