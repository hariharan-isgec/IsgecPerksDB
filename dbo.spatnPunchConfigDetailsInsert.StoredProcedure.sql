USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchConfigDetailsInsert]
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
  @Return_SerialNo Int = null OUTPUT
  AS
  INSERT [ATN_PunchConfigDetails]
  (
   [ConfigID]
  ,[FPStartTime]
  ,[FPEndTime]
  ,[UseDefined]
  ,[DefinedTime]
  ,[SPStartTime]
  ,[SPEndTime]
  ,[CalculateHours]
  ,[HoursStatus]
  ,[HoursValue]
  ,[LimitedAllowed]
  ,[LimitCount]
  ,[LimitPunchStatus]
  ,[NormalPunchStatus]
  ,[LimitedLeaveTypes]
  ,[NormalLeaveTypes]
  ,[ExceptionRule]
  ,[ConfigStatus]
  )
  VALUES
  (
   @ConfigID
  ,@FPStartTime
  ,@FPEndTime
  ,@UseDefined
  ,@DefinedTime
  ,@SPStartTime
  ,@SPEndTime
  ,@CalculateHours
  ,@HoursStatus
  ,@HoursValue
  ,@LimitedAllowed
  ,@LimitCount
  ,@LimitPunchStatus
  ,@NormalPunchStatus
  ,@LimitedLeaveTypes
  ,@NormalLeaveTypes
  ,@ExceptionRule
  ,@ConfigStatus
  )
  SET @Return_SerialNo = Scope_Identity()
GO
