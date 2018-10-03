USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnProcessedPunchInsert]
  @AttenDate DateTime,
  @CardNo NVarChar(8),
  @Punch1Time Decimal(6,2),
  @Punch2Time Decimal(6,2),
  @PunchStatusID NVarChar(2),
  @Punch9Time Decimal(6,2),
  @PunchValue Decimal(6,2),
  @FinalValue Decimal(6,2),
  @NeedsRegularization Bit,
  @FinYear NVarChar(4),
  @AdvanceApplication Bit,
  @MannuallyCorrected Bit,
  @Return_AttenID Int = null OUTPUT
  AS
  INSERT [ATN_Attendance]
  (
   [AttenDate]
  ,[CardNo]
  ,[Punch1Time]
  ,[Punch2Time]
  ,[PunchStatusID]
  ,[Punch9Time]
  ,[PunchValue]
  ,[FinalValue]
  ,[NeedsRegularization]
  ,[FinYear]
  ,[AdvanceApplication]
  ,[MannuallyCorrected]
  )
  VALUES
  (
   @AttenDate
  ,@CardNo
  ,@Punch1Time
  ,@Punch2Time
  ,@PunchStatusID
  ,@Punch9Time
  ,@PunchValue
  ,@FinalValue
  ,@NeedsRegularization
  ,@FinYear
  ,@AdvanceApplication
  ,@MannuallyCorrected
  )
  SET @Return_AttenID = Scope_Identity()
GO
