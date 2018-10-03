USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogShipmentModesSelectListFilteres]
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
 ,ShipmentModeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ShipmentModeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ELOG_ShipmentModes].[ShipmentModeID]'
  SET @LGSQL = @LGSQL + ' FROM [ELOG_ShipmentModes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ShipmentModeID' THEN '[ELOG_ShipmentModes].[ShipmentModeID]'
                        WHEN 'ShipmentModeID DESC' THEN '[ELOG_ShipmentModes].[ShipmentModeID] DESC'
                        WHEN 'Description' THEN '[ELOG_ShipmentModes].[Description]'
                        WHEN 'Description DESC' THEN '[ELOG_ShipmentModes].[Description] DESC'
                        ELSE '[ELOG_ShipmentModes].[ShipmentModeID]'
                    END
  EXEC (@LGSQL)

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
