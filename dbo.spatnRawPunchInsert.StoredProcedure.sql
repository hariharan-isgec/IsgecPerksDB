USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnRawPunchInsert]
  @PunchDate DateTime,
  @CardNo NVarChar(8),
  @Punch1Time Decimal(6,2),
  @Punch2Time Decimal(6,2),
  @Processed Bit,
  @FinYear NVarChar(4),
	@FirstPunchMachine NVarChar(100),   
	@SecondPunchMachine NVarChar(100),   
  @Return_RecordID Int = null OUTPUT
  AS
  INSERT [ATN_RawPunch]
  (
   [PunchDate]
  ,[CardNo]
  ,[Punch1Time]
  ,[Punch2Time]
  ,[Processed]
  ,[FinYear]
	,[FirstPunchMachine]
	,[SecondPunchMachine]     
  )
  VALUES
  (
   @PunchDate
  ,@CardNo
  ,@Punch1Time
  ,@Punch2Time
  ,@Processed
  ,@FinYear
	,@FirstPunchMachine
	,@SecondPunchMachine     
  )
  SET @Return_RecordID = Scope_Identity()
GO
