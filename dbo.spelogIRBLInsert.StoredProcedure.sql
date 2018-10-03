USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogIRBLInsert]
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
  @Return_IRNo Int = null OUTPUT 
  AS
  INSERT [ELOG_IRBL]
  (
   [IRNo]
  ,[SupplierID]
  ,[ProjectID]
  ,[PONo]
  ,[SupplierBillNo]
  ,[supplierBillDate]
  ,[SupplierBillAmount]
  ,[IRDate]
  ,[BLID]
  ,[BLType]
  ,[MBLNo]
  ,[Remarks]
  ,[ShipmentModeID]
  ,[CarrierID]
  ,[OtherCarrier]
  ,[LocationCountryID]
  ,[OtherCountry]
  ,[CargoTypeID]
  ,[PortID]
  ,[OtherPortLoadingOrigin]
  ,[StatusID]
  ,[CreatedOn]
  ,[CreatedBy]
  )
  VALUES
  (
   @IRNo
  ,@SupplierID
  ,@ProjectID
  ,@PONo
  ,@SupplierBillNo
  ,@supplierBillDate
  ,@SupplierBillAmount
  ,@IRDate
  ,@BLID
  ,@BLType
  ,@MBLNo
  ,@Remarks
  ,@ShipmentModeID
  ,@CarrierID
  ,@OtherCarrier
  ,@LocationCountryID
  ,@OtherCountry
  ,@CargoTypeID
  ,@PortID
  ,@OtherPortLoadingOrigin
  ,@StatusID
  ,@CreatedOn
  ,@CreatedBy
  )
  SET @Return_IRNo = @IRNo
GO
