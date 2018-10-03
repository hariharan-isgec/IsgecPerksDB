USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchConfigInsert]
  @STD1Time Decimal(6,2),
  @Range1Start Decimal(6,2),
  @Range1End Decimal(6,2),
  @MeanTime Decimal(6,2),
  @STD2Time Decimal(6,2),
  @Range2Start Decimal(6,2),
  @Range2End Decimal(6,2),
  @EnableMinHrs Bit,
  @MinHrsFullPresent Decimal(6,2),
  @MinHrsHalfPresent Decimal(6,2),
  @Active Bit,
  @FinYear NVarChar(4),
  @DataFileLocation NVarChar(250),
  @Return_RecordID Int = null OUTPUT
  AS
  INSERT [ATN_PunchConfig]
  (
   [STD1Time]
  ,[Range1Start]
  ,[Range1End]
  ,[MeanTime]
  ,[STD2Time]
  ,[Range2Start]
  ,[Range2End]
  ,[EnableMinHrs]
  ,[MinHrsFullPresent]
  ,[MinHrsHalfPresent]
  ,[Active]
  ,[FinYear]
  ,[DataFileLocation]
  )
  VALUES
  (
   @STD1Time
  ,@Range1Start
  ,@Range1End
  ,@MeanTime
  ,@STD2Time
  ,@Range2Start
  ,@Range2End
  ,@EnableMinHrs
  ,@MinHrsFullPresent
  ,@MinHrsHalfPresent
  ,@Active
  ,@FinYear
  ,@DataFileLocation
  )
  SET @Return_RecordID = Scope_Identity()
GO
