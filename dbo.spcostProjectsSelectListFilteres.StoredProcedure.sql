USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectsSelectListFilteres]
  @Filter_ProjectID NVarChar(6),
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
 ,ProjectID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_Projects].[ProjectID]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_Projects] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [COST_Divisions] AS [COST_Divisions1]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Projects].[DivisionID] = [COST_Divisions1].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [COST_ProjectTypes] AS [COST_ProjectTypes2]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Projects].[ProjectTypeID] = [COST_ProjectTypes2].[ProjectTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [COST_WorkOrderTypes] AS [COST_WorkOrderTypes3]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Projects].[WorkOrderTypeID] = [COST_WorkOrderTypes3].[WorkOrderTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies6]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Projects].[CurrencyID] = [TA_Currencies6].[CurrencyID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [IDM_Projects].[ProjectID] = ''' + @Filter_ProjectID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectCost' THEN '[IDM_Projects].[ProjectCost]'
                        WHEN 'ProjectCost DESC' THEN '[IDM_Projects].[ProjectCost] DESC'
                        WHEN 'ProjectCostINR' THEN '[IDM_Projects].[ProjectCostINR]'
                        WHEN 'ProjectCostINR DESC' THEN '[IDM_Projects].[ProjectCostINR] DESC'
                        WHEN 'MarginCurrentYear' THEN '[IDM_Projects].[MarginCurrentYear]'
                        WHEN 'MarginCurrentYear DESC' THEN '[IDM_Projects].[MarginCurrentYear] DESC'
                        WHEN 'MarginCurrentYearINR' THEN '[IDM_Projects].[MarginCurrentYearINR]'
                        WHEN 'MarginCurrentYearINR DESC' THEN '[IDM_Projects].[MarginCurrentYearINR] DESC'
                        WHEN 'Description' THEN '[IDM_Projects].[Description]'
                        WHEN 'Description DESC' THEN '[IDM_Projects].[Description] DESC'
                        WHEN 'ProjectTypeID' THEN '[IDM_Projects].[ProjectTypeID]'
                        WHEN 'ProjectTypeID DESC' THEN '[IDM_Projects].[ProjectTypeID] DESC'
                        WHEN 'ProjectOrderValue' THEN '[IDM_Projects].[ProjectOrderValue]'
                        WHEN 'ProjectOrderValue DESC' THEN '[IDM_Projects].[ProjectOrderValue] DESC'
                        WHEN 'DivisionID' THEN '[IDM_Projects].[DivisionID]'
                        WHEN 'DivisionID DESC' THEN '[IDM_Projects].[DivisionID] DESC'
                        WHEN 'CurrencyID' THEN '[IDM_Projects].[CurrencyID]'
                        WHEN 'CurrencyID DESC' THEN '[IDM_Projects].[CurrencyID] DESC'
                        WHEN 'WarrantyPercentage' THEN '[IDM_Projects].[WarrantyPercentage]'
                        WHEN 'WarrantyPercentage DESC' THEN '[IDM_Projects].[WarrantyPercentage] DESC'
                        WHEN 'CFforPOV' THEN '[IDM_Projects].[CFforPOV]'
                        WHEN 'CFforPOV DESC' THEN '[IDM_Projects].[CFforPOV] DESC'
                        WHEN 'ProjectID' THEN '[IDM_Projects].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[IDM_Projects].[ProjectID] DESC'
                        WHEN 'WorkOrderTypeID' THEN '[IDM_Projects].[WorkOrderTypeID]'
                        WHEN 'WorkOrderTypeID DESC' THEN '[IDM_Projects].[WorkOrderTypeID] DESC'
                        WHEN 'ProjectOrderValueINR' THEN '[IDM_Projects].[ProjectOrderValueINR]'
                        WHEN 'ProjectOrderValueINR DESC' THEN '[IDM_Projects].[ProjectOrderValueINR] DESC'
                        WHEN 'COST_Divisions1_DivisionName' THEN '[COST_Divisions1].[DivisionName]'
                        WHEN 'COST_Divisions1_DivisionName DESC' THEN '[COST_Divisions1].[DivisionName] DESC'
                        WHEN 'COST_ProjectTypes2_ProjectTypeDescription' THEN '[COST_ProjectTypes2].[ProjectTypeDescription]'
                        WHEN 'COST_ProjectTypes2_ProjectTypeDescription DESC' THEN '[COST_ProjectTypes2].[ProjectTypeDescription] DESC'
                        WHEN 'COST_WorkOrderTypes3_WorkOrderTypeDescription' THEN '[COST_WorkOrderTypes3].[WorkOrderTypeDescription]'
                        WHEN 'COST_WorkOrderTypes3_WorkOrderTypeDescription DESC' THEN '[COST_WorkOrderTypes3].[WorkOrderTypeDescription] DESC'
                        WHEN 'TA_Currencies6_CurrencyName' THEN '[TA_Currencies6].[CurrencyName]'
                        WHEN 'TA_Currencies6_CurrencyName DESC' THEN '[TA_Currencies6].[CurrencyName] DESC'
                        ELSE '[IDM_Projects].[ProjectID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [IDM_Projects].* ,
    [COST_Divisions1].[DivisionName] AS COST_Divisions1_DivisionName,
    [COST_ProjectTypes2].[ProjectTypeDescription] AS COST_ProjectTypes2_ProjectTypeDescription,
    [COST_WorkOrderTypes3].[WorkOrderTypeDescription] AS COST_WorkOrderTypes3_WorkOrderTypeDescription,
    [TA_Currencies6].[CurrencyName] AS TA_Currencies6_CurrencyName 
  FROM [IDM_Projects] 
      INNER JOIN #PageIndex
          ON [IDM_Projects].[ProjectID] = #PageIndex.ProjectID
  LEFT OUTER JOIN [COST_Divisions] AS [COST_Divisions1]
    ON [IDM_Projects].[DivisionID] = [COST_Divisions1].[DivisionID]
  LEFT OUTER JOIN [COST_ProjectTypes] AS [COST_ProjectTypes2]
    ON [IDM_Projects].[ProjectTypeID] = [COST_ProjectTypes2].[ProjectTypeID]
  LEFT OUTER JOIN [COST_WorkOrderTypes] AS [COST_WorkOrderTypes3]
    ON [IDM_Projects].[WorkOrderTypeID] = [COST_WorkOrderTypes3].[WorkOrderTypeID]
  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies6]
    ON [IDM_Projects].[CurrencyID] = [TA_Currencies6].[CurrencyID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
