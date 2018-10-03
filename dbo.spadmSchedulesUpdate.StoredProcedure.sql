USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmSchedulesUpdate]
  @Original_ScheduleID NVarChar(20), 
  @Description NVarChar(20),
  @FixDate Bit,
  @DaysOrDate Int,
  @IncludeHolidays Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [ADM_Schedules] SET 
   [Description] = @Description
  ,[FixDate] = @FixDate
  ,[DaysOrDate] = @DaysOrDate
  ,[IncludeHolidays] = @IncludeHolidays
  WHERE
  [ScheduleID] = @Original_ScheduleID
  SET @RowCount = @@RowCount
GO
