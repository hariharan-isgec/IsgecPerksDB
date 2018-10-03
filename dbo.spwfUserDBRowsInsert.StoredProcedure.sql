USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfUserDBRowsInsert]
  @UserID NVarChar(8),
  @DashboardID Int,
  @DBRows Int,
  @Active Bit,
  @ActionAllowed Bit,
  @UpdateAllowed Bit,
  @RunDate DateTime,
  @NextRunDate DateTime,
  @ReminderMaxDBDataID Int,
  @ReminderLapsDaysMax Int,
  @ReminderFrequencyDays Int,
  @ReminderCountDBDataID Int,
  @ReminderOnCount Bit,
  @ReminderOnAvg Bit,
  @ReminderCountThreshold Int,
  @ReminderLapsDaysAvg Int,
  @ReminderOnMax Bit,
  @ReminderAvgDBDataID Int,
  @Return_UserID NVarChar(8) = null OUTPUT, 
  @Return_DashboardID Int = null OUTPUT, 
  @Return_DBRows Int = null OUTPUT 
  AS
  INSERT [WF_UserDBRows]
  (
   [UserID]
  ,[DashboardID]
  ,[DBRows]
  ,[Active]
  ,[ActionAllowed]
  ,[UpdateAllowed]
  ,[RunDate]
  ,[NextRunDate]
  ,[ReminderMaxDBDataID]
  ,[ReminderLapsDaysMax]
  ,[ReminderFrequencyDays]
  ,[ReminderCountDBDataID]
  ,[ReminderOnCount]
  ,[ReminderOnAvg]
  ,[ReminderCountThreshold]
  ,[ReminderLapsDaysAvg]
  ,[ReminderOnMax]
  ,[ReminderAvgDBDataID]
  )
  VALUES
  (
   UPPER(@UserID)
  ,@DashboardID
  ,@DBRows
  ,@Active
  ,@ActionAllowed
  ,@UpdateAllowed
  ,@RunDate
  ,@NextRunDate
  ,@ReminderMaxDBDataID
  ,@ReminderLapsDaysMax
  ,@ReminderFrequencyDays
  ,@ReminderCountDBDataID
  ,@ReminderOnCount
  ,@ReminderOnAvg
  ,@ReminderCountThreshold
  ,@ReminderLapsDaysAvg
  ,@ReminderOnMax
  ,@ReminderAvgDBDataID
  )
  SET @Return_UserID = @UserID
  SET @Return_DashboardID = @DashboardID
  SET @Return_DBRows = @DBRows
GO
