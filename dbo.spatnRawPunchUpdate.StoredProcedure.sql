USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnRawPunchUpdate]
  @PunchDate DateTime,
  @CardNo NVarChar(8),
  @Punch1Time Decimal(6,2),
  @Punch2Time Decimal(6,2),
  @Processed Bit,
  @FinYear NVarChar(4),
	@FirstPunchMachine NVarChar(100),   
	@SecondPunchMachine NVarChar(100),   
  @Original_RecordID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_RawPunch] SET 
   [PunchDate] = @PunchDate
  ,[CardNo] = @CardNo
  ,[Punch1Time] = @Punch1Time
  ,[Punch2Time] = @Punch2Time
  ,[Processed] = @Processed
  ,[FinYear] = @FinYear
	,[FirstPunchMachine] = @FirstPunchMachine   
	,[SecondPunchMachine] = @SecondPunchMachine   
  WHERE
  [RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
