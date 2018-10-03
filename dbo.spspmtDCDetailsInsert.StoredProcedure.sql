USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCDetailsInsert]
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
  @Return_ChallanID NVarChar(20) = null OUTPUT, 
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [SPMT_DCDetails]
  (
   [ItemDescription]
  ,[BillTypeID]
  ,[HSNSACCode]
  ,[UOM]
  ,[Quantity]
  ,[Price]
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
  ,[ChallanID]
  )
  VALUES
  (
   @ItemDescription
  ,@BillTypeID
  ,@HSNSACCode
  ,@UOM
  ,@Quantity
  ,@Price
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
  ,UPPER(@ChallanID)
  )
  SET @Return_ChallanID = @ChallanID
  SET @Return_SerialNo = Scope_Identity()
GO
