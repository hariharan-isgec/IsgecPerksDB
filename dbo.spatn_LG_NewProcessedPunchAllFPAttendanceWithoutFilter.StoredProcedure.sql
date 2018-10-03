USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spatn_LG_NewProcessedPunchAllFPAttendanceWithoutFilter]
  @CardNo NVarChar(8),
  @FinYear NVarChar(4),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
	   [ATN_Attendance].*,
       [ATN_PunchStatus2].[Description] AS ATN_PunchStatus2_Description 
  FROM [ATN_Attendance] 
  INNER JOIN [ATN_PunchStatus] AS [ATN_PunchStatus2]
    ON [ATN_Attendance].[PunchStatusID] = [ATN_PunchStatus2].[PunchStatusID]
  WHERE
      [ATN_Attendance].[CardNo] = @CardNo
  AND [ATN_Attendance].[PunchValue] < 1  
  AND [ATN_Attendance].[Applied] = 0  
  AND ([ATN_Attendance].[Punch1Time] > 0 AND [ATN_Attendance].[Punch2Time] = 0) 
  AND [ATN_Attendance].[FinYear] = @FinYear  
  AND [ATN_Attendance].[AttenDate] >= CONVERT(DATETIME, '01/10/2010',103)  
  ORDER BY [ATN_Attendance].[AttenDate] 

  SET @RecordCount = @@RowCount
GO
