USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchConfigDetailsUpdate]
  @ConfigID Int,
  @FPStartTime Decimal(6,2),
  @FPEndTime Decimal(6,2),
  @UseDefined Bit,
  @DefinedTime Decimal(6,2),
  @SPStartTime Decimal(6,2),
  @SPEndTime Decimal(6,2),
  @CalculateHours Bit,
  @HoursStatus NVarChar(2),
  @HoursValue Decimal(6,2),
  @LimitedAllowed Bit,
  @LimitCount Int,
  @LimitPunchStatus NVarChar(2),
  @NormalPunchStatus NVarChar(2),
  @LimitedLeaveTypes NVarChar(100),
  @NormalLeaveTypes NVarChar(100),
  @ExceptionRule Bit,
  @ConfigStatus NVarChar(2),
  @Original_SerialNo Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_PunchConfigDetails] SET 
   [ConfigID] = @ConfigID
  ,[FPStartTime] = @FPStartTime
  ,[FPEndTime] = @FPEndTime
  ,[UseDefined] = @UseDefined
  ,[DefinedTime] = @DefinedTime
  ,[SPStartTime] = @SPStartTime
  ,[SPEndTime] = @SPEndTime
  ,[CalculateHours] = @CalculateHours
  ,[HoursStatus] = @HoursStatus
  ,[HoursValue] = @HoursValue
  ,[LimitedAllowed] = @LimitedAllowed
  ,[LimitCount] = @LimitCount
  ,[LimitPunchStatus] = @LimitPunchStatus
  ,[NormalPunchStatus] = @NormalPunchStatus
  ,[LimitedLeaveTypes] = @LimitedLeaveTypes
  ,[NormalLeaveTypes] = @NormalLeaveTypes
  ,[ExceptionRule] = @ExceptionRule
  ,[ConfigStatus] = @ConfigStatus
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
