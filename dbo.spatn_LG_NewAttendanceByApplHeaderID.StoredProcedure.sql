USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spatn_LG_NewAttendanceByApplHeaderID]
  @ApplHeaderID Int,
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT 
		[ATN_Attendance].*   
  FROM [ATN_Attendance] 
  WHERE
  [ATN_Attendance].[ApplHeaderID] = @ApplHeaderID  
  ORDER BY [ATN_Attendance].[AttenDate]
   
  SET @RecordCount = @@RowCount
GO
