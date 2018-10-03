USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spadmCheckPointsInsert]
  @Descriptions NVarChar(50),
  @ScheduleID NVarChar(20),
  @StartDate DateTime,
  @DayOfSchedule Int,
  @Floating Bit,
  @LastGeneratedOn DateTime,
  @LastEntryUpdated Bit,
  @LastEntryUpdatedOn DateTime,
  @Initiator NVarChar(8),
  @Return_CheckPointID Int = null OUTPUT
  AS
  INSERT [ADM_CheckPoints]
  (
   [Descriptions]
  ,[ScheduleID]
  ,[StartDate]
  ,[DayOfSchedule]
  ,[Floating]
  ,[LastGeneratedOn]
  ,[LastEntryUpdated]
  ,[LastEntryUpdatedOn]
  ,[Initiator]
  )
  VALUES
  (
   @Descriptions
  ,@ScheduleID
  ,@StartDate
  ,@DayOfSchedule
  ,@Floating
  ,@LastGeneratedOn
  ,@LastEntryUpdated
  ,@LastEntryUpdatedOn
  ,@Initiator
  )
  SET @Return_CheckPointID = Scope_Identity()
GO
