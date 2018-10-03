USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spatn_LG_NewAttendanceByCardNoDateRange]
  @FCardNo NVarChar(8),
  @FAttenDate DateTime,
  @TCardNo NVarChar(8),
  @TAttenDate DateTime,
  @OrderBy NVarChar(50)   
AS
BEGIN
  SELECT
		[ATN_Attendance].*   
  FROM [ATN_Attendance] 
  WHERE 
      ([ATN_Attendance].[CardNo] >= @FCardNo 
  AND [ATN_Attendance].[CardNo] <= @TCardNo) 
  AND ([ATN_Attendance].[AttenDate] >= @FAttenDate
  AND [ATN_Attendance].[AttenDate] <= @TAttenDate) 
  AND ([ATN_Attendance].[Punch1Time] > 0)

  ORDER BY 
     CASE @orderBy WHEN 'Summary' THEN (RANK() OVER(ORDER BY [ATN_Attendance].[AttenDate], [ATN_Attendance].[CardNo])) END,
     CASE @orderBy WHEN 'Detail' THEN (RANK() OVER(ORDER BY [ATN_Attendance].[CardNo], [ATN_Attendance].[AttenDate])) END 

		RETURN @@RowCount
  END
GO
