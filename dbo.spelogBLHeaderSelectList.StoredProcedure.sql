USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBLHeaderSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [ELOG_BLHeader].* ,
    [ELOG_Ports1].[Description] AS ELOG_Ports1_Description 
  FROM [ELOG_BLHeader] 
  LEFT OUTER JOIN [ELOG_Ports] AS [ELOG_Ports1]
    ON [ELOG_BLHeader].[TransShipmentPortID] = [ELOG_Ports1].[PortID]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'BLID' THEN [ELOG_BLHeader].[BLID] END,
     CASE @OrderBy WHEN 'BLID DESC' THEN [ELOG_BLHeader].[BLID] END DESC,
     CASE @OrderBy WHEN 'BLNumber' THEN [ELOG_BLHeader].[BLNumber] END,
     CASE @OrderBy WHEN 'BLNumber DESC' THEN [ELOG_BLHeader].[BLNumber] END DESC,
     CASE @OrderBy WHEN 'BLDate' THEN [ELOG_BLHeader].[BLDate] END,
     CASE @OrderBy WHEN 'BLDate DESC' THEN [ELOG_BLHeader].[BLDate] END DESC,
     CASE @OrderBy WHEN 'PortOfLoading' THEN [ELOG_BLHeader].[PortOfLoading] END,
     CASE @OrderBy WHEN 'PortOfLoading DESC' THEN [ELOG_BLHeader].[PortOfLoading] END DESC,
     CASE @OrderBy WHEN 'VesselOrFlightNo' THEN [ELOG_BLHeader].[VesselOrFlightNo] END,
     CASE @OrderBy WHEN 'VesselOrFlightNo DESC' THEN [ELOG_BLHeader].[VesselOrFlightNo] END DESC,
     CASE @OrderBy WHEN 'VoyageNo' THEN [ELOG_BLHeader].[VoyageNo] END,
     CASE @OrderBy WHEN 'VoyageNo DESC' THEN [ELOG_BLHeader].[VoyageNo] END DESC,
     CASE @OrderBy WHEN 'TransShipmentPortID' THEN [ELOG_BLHeader].[TransShipmentPortID] END,
     CASE @OrderBy WHEN 'TransShipmentPortID DESC' THEN [ELOG_BLHeader].[TransShipmentPortID] END DESC,
     CASE @OrderBy WHEN 'PrepaidFlight' THEN [ELOG_BLHeader].[PrepaidFlight] END,
     CASE @OrderBy WHEN 'PrepaidFlight DESC' THEN [ELOG_BLHeader].[PrepaidFlight] END DESC,
     CASE @OrderBy WHEN 'ShippingLine' THEN [ELOG_BLHeader].[ShippingLine] END,
     CASE @OrderBy WHEN 'ShippingLine DESC' THEN [ELOG_BLHeader].[ShippingLine] END DESC,
     CASE @OrderBy WHEN 'SOBDate' THEN [ELOG_BLHeader].[SOBDate] END,
     CASE @OrderBy WHEN 'SOBDate DESC' THEN [ELOG_BLHeader].[SOBDate] END DESC,
     CASE @OrderBy WHEN 'MBLNo' THEN [ELOG_BLHeader].[MBLNo] END,
     CASE @OrderBy WHEN 'MBLNo DESC' THEN [ELOG_BLHeader].[MBLNo] END DESC,
     CASE @OrderBy WHEN 'PreCarriageBy' THEN [ELOG_BLHeader].[PreCarriageBy] END,
     CASE @OrderBy WHEN 'PreCarriageBy DESC' THEN [ELOG_BLHeader].[PreCarriageBy] END DESC,
     CASE @OrderBy WHEN 'PlaceOfReceiptBy' THEN [ELOG_BLHeader].[PlaceOfReceiptBy] END,
     CASE @OrderBy WHEN 'PlaceOfReceiptBy DESC' THEN [ELOG_BLHeader].[PlaceOfReceiptBy] END DESC,
     CASE @OrderBy WHEN 'Air1Freight' THEN [ELOG_BLHeader].[Air1Freight] END,
     CASE @OrderBy WHEN 'Air1Freight DESC' THEN [ELOG_BLHeader].[Air1Freight] END DESC,
     CASE @OrderBy WHEN 'Air2Freight' THEN [ELOG_BLHeader].[Air2Freight] END,
     CASE @OrderBy WHEN 'Air2Freight DESC' THEN [ELOG_BLHeader].[Air2Freight] END DESC,
     CASE @OrderBy WHEN 'Air3Freight' THEN [ELOG_BLHeader].[Air3Freight] END,
     CASE @OrderBy WHEN 'Air3Freight DESC' THEN [ELOG_BLHeader].[Air3Freight] END DESC,
     CASE @OrderBy WHEN 'Air4Freight' THEN [ELOG_BLHeader].[Air4Freight] END,
     CASE @OrderBy WHEN 'Air4Freight DESC' THEN [ELOG_BLHeader].[Air4Freight] END DESC,
     CASE @OrderBy WHEN 'ELOG_Ports1_Description' THEN [ELOG_Ports1].[Description] END,
     CASE @OrderBy WHEN 'ELOG_Ports1_Description DESC' THEN [ELOG_Ports1].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
