USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkLedgerInsert]
  @EmployeeID Int,
  @PerkID Int,
  @TranType NVarChar(3),
  @TranDate DateTime,
  @FinYear Int,
  @Value Decimal(10,2),
  @UOM NVarChar(5),
  @Amount Decimal(10,2),
  @Remarks NVarChar(500),
  @CreatedBy Int,
  @ParentDocumentID Int,
  @ApplicationID Int,
  @PostedInBaaN Bit,
  @PostedOn DateTime,
  @PostedBy Int,
  @BatchNo NVarChar(6),
  @VoucherNo NVarChar(8),
  @VoucherLineNo NVarChar(10),
  @Return_DocumentID Int = null OUTPUT 
  AS
  INSERT [PRK_Ledger]
  (
   [EmployeeID]
  ,[PerkID]
  ,[TranType]
  ,[TranDate]
  ,[FinYear]
  ,[Value]
  ,[UOM]
  ,[Amount]
  ,[Remarks]
  ,[CreatedBy]
  ,[ParentDocumentID]
  ,[ApplicationID]
  ,[PostedInBaaN]
  ,[PostedOn]
  ,[PostedBy]
  ,[BatchNo]
  ,[VoucherNo]
  ,[VoucherLineNo]
  )
  VALUES
  (
   @EmployeeID
  ,@PerkID
  ,@TranType
  ,@TranDate
  ,@FinYear
  ,@Value
  ,@UOM
  ,@Amount
  ,@Remarks
  ,@CreatedBy
  ,@ParentDocumentID
  ,@ApplicationID
  ,@PostedInBaaN
  ,@PostedOn
  ,@PostedBy
  ,@BatchNo
  ,@VoucherNo
  ,@VoucherLineNo
  )
  SET @Return_DocumentID = Scope_Identity()
GO
