USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spatn_LG_UnVerifiedSiteAttendance]
  @CardNo NVarChar(8),
  @DataMonth Int,
  @FinYear NVarChar(4) 
  AS
  SELECT
	   [ATN_Attendance].* 
  FROM [ATN_Attendance] 
  WHERE 
      [ATN_Attendance].[CardNo] = @CardNo
  AND MONTH([ATN_Attendance].[AttenDate]) = @DataMonth    
  AND [ATN_Attendance].[FinYear] = @FinYear  
  AND [ATN_Attendance].[SiteAttendance] = 1    
  AND [ATN_Attendance].[SiteAttendanceVerified] = 0    
  AND [ATN_Attendance].[FinYear] = @FinYear
GO
