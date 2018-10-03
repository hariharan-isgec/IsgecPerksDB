USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBLHeaderSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,BLID NVarChar(9) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'BLID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ELOG_BLHeader].[BLID]'
  SET @LGSQL = @LGSQL + ' FROM [ELOG_BLHeader] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_Ports] AS [ELOG_Ports1]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_BLHeader].[TransShipmentPortID] = [ELOG_Ports1].[PortID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'BLID' THEN '[ELOG_BLHeader].[BLID]'
                        WHEN 'BLID DESC' THEN '[ELOG_BLHeader].[BLID] DESC'
                        WHEN 'BLNumber' THEN '[ELOG_BLHeader].[BLNumber]'
                        WHEN 'BLNumber DESC' THEN '[ELOG_BLHeader].[BLNumber] DESC'
                        WHEN 'BLDate' THEN '[ELOG_BLHeader].[BLDate]'
                        WHEN 'BLDate DESC' THEN '[ELOG_BLHeader].[BLDate] DESC'
                        WHEN 'PortOfLoading' THEN '[ELOG_BLHeader].[PortOfLoading]'
                        WHEN 'PortOfLoading DESC' THEN '[ELOG_BLHeader].[PortOfLoading] DESC'
                        WHEN 'VesselOrFlightNo' THEN '[ELOG_BLHeader].[VesselOrFlightNo]'
                        WHEN 'VesselOrFlightNo DESC' THEN '[ELOG_BLHeader].[VesselOrFlightNo] DESC'
                        WHEN 'VoyageNo' THEN '[ELOG_BLHeader].[VoyageNo]'
                        WHEN 'VoyageNo DESC' THEN '[ELOG_BLHeader].[VoyageNo] DESC'
                        WHEN 'TransShipmentPortID' THEN '[ELOG_BLHeader].[TransShipmentPortID]'
                        WHEN 'TransShipmentPortID DESC' THEN '[ELOG_BLHeader].[TransShipmentPortID] DESC'
                        WHEN 'PrepaidFlight' THEN '[ELOG_BLHeader].[PrepaidFlight]'
                        WHEN 'PrepaidFlight DESC' THEN '[ELOG_BLHeader].[PrepaidFlight] DESC'
                        WHEN 'ShippingLine' THEN '[ELOG_BLHeader].[ShippingLine]'
                        WHEN 'ShippingLine DESC' THEN '[ELOG_BLHeader].[ShippingLine] DESC'
                        WHEN 'SOBDate' THEN '[ELOG_BLHeader].[SOBDate]'
                        WHEN 'SOBDate DESC' THEN '[ELOG_BLHeader].[SOBDate] DESC'
                        WHEN 'MBLNo' THEN '[ELOG_BLHeader].[MBLNo]'
                        WHEN 'MBLNo DESC' THEN '[ELOG_BLHeader].[MBLNo] DESC'
                        WHEN 'PreCarriageBy' THEN '[ELOG_BLHeader].[PreCarriageBy]'
                        WHEN 'PreCarriageBy DESC' THEN '[ELOG_BLHeader].[PreCarriageBy] DESC'
                        WHEN 'PlaceOfReceiptBy' THEN '[ELOG_BLHeader].[PlaceOfReceiptBy]'
                        WHEN 'PlaceOfReceiptBy DESC' THEN '[ELOG_BLHeader].[PlaceOfReceiptBy] DESC'
                        WHEN 'Air1Freight' THEN '[ELOG_BLHeader].[Air1Freight]'
                        WHEN 'Air1Freight DESC' THEN '[ELOG_BLHeader].[Air1Freight] DESC'
                        WHEN 'Air2Freight' THEN '[ELOG_BLHeader].[Air2Freight]'
                        WHEN 'Air2Freight DESC' THEN '[ELOG_BLHeader].[Air2Freight] DESC'
                        WHEN 'Air3Freight' THEN '[ELOG_BLHeader].[Air3Freight]'
                        WHEN 'Air3Freight DESC' THEN '[ELOG_BLHeader].[Air3Freight] DESC'
                        WHEN 'Air4Freight' THEN '[ELOG_BLHeader].[Air4Freight]'
                        WHEN 'Air4Freight DESC' THEN '[ELOG_BLHeader].[Air4Freight] DESC'
                        WHEN 'ELOG_Ports1_Description' THEN '[ELOG_Ports1].[Description]'
                        WHEN 'ELOG_Ports1_Description DESC' THEN '[ELOG_Ports1].[Description] DESC'
                        ELSE '[ELOG_BLHeader].[BLID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [ELOG_BLHeader].* ,
    [ELOG_Ports1].[Description] AS ELOG_Ports1_Description 
  FROM [ELOG_BLHeader] 
      INNER JOIN #PageIndex
          ON [ELOG_BLHeader].[BLID] = #PageIndex.BLID
  LEFT OUTER JOIN [ELOG_Ports] AS [ELOG_Ports1]
    ON [ELOG_BLHeader].[TransShipmentPortID] = [ELOG_Ports1].[PortID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
