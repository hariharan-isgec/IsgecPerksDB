USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtBillHistoryInsert]
  @IRNo Int,
  @TranTypeID NVarChar(3),
  @IRReceivedOn DateTime,
  @VendorID NVarChar(6),
  @BillNumber NVarChar(50),
  @BillDate DateTime,
  @BillAmount Decimal(10,2),
  @BillStatusID Int,
  @BillStatusDate DateTime,
  @BillStatusUser NVarChar(8),
  @LogisticLinked Bit,
  @Remarks NVarChar(500),
  @PassedAmount Decimal(10,2),
  @ApprovedAmount Decimal(10,2),
  @RemarksAC NVarChar(500),
  @ReturnedByAC Bit,
  @ReasonID Int,
  @AdviceNo Int,
  @Return_SerialNo Int = null OUTPUT
  AS
  INSERT [SPMT_BillHistory]
  (
   [IRNo]
  ,[TranTypeID]
  ,[IRReceivedOn]
  ,[VendorID]
  ,[BillNumber]
  ,[BillDate]
  ,[BillAmount]
  ,[BillStatusID]
  ,[BillStatusDate]
  ,[BillStatusUser]
  ,[LogisticLinked]
  ,[Remarks]
  ,[PassedAmount]
  ,[ApprovedAmount]
  ,[RemarksAC]
  ,[ReturnedByAC]
  ,[ReasonID]
  ,[AdviceNo]
  )
  VALUES
  (
   @IRNo
  ,@TranTypeID
  ,@IRReceivedOn
  ,@VendorID
  ,@BillNumber
  ,@BillDate
  ,@BillAmount
  ,@BillStatusID
  ,@BillStatusDate
  ,@BillStatusUser
  ,@LogisticLinked
  ,@Remarks
  ,@PassedAmount
  ,@ApprovedAmount
  ,@RemarksAC
  ,@ReturnedByAC
  ,@ReasonID
  ,@AdviceNo
  )
  SET @Return_SerialNo = Scope_Identity()
GO
