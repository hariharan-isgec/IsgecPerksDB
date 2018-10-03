USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnBalanceTransferInsert]
  @TranType NVarChar(3),
  @SubTranType NVarChar(3),
  @FinYear NVarChar(4),
  @LeaveTypeID NVarChar(2),
  @CardNo NVarChar(8),
  @TranDate DateTime,
  @Days Decimal(6,2),
  @Remarks NVarChar(256),
  @Return_TranType NVarChar(3) = null OUTPUT
  AS
  INSERT [ATN_LeaveLedger]
  (
   [TranType]
  ,[SubTranType]
  ,[FinYear]
  ,[LeaveTypeID]
  ,[CardNo]
  ,[TranDate]
  ,[Days]
  ,[Remarks]
  )
  VALUES
  (
   UPPER(@TranType)
  ,UPPER(@SubTranType)
  ,UPPER(@FinYear)
  ,UPPER(@LeaveTypeID)
  ,UPPER(@CardNo)
  ,@TranDate
  ,@Days
  ,@Remarks
  )
  SET @Return_TranType = @TranType
GO
