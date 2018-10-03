USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnLeaveLedgerInsert]
  @TranType NVarChar(3),
  @TranDate DateTime,
  @CardNo NVarChar(8),
  @LeaveTypeID NVarChar(2),
  @InProcessDays Decimal(6,2),
  @Days Decimal(6,2),
  @FinYear NVarChar(4),
  @ApplHeaderID Int,
  @ApplDetailID Int,
  @Return_RecordID Int = null OUTPUT
  AS
  INSERT [ATN_LeaveLedger]
  (
   [TranType]
  ,[TranDate]
  ,[CardNo]
  ,[LeaveTypeID]
  ,[InProcessDays]
  ,[Days]
  ,[FinYear]
  ,[ApplHeaderID]
  ,[ApplDetailID]
  )
  VALUES
  (
   @TranType
  ,@TranDate
  ,@CardNo
  ,@LeaveTypeID
  ,@InProcessDays
  ,@Days
  ,@FinYear
  ,@ApplHeaderID
  ,@ApplDetailID
  )
  SET @Return_RecordID = Scope_Identity()
GO
