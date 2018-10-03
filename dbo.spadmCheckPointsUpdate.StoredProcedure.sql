USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spadmCheckPointsUpdate]
  @Original_CheckPointID Int, 
  @Descriptions NVarChar(50),
  @ScheduleID NVarChar(20),
  @StartDate DateTime,
  @DayOfSchedule Int,
  @Floating Bit,
  @LastGeneratedOn DateTime,
  @LastEntryUpdated Bit,
  @LastEntryUpdatedOn DateTime,
  @Initiator NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ADM_CheckPoints] SET 
   [Descriptions] = @Descriptions
  ,[ScheduleID] = @ScheduleID
  ,[StartDate] = @StartDate
  ,[DayOfSchedule] = @DayOfSchedule
  ,[Floating] = @Floating
  ,[LastGeneratedOn] = @LastGeneratedOn
  ,[LastEntryUpdated] = @LastEntryUpdated
  ,[LastEntryUpdatedOn] = @LastEntryUpdatedOn
  ,[Initiator] = @Initiator
  WHERE
  [CheckPointID] = @Original_CheckPointID
  SET @RowCount = @@RowCount
GO
