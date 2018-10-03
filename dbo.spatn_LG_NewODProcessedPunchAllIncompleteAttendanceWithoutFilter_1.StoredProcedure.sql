USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spatn_LG_NewODProcessedPunchAllIncompleteAttendanceWithoutFilter_1]
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
  AND (([ATN_Attendance].[Punch1Time] > 0 AND [ATN_Attendance].[Punch2Time] = 0 ) OR ([ATN_Attendance].[Punch1Time] = 0 AND [ATN_Attendance].[Punch2Time] > 0 ))
  AND [ATN_Attendance].[FinYear] = @FinYear  
  AND [ATN_Attendance].[AttenDate] >= CONVERT(DATETIME, '01/10/2010',103)  
  ORDER BY [ATN_Attendance].[AttenDate] 

  SET @RecordCount = @@RowCount

--  This is reverted on 22-12-2010, As HR needs to regularize SINGLE Punch as OD.
--  This is irrrespective of Punch Time.
--  AND (([ATN_Attendance].[Punch1Time] > 0 AND [ATN_Attendance].[Punch2Time] > 0 ) OR ([ATN_Attendance].[Punch1Time] = 0 AND [ATN_Attendance].[Punch2Time] = 0 ))
GO
EXEC sys.sp_addextendedproperty @name=N'HS Need', @value=N'To Regularize single Punch in to OD by HS Only' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spatn_LG_NewODProcessedPunchAllIncompleteAttendanceWithoutFilter_1'
GO
