USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmSchedulesDelete]
  @Original_ScheduleID NVarChar(20),
  @RowCount int = null OUTPUT
  AS
  DELETE [ADM_Schedules]
  WHERE
  [ADM_Schedules].[ScheduleID] = @Original_ScheduleID
  SET @RowCount = @@RowCount
GO
