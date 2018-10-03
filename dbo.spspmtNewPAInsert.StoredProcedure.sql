USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtNewPAInsert]
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
  @Return_AdviceNo Int = null OUTPUT 
  AS
  INSERT [SPMT_newPA]
  (
   [TranTypeID]
  ,[SupplierName]
  ,[CreatedBy]
  ,[TotalAdviceAmount]
  ,[StatusID]
  ,[AccountsRemarks]
  ,[CreatedOn]
  ,[PostedInACBy]
  ,[ReceivedInACOn]
  ,[PostedInACOn]
  ,[LockedInACOn]
  ,[ReceivedInACBy]
  ,[LockedInACBy]
  ,[VoucherNo]
  ,[AdvanceRate]
  ,[AdvanceAmount]
  ,[Remarks]
  ,[BPID]
  ,[ConcernedHOD]
  ,[VoucherType]
  ,[UploadBatchNo]
  ,[ERPCompany]
  ,[RetensionRate]
  ,[RetensionAmount]
  ,[OldAdviceNo]
  )
  VALUES
  (
   @TranTypeID
  ,@SupplierName
  ,@CreatedBy
  ,@TotalAdviceAmount
  ,@StatusID
  ,@AccountsRemarks
  ,@CreatedOn
  ,@PostedInACBy
  ,@ReceivedInACOn
  ,@PostedInACOn
  ,@LockedInACOn
  ,@ReceivedInACBy
  ,@LockedInACBy
  ,@VoucherNo
  ,@AdvanceRate
  ,@AdvanceAmount
  ,@Remarks
  ,@BPID
  ,@ConcernedHOD
  ,@VoucherType
  ,@UploadBatchNo
  ,@ERPCompany
  ,@RetensionRate
  ,@RetensionAmount
  ,@OldAdviceNo
  )
  SET @Return_AdviceNo = Scope_Identity()
GO
