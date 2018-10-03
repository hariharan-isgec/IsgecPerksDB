USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtNewSBDUpdate]
  @Original_IRNo Int, 
  @Original_SerialNo Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_newSBD] SET 
   [IRNo] = @IRNo
  ,[ItemDescription] = @ItemDescription
  ,[BillType] = @BillType
  ,[HSNSACCode] = @HSNSACCode
  ,[UOM] = @UOM
  ,[Quantity] = @Quantity
  ,[Currency] = @Currency
  ,[ConversionFactorINR] = @ConversionFactorINR
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
  ,[TotalGSTINR] = @TotalGSTINR
  ,[TotalAmountINR] = @TotalAmountINR
  ,[DepartmentID] = @DepartmentID
  ,[EmployeeID] = @EmployeeID
  ,[UploadBatchNo] = @UploadBatchNo
  ,[CostCenterID] = @CostCenterID
  ,[ElementID] = @ElementID
  ,[BasicValue] = @BasicValue
  ,[Discount] = @Discount
  ,[ProjectID] = @ProjectID
  ,[ServiceCharge] = @ServiceCharge
  WHERE
  [IRNo] = @Original_IRNo
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
