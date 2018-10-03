USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spatnNewAttendanceSelectByID]
  @AttenID Int
  AS
  SELECT
		[ATN_Attendance].*  
  FROM [ATN_Attendance] 
  WHERE
  [ATN_Attendance].[AttenID] = @AttenID
GO
