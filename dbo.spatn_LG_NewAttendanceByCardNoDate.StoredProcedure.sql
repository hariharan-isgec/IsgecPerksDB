USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spatn_LG_NewAttendanceByCardNoDate]
  @CardNo NVarChar(8),
  @AttenDate DateTime
  AS
  SELECT
		[ATN_Attendance].*   
  FROM [ATN_Attendance] 
  WHERE 
      [ATN_Attendance].[CardNo] = @CardNo
  AND [ATN_Attendance].[AttenDate] = @AttenDate
GO
