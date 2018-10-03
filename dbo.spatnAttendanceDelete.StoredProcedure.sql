USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnAttendanceDelete]
  @Original_AttenID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_Attendance]
  WHERE
  [ATN_Attendance].[AttenID] = @Original_AttenID
  SET @RowCount = @@RowCount
GO
