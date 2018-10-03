USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtPaymentAdviceHistoryInsert]
  @AdviceNo Int,
  @TranTypeID NVarChar(3),
  @VendorID NVarChar(6),
  @CostCenter NVarChar(50),
  @ConcernedHOD NVarChar(8),
  @AdviceStatusID Int,
  @AdviceStatusOn DateTime,
  @AdviceStatusUser NVarChar(8),
  @Remarks NVarChar(500),
  @RemarksHOD NVarChar(500),
  @RemarksHR NVarChar(500),
  @RemarksAC NVarChar(500),
  @Returned Bit,
  @Forward Bit,
  @Return_SerialNo Int = null OUTPUT
  AS
  INSERT [SPMT_PaymentAdviceHistory]
  (
   [AdviceNo]
  ,[TranTypeID]
  ,[VendorID]
  ,[CostCenter]
  ,[ConcernedHOD]
  ,[AdviceStatusID]
  ,[AdviceStatusOn]
  ,[AdviceStatusUser]
  ,[Remarks]
  ,[RemarksHOD]
  ,[RemarksHR]
  ,[RemarksAC]
  ,[Returned]
  ,[Forward]
  )
  VALUES
  (
   @AdviceNo
  ,@TranTypeID
  ,@VendorID
  ,@CostCenter
  ,@ConcernedHOD
  ,@AdviceStatusID
  ,@AdviceStatusOn
  ,@AdviceStatusUser
  ,@Remarks
  ,@RemarksHOD
  ,@RemarksHR
  ,@RemarksAC
  ,@Returned
  ,@Forward
  )
  SET @Return_SerialNo = Scope_Identity()
GO
