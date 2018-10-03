USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkLedgerUpdate]
  @Original_DocumentID Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_Ledger] SET 
   [EmployeeID] = @EmployeeID
  ,[PerkID] = @PerkID
  ,[TranType] = @TranType
  ,[TranDate] = @TranDate
  ,[FinYear] = @FinYear
  ,[Value] = @Value
  ,[UOM] = @UOM
  ,[Amount] = @Amount
  ,[Remarks] = @Remarks
  ,[CreatedBy] = @CreatedBy
  ,[ParentDocumentID] = @ParentDocumentID
  ,[ApplicationID] = @ApplicationID
  ,[PostedInBaaN] = @PostedInBaaN
  ,[PostedOn] = @PostedOn
  ,[PostedBy] = @PostedBy
  ,[BatchNo] = @BatchNo
  ,[VoucherNo] = @VoucherNo
  ,[VoucherLineNo] = @VoucherLineNo
  WHERE
  [DocumentID] = @Original_DocumentID
  SET @RowCount = @@RowCount
GO
