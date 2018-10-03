USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spatn_LG_NewProcessedPunchAllIncompleteAttendanceWithoutFilter]
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
  AND [ATN_Attendance].[PunchStatusID] != 'TS' 
  --AND ((MONTH([ATN_Attendance].[AttenDate]) >= MONTH(GETDATE()) - 2 AND YEAR([ATN_Attendance].[AttenDate]) = YEAR(GETDATE()) OR (MONTH([ATN_Attendance].[AttenDate]) >= MONTH(GETDATE()) + 10 AND YEAR([ATN_Attendance].[AttenDate]) < YEAR(GETDATE()) )) )  
  AND [ATN_Attendance].[FinYear] = @FinYear  
  ORDER BY [ATN_Attendance].[AttenDate] 

  SET @RecordCount = @@RowCount


-- For the time being Last 2 month's filter is applied here also
-- To ease entry done by Sangeeta
GO
