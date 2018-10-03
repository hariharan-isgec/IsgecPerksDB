USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBLHeaderUpdate]
  @Original_BLID NVarChar(9), 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [ELOG_BLHeader] SET 
   [BLID] = @BLID
  ,[BLNumber] = @BLNumber
  ,[BLDate] = @BLDate
  ,[PortOfLoading] = @PortOfLoading
  ,[VesselOrFlightNo] = @VesselOrFlightNo
  ,[VoyageNo] = @VoyageNo
  ,[TransShipmentPortID] = @TransShipmentPortID
  ,[PrepaidFlight] = @PrepaidFlight
  ,[ShippingLine] = @ShippingLine
  ,[SOBDate] = @SOBDate
  ,[MBLNo] = @MBLNo
  ,[PreCarriageBy] = @PreCarriageBy
  ,[PlaceOfReceiptBy] = @PlaceOfReceiptBy
  ,[Air1Freight] = @Air1Freight
  ,[Air2Freight] = @Air2Freight
  ,[Air3Freight] = @Air3Freight
  ,[Air4Freight] = @Air4Freight
  WHERE
  [BLID] = @Original_BLID
  SET @RowCount = @@RowCount
GO
