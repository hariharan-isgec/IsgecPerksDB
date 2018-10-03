USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmSchedulesInsert]
  @ScheduleID NVarChar(20),
  @Description NVarChar(20),
  @FixDate Bit,
  @DaysOrDate Int,
  @IncludeHolidays Bit,
  @Return_ScheduleID NVarChar(20) = null OUTPUT
  AS
  INSERT [ADM_Schedules]
  (
   [ScheduleID]
  ,[Description]
  ,[FixDate]
  ,[DaysOrDate]
  ,[IncludeHolidays]
  )
  VALUES
  (
   @ScheduleID
  ,@Description
  ,@FixDate
  ,@DaysOrDate
  ,@IncludeHolidays
  )
  SET @Return_ScheduleID = @ScheduleID
GO
