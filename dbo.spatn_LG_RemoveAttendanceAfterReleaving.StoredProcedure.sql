USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatn_LG_RemoveAttendanceAfterReleaving]
  @CardNo NVarChar(8),
  @C_DateOfReleaving DateTime,
  @C_DateOfJoining DateTime  
  AS
  DELETE 
  FROM [ATN_Attendance] 
  WHERE 
      [ATN_Attendance].[CardNo] = @CardNo
  AND ([ATN_Attendance].[AttenDate] > @C_DateOfReleaving OR [ATN_Attendance].[AttenDate] < @C_DateOfJoining)
  AND  [ATN_Attendance].[Applied] = 0
GO
