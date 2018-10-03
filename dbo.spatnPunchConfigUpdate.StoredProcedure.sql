USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchConfigUpdate]
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
  @DataFileLocation NVarChar(250),
  @Original_RecordID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_PunchConfig] SET 
   [STD1Time] = @STD1Time
  ,[Range1Start] = @Range1Start
  ,[Range1End] = @Range1End
  ,[MeanTime] = @MeanTime
  ,[STD2Time] = @STD2Time
  ,[Range2Start] = @Range2Start
  ,[Range2End] = @Range2End
  ,[EnableMinHrs] = @EnableMinHrs
  ,[MinHrsFullPresent] = @MinHrsFullPresent
  ,[MinHrsHalfPresent] = @MinHrsHalfPresent
  ,[Active] = @Active
  ,[DataFileLocation] = @DataFileLocation
  WHERE
  [RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
