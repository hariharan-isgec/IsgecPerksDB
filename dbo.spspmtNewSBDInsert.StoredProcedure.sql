USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtNewSBDInsert]
  @IRNo Int,
  @ItemDescription NVarChar(100),
  @BillType Int,
  @HSNSACCode NVarChar(20),
  @UOM NVarChar(3),
  @Quantity Decimal(18,2),
  @Currency NVarChar(50),
  @ConversionFactorINR Decimal(18,6),
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
  @TotalGSTINR Decimal(18,2),
  @TotalAmountINR Decimal(18,2),
  @DepartmentID NVarChar(6),
  @EmployeeID NVarChar(8),
  @UploadBatchNo NVarChar(50),
  @CostCenterID NVarChar(6),
  @ElementID NVarChar(8),
  @BasicValue Decimal(18,2),
  @Discount Decimal(18,2),
  @ProjectID NVarChar(6),
  @ServiceCharge Decimal(18,2),
  @Return_IRNo Int = null OUTPUT, 
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [SPMT_newSBD]
  (
   [IRNo]
  ,[ItemDescription]
  ,[BillType]
  ,[HSNSACCode]
  ,[UOM]
  ,[Quantity]
  ,[Currency]
  ,[ConversionFactorINR]
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
  ,[TotalGSTINR]
  ,[TotalAmountINR]
  ,[DepartmentID]
  ,[EmployeeID]
  ,[UploadBatchNo]
  ,[CostCenterID]
  ,[ElementID]
  ,[BasicValue]
  ,[Discount]
  ,[ProjectID]
  ,[ServiceCharge]
  )
  VALUES
  (
   @IRNo
  ,@ItemDescription
  ,@BillType
  ,@HSNSACCode
  ,@UOM
  ,@Quantity
  ,@Currency
  ,@ConversionFactorINR
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
  ,@TotalGSTINR
  ,@TotalAmountINR
  ,@DepartmentID
  ,@EmployeeID
  ,@UploadBatchNo
  ,@CostCenterID
  ,@ElementID
  ,@BasicValue
  ,@Discount
  ,@ProjectID
  ,@ServiceCharge
  )
  SET @Return_IRNo = @IRNo
  SET @Return_SerialNo = Scope_Identity()
GO
