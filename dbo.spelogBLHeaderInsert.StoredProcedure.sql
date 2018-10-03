USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBLHeaderInsert]
  @BLID NVarChar(9),
  @BLNumber NVarChar(50),
  @BLDate DateTime,
  @PortOfLoading NVarChar(100),
  @VesselOrFlightNo NVarChar(100),
  @VoyageNo NVarChar(100),
  @TransShipmentPortID Int,
  @PrepaidFlight Bit,
  @ShippingLine NVarChar(100),
  @SOBDate DateTime,
  @MBLNo NVarChar(50),
  @PreCarriageBy NVarChar(100),
  @PlaceOfReceiptBy NVarChar(100),
  @Air1Freight NVarChar(100),
  @Air2Freight NVarChar(100),
  @Air3Freight NVarChar(100),
  @Air4Freight NVarChar(100),
  @Return_BLID NVarChar(9) = null OUTPUT 
  AS
  INSERT [ELOG_BLHeader]
  (
   [BLID]
  ,[BLNumber]
  ,[BLDate]
  ,[PortOfLoading]
  ,[VesselOrFlightNo]
  ,[VoyageNo]
  ,[TransShipmentPortID]
  ,[PrepaidFlight]
  ,[ShippingLine]
  ,[SOBDate]
  ,[MBLNo]
  ,[PreCarriageBy]
  ,[PlaceOfReceiptBy]
  ,[Air1Freight]
  ,[Air2Freight]
  ,[Air3Freight]
  ,[Air4Freight]
  )
  VALUES
  (
   UPPER(@BLID)
  ,@BLNumber
  ,@BLDate
  ,@PortOfLoading
  ,@VesselOrFlightNo
  ,@VoyageNo
  ,@TransShipmentPortID
  ,@PrepaidFlight
  ,@ShippingLine
  ,@SOBDate
  ,@MBLNo
  ,@PreCarriageBy
  ,@PlaceOfReceiptBy
  ,@Air1Freight
  ,@Air2Freight
  ,@Air3Freight
  ,@Air4Freight
  )
  SET @Return_BLID = @BLID
GO
