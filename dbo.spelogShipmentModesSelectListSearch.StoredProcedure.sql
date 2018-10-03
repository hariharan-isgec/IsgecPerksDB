USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogShipmentModesSelectListSearch]
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
 ,ShipmentModeID Int NOT NULL
  )
  INSERT INTO #PageIndex (ShipmentModeID)
  SELECT [ELOG_ShipmentModes].[ShipmentModeID] FROM [ELOG_ShipmentModes]
 WHERE  
   ( 
         STR(ISNULL([ELOG_ShipmentModes].[ShipmentModeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_ShipmentModes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ShipmentModeID' THEN [ELOG_ShipmentModes].[ShipmentModeID] END,
     CASE @OrderBy WHEN 'ShipmentModeID DESC' THEN [ELOG_ShipmentModes].[ShipmentModeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_ShipmentModes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_ShipmentModes].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [ELOG_ShipmentModes].*  
  FROM [ELOG_ShipmentModes] 
      INNER JOIN #PageIndex
          ON [ELOG_ShipmentModes].[ShipmentModeID] = #PageIndex.ShipmentModeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
