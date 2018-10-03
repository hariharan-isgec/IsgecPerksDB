USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostQProjectsSelectListFilteres]
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
 ,FinYear Int NOT NULL
 ,Quarter Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ', FinYear'
  SET @LGSQL = @LGSQL + ', Quarter'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[COST_Projects].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [COST_Projects].[FinYear]'
  SET @LGSQL = @LGSQL + ', [COST_Projects].[Quarter]'
  SET @LGSQL = @LGSQL + ' FROM [COST_Projects] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [COST_Divisions] AS [COST_Divisions1]'
  SET @LGSQL = @LGSQL + '    ON [COST_Projects].[DivisionID] = [COST_Divisions1].[DivisionID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_FinYear] AS [COST_FinYear2]'
  SET @LGSQL = @LGSQL + '    ON [COST_Projects].[FinYear] = [COST_FinYear2].[FinYear]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [COST_ProjectTypes] AS [COST_ProjectTypes3]'
  SET @LGSQL = @LGSQL + '    ON [COST_Projects].[ProjectTypeID] = [COST_ProjectTypes3].[ProjectTypeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_Quarters] AS [COST_Quarters4]'
  SET @LGSQL = @LGSQL + '    ON [COST_Projects].[Quarter] = [COST_Quarters4].[Quarter]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [COST_WorkOrderTypes] AS [COST_WorkOrderTypes5]'
  SET @LGSQL = @LGSQL + '    ON [COST_Projects].[WorkOrderTypeID] = [COST_WorkOrderTypes5].[WorkOrderTypeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects6]'
  SET @LGSQL = @LGSQL + '    ON [COST_Projects].[ProjectID] = [IDM_Projects6].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies7]'
  SET @LGSQL = @LGSQL + '    ON [COST_Projects].[CurrencyID] = [TA_Currencies7].[CurrencyID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [COST_Projects].[ProjectID] = ''' + @Filter_ProjectID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[COST_Projects].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[COST_Projects].[ProjectID] DESC'
                        WHEN 'Description' THEN '[COST_Projects].[Description]'
                        WHEN 'Description DESC' THEN '[COST_Projects].[Description] DESC'
                        WHEN 'FinYear' THEN '[COST_Projects].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[COST_Projects].[FinYear] DESC'
                        WHEN 'Quarter' THEN '[COST_Projects].[Quarter]'
                        WHEN 'Quarter DESC' THEN '[COST_Projects].[Quarter] DESC'
                        WHEN 'ProjectTypeID' THEN '[COST_Projects].[ProjectTypeID]'
                        WHEN 'ProjectTypeID DESC' THEN '[COST_Projects].[ProjectTypeID] DESC'
                        WHEN 'WorkOrderTypeID' THEN '[COST_Projects].[WorkOrderTypeID]'
                        WHEN 'WorkOrderTypeID DESC' THEN '[COST_Projects].[WorkOrderTypeID] DESC'
                        WHEN 'DivisionID' THEN '[COST_Projects].[DivisionID]'
                        WHEN 'DivisionID DESC' THEN '[COST_Projects].[DivisionID] DESC'
                        WHEN 'CurrencyID' THEN '[COST_Projects].[CurrencyID]'
                        WHEN 'CurrencyID DESC' THEN '[COST_Projects].[CurrencyID] DESC'
                        WHEN 'CFforPOV' THEN '[COST_Projects].[CFforPOV]'
                        WHEN 'CFforPOV DESC' THEN '[COST_Projects].[CFforPOV] DESC'
                        WHEN 'ProjectOrderValue' THEN '[COST_Projects].[ProjectOrderValue]'
                        WHEN 'ProjectOrderValue DESC' THEN '[COST_Projects].[ProjectOrderValue] DESC'
                        WHEN 'ProjectCost' THEN '[COST_Projects].[ProjectCost]'
                        WHEN 'ProjectCost DESC' THEN '[COST_Projects].[ProjectCost] DESC'
                        WHEN 'MarginCurrentYear' THEN '[COST_Projects].[MarginCurrentYear]'
                        WHEN 'MarginCurrentYear DESC' THEN '[COST_Projects].[MarginCurrentYear] DESC'
                        WHEN 'WarrantyPercentage' THEN '[COST_Projects].[WarrantyPercentage]'
                        WHEN 'WarrantyPercentage DESC' THEN '[COST_Projects].[WarrantyPercentage] DESC'
                        WHEN 'ProjectOrderValueINR' THEN '[COST_Projects].[ProjectOrderValueINR]'
                        WHEN 'ProjectOrderValueINR DESC' THEN '[COST_Projects].[ProjectOrderValueINR] DESC'
                        WHEN 'MarginCurrentYearINR' THEN '[COST_Projects].[MarginCurrentYearINR]'
                        WHEN 'MarginCurrentYearINR DESC' THEN '[COST_Projects].[MarginCurrentYearINR] DESC'
                        WHEN 'ProjectCostINR' THEN '[COST_Projects].[ProjectCostINR]'
                        WHEN 'ProjectCostINR DESC' THEN '[COST_Projects].[ProjectCostINR] DESC'
                        WHEN 'BusinessPartnerID' THEN '[COST_Projects].[BusinessPartnerID]'
                        WHEN 'BusinessPartnerID DESC' THEN '[COST_Projects].[BusinessPartnerID] DESC'
                        WHEN 'COST_Divisions1_DivisionName' THEN '[COST_Divisions1].[DivisionName]'
                        WHEN 'COST_Divisions1_DivisionName DESC' THEN '[COST_Divisions1].[DivisionName] DESC'
                        WHEN 'COST_FinYear2_Descpription' THEN '[COST_FinYear2].[Descpription]'
                        WHEN 'COST_FinYear2_Descpription DESC' THEN '[COST_FinYear2].[Descpription] DESC'
                        WHEN 'COST_ProjectTypes3_ProjectTypeDescription' THEN '[COST_ProjectTypes3].[ProjectTypeDescription]'
                        WHEN 'COST_ProjectTypes3_ProjectTypeDescription DESC' THEN '[COST_ProjectTypes3].[ProjectTypeDescription] DESC'
                        WHEN 'COST_Quarters4_Description' THEN '[COST_Quarters4].[Description]'
                        WHEN 'COST_Quarters4_Description DESC' THEN '[COST_Quarters4].[Description] DESC'
                        WHEN 'COST_WorkOrderTypes5_WorkOrderTypeDescription' THEN '[COST_WorkOrderTypes5].[WorkOrderTypeDescription]'
                        WHEN 'COST_WorkOrderTypes5_WorkOrderTypeDescription DESC' THEN '[COST_WorkOrderTypes5].[WorkOrderTypeDescription] DESC'
                        WHEN 'IDM_Projects6_Description' THEN '[IDM_Projects6].[Description]'
                        WHEN 'IDM_Projects6_Description DESC' THEN '[IDM_Projects6].[Description] DESC'
                        WHEN 'TA_Currencies7_CurrencyName' THEN '[TA_Currencies7].[CurrencyName]'
                        WHEN 'TA_Currencies7_CurrencyName DESC' THEN '[TA_Currencies7].[CurrencyName] DESC'
                        ELSE '[COST_Projects].[ProjectID],[COST_Projects].[FinYear],[COST_Projects].[Quarter]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [COST_Projects].* ,
    [COST_Divisions1].[DivisionName] AS COST_Divisions1_DivisionName,
    [COST_FinYear2].[Descpription] AS COST_FinYear2_Descpription,
    [COST_ProjectTypes3].[ProjectTypeDescription] AS COST_ProjectTypes3_ProjectTypeDescription,
    [COST_Quarters4].[Description] AS COST_Quarters4_Description,
    [COST_WorkOrderTypes5].[WorkOrderTypeDescription] AS COST_WorkOrderTypes5_WorkOrderTypeDescription,
    [IDM_Projects6].[Description] AS IDM_Projects6_Description,
    [TA_Currencies7].[CurrencyName] AS TA_Currencies7_CurrencyName 
  FROM [COST_Projects] 
      INNER JOIN #PageIndex
          ON [COST_Projects].[ProjectID] = #PageIndex.ProjectID
          AND [COST_Projects].[FinYear] = #PageIndex.FinYear
          AND [COST_Projects].[Quarter] = #PageIndex.Quarter
  LEFT OUTER JOIN [COST_Divisions] AS [COST_Divisions1]
    ON [COST_Projects].[DivisionID] = [COST_Divisions1].[DivisionID]
  INNER JOIN [COST_FinYear] AS [COST_FinYear2]
    ON [COST_Projects].[FinYear] = [COST_FinYear2].[FinYear]
  LEFT OUTER JOIN [COST_ProjectTypes] AS [COST_ProjectTypes3]
    ON [COST_Projects].[ProjectTypeID] = [COST_ProjectTypes3].[ProjectTypeID]
  INNER JOIN [COST_Quarters] AS [COST_Quarters4]
    ON [COST_Projects].[Quarter] = [COST_Quarters4].[Quarter]
  LEFT OUTER JOIN [COST_WorkOrderTypes] AS [COST_WorkOrderTypes5]
    ON [COST_Projects].[WorkOrderTypeID] = [COST_WorkOrderTypes5].[WorkOrderTypeID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects6]
    ON [COST_Projects].[ProjectID] = [IDM_Projects6].[ProjectID]
  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies7]
    ON [COST_Projects].[CurrencyID] = [TA_Currencies7].[CurrencyID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
