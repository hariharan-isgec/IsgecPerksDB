USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatn_LG_LeaveCardByCardNo1]
  @FinYear NVarChar(4),
  @CardNo NVarChar(8),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ATN_LeaveTypes].[LeaveTypeID],
    [ATN_LeaveTypes].[Sequence],
		[ATN_LeaveTypes].[AdvanceApplicable],
		[ATN_LeaveTypes].[Description], 
		[ATN_LeaveLedger].[TranType], 
		SUM([ATN_LeaveLedger].[InProcessDays]) AS InProcessDays,
		SUM([ATN_LeaveLedger].[Days]) AS Days 
  FROM [ATN_LeaveTypes] 
  LEFT OUTER JOIN [ATN_LeaveLedger] 
    ON  [ATN_LeaveTypes].[LeaveTypeID] = [ATN_LeaveLedger].[LeaveTypeID]
  WHERE
       [ATN_LeaveTypes].[Applyiable] = 1
   AND [ATN_LeaveLedger].[CardNo] = @CardNo
   AND [ATN_LeaveLedger].[FinYear] = @FinYear
 
  GROUP BY 
		[ATN_LeaveTypes].[LeaveTypeID],
        [ATN_LeaveTypes].[Sequence],
		[ATN_LeaveTypes].[AdvanceApplicable],
		[ATN_LeaveTypes].[Description], 
		[ATN_LeaveLedger].[TranType]
  ORDER BY 
        [ATN_LeaveTypes].[Sequence]

  SET @RecordCount = @@RowCount
GO
