USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogIRBLUpdate]
  @Original_IRNo Int, 
  @IRNo Int,
  @SupplierID NVarChar(9),
  @ProjectID NVarChar(6),
  @PONo NVarChar(9),
  @SupplierBillNo NVarChar(50),
  @supplierBillDate DateTime,
  @SupplierBillAmount Decimal(18,2),
  @IRDate DateTime,
  @BLID NVarChar(9),
  @BLType Int,
  @MBLNo NVarChar(50),
  @Remarks NVarChar(500),
  @ShipmentModeID Int,
  @CarrierID Int,
  @OtherCarrier NVarChar(100),
  @LocationCountryID Int,
  @OtherCountry NVarChar(100),
  @CargoTypeID Int,
  @PortID Int,
  @OtherPortLoadingOrigin NVarChar(100),
  @StatusID Int,
  @CreatedOn DateTime,
  @CreatedBy NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ELOG_IRBL] SET 
   [IRNo] = @IRNo
  ,[SupplierID] = @SupplierID
  ,[ProjectID] = @ProjectID
  ,[PONo] = @PONo
  ,[SupplierBillNo] = @SupplierBillNo
  ,[supplierBillDate] = @supplierBillDate
  ,[SupplierBillAmount] = @SupplierBillAmount
  ,[IRDate] = @IRDate
  ,[BLID] = @BLID
  ,[BLType] = @BLType
  ,[MBLNo] = @MBLNo
  ,[Remarks] = @Remarks
  ,[ShipmentModeID] = @ShipmentModeID
  ,[CarrierID] = @CarrierID
  ,[OtherCarrier] = @OtherCarrier
  ,[LocationCountryID] = @LocationCountryID
  ,[OtherCountry] = @OtherCountry
  ,[CargoTypeID] = @CargoTypeID
  ,[PortID] = @PortID
  ,[OtherPortLoadingOrigin] = @OtherPortLoadingOrigin
  ,[StatusID] = @StatusID
  ,[CreatedOn] = @CreatedOn
  ,[CreatedBy] = @CreatedBy
  WHERE
  [IRNo] = @Original_IRNo
  SET @RowCount = @@RowCount
GO
