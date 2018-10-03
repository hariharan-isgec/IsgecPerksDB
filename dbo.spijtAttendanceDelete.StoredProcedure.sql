USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spijtAttendanceDelete]
  @Original_RecordID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [IJT_Attendance]
  WHERE
  [IJT_Attendance].[RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
