USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaBillGSTUpdate]
  @Original_TABillNo Int, 
  @Original_SerialNo Int, 
  @TABillNo Int,
  @SerialNo Int,
  @PurchaseType NVarChar(50),
  @IsgecGSTIN Int,
  @BillNumber NVarChar(50),
  @BillDate DateTime,
  @BPID NVarChar(9),
  @SupplierGSTIN Int,
  @SupplierGSTINNo NVarChar(50),
  @StateID NVarChar(2),
  @BillType Int,
  @HSNSACCode NVarChar(20),
  @AssessableValue Decimal(18,2),
  @IGSTRate Decimal(18,2),
  @IGSTAmount Decimal(18,2),
  @SGSTRate Decimal(18,2),
  @SGSTAmount Decimal(18,2),
  @CGSTRate Decimal(18,2),
  @CGSTAmount Decimal(18,2),
  @CessRate Decimal(18,2),
  @CessAmount Decimal(18,2),
  @TotalGST Decimal(18,2),
  @TotalAmount Decimal(18,2),
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_BillGST] SET 
   [TABillNo] = @TABillNo
  ,[SerialNo] = @SerialNo
  ,[IsgecGSTIN] = @IsgecGSTIN
  ,[BillNumber] = @BillNumber
  ,[BillDate] = @BillDate
  ,[BPID] = @BPID
  ,[SupplierGSTIN] = @SupplierGSTIN
  ,[SupplierGSTINNo] = @SupplierGSTINNo
  ,[StateID] = @StateID
  ,[BillType] = @BillType
  ,[HSNSACCode] = @HSNSACCode
  ,[AssessableValue] = @AssessableValue
  ,[IGSTRate] = @IGSTRate
  ,[IGSTAmount] = @IGSTAmount
  ,[SGSTRate] = @SGSTRate
  ,[SGSTAmount] = @SGSTAmount
  ,[CGSTRate] = @CGSTRate
  ,[CGSTAmount] = @CGSTAmount
  ,[CessRate] = @CessRate
  ,[CessAmount] = @CessAmount
  ,[TotalGST] = @TotalGST
  ,[TotalAmount] = @TotalAmount
  ,[PurchaseType] = @PurchaseType
  WHERE
  [TABillNo] = @Original_TABillNo
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
