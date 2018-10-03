USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCDetailsUpdate]
  @Original_ChallanID NVarChar(20), 
  @Original_SerialNo Int, 
  @ItemDescription NVarChar(250),
  @BillTypeID Int,
  @HSNSACCode NVarChar(20),
  @UOM NVarChar(3),
  @Quantity Decimal(18,2),
  @Price Decimal(18,2),
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
  @ChallanID NVarChar(20),
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_DCDetails] SET 
   [ItemDescription] = @ItemDescription
  ,[BillTypeID] = @BillTypeID
  ,[HSNSACCode] = @HSNSACCode
  ,[UOM] = @UOM
  ,[Quantity] = @Quantity
  ,[Price] = @Price
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
  ,[ChallanID] = @ChallanID
  WHERE
  [ChallanID] = @Original_ChallanID
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
