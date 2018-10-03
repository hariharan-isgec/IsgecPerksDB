USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfUserDBRowsUpdate]
  @Original_UserID NVarChar(8), 
  @Original_DashboardID Int, 
  @Original_DBRows Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [WF_UserDBRows] SET 
   [UserID] = @UserID
  ,[DashboardID] = @DashboardID
  ,[DBRows] = @DBRows
  ,[Active] = @Active
  ,[ActionAllowed] = @ActionAllowed
  ,[UpdateAllowed] = @UpdateAllowed
  ,[RunDate] = @RunDate
  ,[NextRunDate] = @NextRunDate
  ,[ReminderMaxDBDataID] = @ReminderMaxDBDataID
  ,[ReminderLapsDaysMax] = @ReminderLapsDaysMax
  ,[ReminderFrequencyDays] = @ReminderFrequencyDays
  ,[ReminderCountDBDataID] = @ReminderCountDBDataID
  ,[ReminderOnCount] = @ReminderOnCount
  ,[ReminderOnAvg] = @ReminderOnAvg
  ,[ReminderCountThreshold] = @ReminderCountThreshold
  ,[ReminderLapsDaysAvg] = @ReminderLapsDaysAvg
  ,[ReminderOnMax] = @ReminderOnMax
  ,[ReminderAvgDBDataID] = @ReminderAvgDBDataID
  WHERE
  [UserID] = @Original_UserID
  AND [DashboardID] = @Original_DashboardID
  AND [DBRows] = @Original_DBRows
  SET @RowCount = @@RowCount
GO
