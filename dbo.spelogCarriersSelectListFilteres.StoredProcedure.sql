USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogCarriersSelectListFilteres]
  @Filter_ShipmentModeID Int,
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
 ,CarrierID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CarrierID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ELOG_Carriers].[CarrierID]'
  SET @LGSQL = @LGSQL + ' FROM [ELOG_Carriers] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_ShipmentModes] AS [ELOG_ShipmentModes1]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_Carriers].[ShipmentModeID] = [ELOG_ShipmentModes1].[ShipmentModeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ShipmentModeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ELOG_Carriers].[ShipmentModeID] = ' + STR(@Filter_ShipmentModeID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CarrierID' THEN '[ELOG_Carriers].[CarrierID]'
                        WHEN 'CarrierID DESC' THEN '[ELOG_Carriers].[CarrierID] DESC'
                        WHEN 'ShipmentModeID' THEN '[ELOG_Carriers].[ShipmentModeID]'
                        WHEN 'ShipmentModeID DESC' THEN '[ELOG_Carriers].[ShipmentModeID] DESC'
                        WHEN 'Description' THEN '[ELOG_Carriers].[Description]'
                        WHEN 'Description DESC' THEN '[ELOG_Carriers].[Description] DESC'
                        WHEN 'ELOG_ShipmentModes1_Description' THEN '[ELOG_ShipmentModes1].[Description]'
                        WHEN 'ELOG_ShipmentModes1_Description DESC' THEN '[ELOG_ShipmentModes1].[Description] DESC'
                        ELSE '[ELOG_Carriers].[CarrierID]'
                    END
  EXEC (@LGSQL)

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
