USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtPaymentAdviceHistoryUpdate]
  @Original_AdviceNo Int, 
  @Original_SerialNo Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_PaymentAdviceHistory] SET 
   [AdviceNo] = @AdviceNo
  ,[TranTypeID] = @TranTypeID
  ,[VendorID] = @VendorID
  ,[CostCenter] = @CostCenter
  ,[ConcernedHOD] = @ConcernedHOD
  ,[AdviceStatusID] = @AdviceStatusID
  ,[AdviceStatusOn] = @AdviceStatusOn
  ,[AdviceStatusUser] = @AdviceStatusUser
  ,[Remarks] = @Remarks
  ,[RemarksHOD] = @RemarksHOD
  ,[RemarksHR] = @RemarksHR
  ,[RemarksAC] = @RemarksAC
  ,[Returned] = @Returned
  ,[Forward] = @Forward
  WHERE
  [AdviceNo] = @Original_AdviceNo
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
