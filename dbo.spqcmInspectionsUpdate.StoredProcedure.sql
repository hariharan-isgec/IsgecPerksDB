USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionsUpdate]
  @Original_RequestID Int, 
  @Original_InspectionID Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [QCM_Inspections] SET 
   [RequestID] = @RequestID
  ,[ProjectID] = @ProjectID
  ,[OrderNo] = @OrderNo
  ,[OrderDate] = @OrderDate
  ,[SupplierID] = @SupplierID
  ,[InspectionRemarks] = @InspectionRemarks
  ,[InspectedBy] = @InspectedBy
  ,[InspectedOn] = @InspectedOn
  ,[RequestStateID] = @RequestStateID
  ,[FileAttached] = @FileAttached
  ,[InspectionStatusID] = @InspectionStatusID
  ,[InspectedQuantity] = @InspectedQuantity
  ,[InspectionStageiD] = @InspectionStageiD
  ,[EnteredBy] = @EnteredBy
  ,[EnteredOn] = @EnteredOn
  ,[OfferedQuantity] = @OfferedQuantity
  ,[ClearedQuantity] = @ClearedQuantity
  ,[UOM] = @UOM
  ,[InspectedQuantityFinal] = @InspectedQuantityFinal
  ,[OfferedQuantityFinal] = @OfferedQuantityFinal
  ,[ClearedQuantityFinal] = @ClearedQuantityFinal
  WHERE
  [RequestID] = @Original_RequestID
  AND [InspectionID] = @Original_InspectionID
  SET @RowCount = @@RowCount
GO
