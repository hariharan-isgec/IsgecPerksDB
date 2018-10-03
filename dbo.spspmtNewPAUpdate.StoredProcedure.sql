USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtNewPAUpdate]
  @Original_AdviceNo Int, 
  @TranTypeID NVarChar(3),
  @SupplierName NVarChar(100),
  @CreatedBy NVarChar(8),
  @TotalAdviceAmount Decimal(18,2),
  @StatusID Int,
  @AccountsRemarks NVarChar(100),
  @CreatedOn DateTime,
  @PostedInACBy NVarChar(8),
  @ReceivedInACOn DateTime,
  @PostedInACOn DateTime,
  @LockedInACOn DateTime,
  @ReceivedInACBy NVarChar(8),
  @LockedInACBy NVarChar(8),
  @VoucherNo NVarChar(10),
  @AdvanceRate Decimal(18,2),
  @AdvanceAmount Decimal(18,2),
  @Remarks NVarChar(500),
  @BPID NVarChar(9),
  @ConcernedHOD NVarChar(8),
  @VoucherType NVarChar(3),
  @UploadBatchNo NVarChar(50),
  @ERPCompany NVarChar(3),
  @RetensionRate Decimal(18,2),
  @RetensionAmount Decimal(18,2),
  @OldAdviceNo Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_newPA] SET 
   [TranTypeID] = @TranTypeID
  ,[SupplierName] = @SupplierName
  ,[CreatedBy] = @CreatedBy
  ,[TotalAdviceAmount] = @TotalAdviceAmount
  ,[StatusID] = @StatusID
  ,[AccountsRemarks] = @AccountsRemarks
  ,[CreatedOn] = @CreatedOn
  ,[PostedInACBy] = @PostedInACBy
  ,[ReceivedInACOn] = @ReceivedInACOn
  ,[PostedInACOn] = @PostedInACOn
  ,[LockedInACOn] = @LockedInACOn
  ,[ReceivedInACBy] = @ReceivedInACBy
  ,[LockedInACBy] = @LockedInACBy
  ,[VoucherNo] = @VoucherNo
  ,[AdvanceRate] = @AdvanceRate
  ,[AdvanceAmount] = @AdvanceAmount
  ,[Remarks] = @Remarks
  ,[BPID] = @BPID
  ,[ConcernedHOD] = @ConcernedHOD
  ,[VoucherType] = @VoucherType
  ,[UploadBatchNo] = @UploadBatchNo
  ,[ERPCompany] = @ERPCompany
  ,[RetensionRate] = @RetensionRate
  ,[RetensionAmount] = @RetensionAmount
  ,[OldAdviceNo]=@OldAdviceNo
  WHERE
  [AdviceNo] = @Original_AdviceNo
  SET @RowCount = @@RowCount
GO
