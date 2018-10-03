USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaBillGSTInsert]
  @TABillNo Int,
  @SerialNo Int,
  @PurchaseType NvarChar(50),
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
  @Return_TABillNo Int = null OUTPUT, 
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [TA_BillGST]
  (
   [TABillNo]
  ,[SerialNo]
  ,[IsgecGSTIN]
  ,[BillNumber]
  ,[BillDate]
  ,[BPID]
  ,[SupplierGSTIN]
  ,[SupplierGSTINNo]
  ,[StateID]
  ,[BillType]
  ,[HSNSACCode]
  ,[AssessableValue]
  ,[IGSTRate]
  ,[IGSTAmount]
  ,[SGSTRate]
  ,[SGSTAmount]
  ,[CGSTRate]
  ,[CGSTAmount]
  ,[CessRate]
  ,[CessAmount]
  ,[TotalGST]
  ,[TotalAmount]
  ,[PurchaseType]
  )
  VALUES
  (
   @TABillNo
  ,@SerialNo
  ,@IsgecGSTIN
  ,@BillNumber
  ,@BillDate
  ,@BPID
  ,@SupplierGSTIN
  ,@SupplierGSTINNo
  ,@StateID
  ,@BillType
  ,@HSNSACCode
  ,@AssessableValue
  ,@IGSTRate
  ,@IGSTAmount
  ,@SGSTRate
  ,@SGSTAmount
  ,@CGSTRate
  ,@CGSTAmount
  ,@CessRate
  ,@CessAmount
  ,@TotalGST
  ,@TotalAmount
  ,@PurchaseType
  )
  SET @Return_TABillNo = @TABillNo
  SET @Return_SerialNo = @SerialNo
GO
