USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnProcessedPunchUpdate]
  @Punch1Time Decimal(6,2),
  @Punch2Time Decimal(6,2),
  @PunchStatusID NVarChar(2),
  @Punch9Time Decimal(6,2),
  @PunchValue Decimal(6,2),
  @FinalValue Decimal(6,2),
  @NeedsRegularization Bit,
  @MannuallyCorrected Bit,
  @Original_AttenID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_Attendance] SET 
   [Punch1Time] = @Punch1Time
  ,[Punch2Time] = @Punch2Time
  ,[PunchStatusID] = @PunchStatusID
  ,[Punch9Time] = @Punch9Time
  ,[PunchValue] = @PunchValue
  ,[FinalValue] = @FinalValue
  ,[NeedsRegularization] = @NeedsRegularization
  ,[MannuallyCorrected] = @MannuallyCorrected
  WHERE
  [AttenID] = @Original_AttenID
  SET @RowCount = @@RowCount
GO
