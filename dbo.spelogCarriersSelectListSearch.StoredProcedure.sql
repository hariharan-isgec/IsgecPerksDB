USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogCarriersSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,CarrierID Int NOT NULL
  )
  INSERT INTO #PageIndex (CarrierID)
  SELECT [ELOG_Carriers].[CarrierID] FROM [ELOG_Carriers]
  LEFT OUTER JOIN [ELOG_ShipmentModes] AS [ELOG_ShipmentModes1]
    ON [ELOG_Carriers].[ShipmentModeID] = [ELOG_ShipmentModes1].[ShipmentModeID]
 WHERE  
   ( 
         STR(ISNULL([ELOG_Carriers].[CarrierID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_Carriers].[ShipmentModeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_Carriers].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'CarrierID' THEN [ELOG_Carriers].[CarrierID] END,
     CASE @OrderBy WHEN 'CarrierID DESC' THEN [ELOG_Carriers].[CarrierID] END DESC,
     CASE @OrderBy WHEN 'ShipmentModeID' THEN [ELOG_Carriers].[ShipmentModeID] END,
     CASE @OrderBy WHEN 'ShipmentModeID DESC' THEN [ELOG_Carriers].[ShipmentModeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_Carriers].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_Carriers].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_ShipmentModes1_Description' THEN [ELOG_ShipmentModes1].[Description] END,
     CASE @OrderBy WHEN 'ELOG_ShipmentModes1_Description DESC' THEN [ELOG_ShipmentModes1].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [ELOG_Carriers].* ,
    [ELOG_ShipmentModes1].[Description] AS ELOG_ShipmentModes1_Description 
  FROM [ELOG_Carriers] 
      INNER JOIN #PageIndex
          ON [ELOG_Carriers].[CarrierID] = #PageIndex.CarrierID
  LEFT OUTER JOIN [ELOG_ShipmentModes] AS [ELOG_ShipmentModes1]
    ON [ELOG_Carriers].[ShipmentModeID] = [ELOG_ShipmentModes1].[ShipmentModeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
