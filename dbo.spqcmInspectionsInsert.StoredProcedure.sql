USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionsInsert]
  @RequestID Int,
  @ProjectID NVarChar(6),
  @OrderNo NVarChar(50),
  @OrderDate DateTime,
  @SupplierID NVarChar(9),
  @InspectionRemarks NVarChar(500),
  @InspectedBy NVarChar(8),
  @InspectedOn DateTime,
  @RequestStateID NVarChar(10),
  @FileAttached Bit,
  @InspectionStatusID Int,
  @InspectedQuantity NVarChar(50),
  @InspectionStageiD Int,
  @EnteredBy NVarChar(8),
  @EnteredOn DateTime,
  @OfferedQuantity Decimal(18,2), 
  @ClearedQuantity Decimal(18,2),
  @UOM NvarChar(10),
  @InspectedQuantityFinal NVarChar(50),
  @OfferedQuantityFinal Decimal(18,2), 
  @ClearedQuantityFinal Decimal(18,2),
  @Return_RequestID Int = null OUTPUT, 
  @Return_InspectionID Int = null OUTPUT 
  AS
  INSERT [QCM_Inspections]
  (
   [RequestID]
  ,[ProjectID]
  ,[OrderNo]
  ,[OrderDate]
  ,[SupplierID]
  ,[InspectionRemarks]
  ,[InspectedBy]
  ,[InspectedOn]
  ,[RequestStateID]
  ,[FileAttached]
  ,[InspectionStatusID]
  ,[InspectedQuantity]
  ,[InspectionStageiD]
  ,[EnteredBy]
  ,[EnteredOn]
  ,[OfferedQuantity]
  ,[ClearedQuantity]
  ,[UOM]
  ,[InspectedQuantityFinal]
  ,[OfferedQuantityFinal]
  ,[ClearedQuantityFinal]
  )
  VALUES
  (
   @RequestID
  ,@ProjectID
  ,@OrderNo
  ,@OrderDate
  ,@SupplierID
  ,@InspectionRemarks
  ,@InspectedBy
  ,@InspectedOn
  ,@RequestStateID
  ,@FileAttached
  ,@InspectionStatusID
  ,@InspectedQuantity
  ,@InspectionStageiD
  ,@EnteredBy
  ,@EnteredOn
  ,@OfferedQuantity
  ,@ClearedQuantity
  ,@UOM
  ,@InspectedQuantityFinal
  ,@OfferedQuantityFinal
  ,@ClearedQuantityFinal
  )
  SET @Return_RequestID = @RequestID
  SET @Return_InspectionID = Scope_Identity()
GO
