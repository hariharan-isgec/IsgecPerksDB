USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtBillHistoryUpdate]
  @Original_IRNo Int, 
  @Original_SerialNo Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_BillHistory] SET 
   [IRNo] = @IRNo
  ,[TranTypeID] = @TranTypeID
  ,[IRReceivedOn] = @IRReceivedOn
  ,[VendorID] = @VendorID
  ,[BillNumber] = @BillNumber
  ,[BillDate] = @BillDate
  ,[BillAmount] = @BillAmount
  ,[BillStatusID] = @BillStatusID
  ,[BillStatusDate] = @BillStatusDate
  ,[BillStatusUser] = @BillStatusUser
  ,[LogisticLinked] = @LogisticLinked
  ,[Remarks] = @Remarks
  ,[PassedAmount] = @PassedAmount
  ,[ApprovedAmount] = @ApprovedAmount
  ,[RemarksAC] = @RemarksAC
  ,[ReturnedByAC] = @ReturnedByAC
  ,[ReasonID] = @ReasonID
  ,[AdviceNo] = @AdviceNo
  WHERE
  [IRNo] = @Original_IRNo
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
