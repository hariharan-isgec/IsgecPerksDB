USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostQProjectsSelectListSearch]
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
 ,ProjectID NVarChar(6) NOT NULL
 ,FinYear Int NOT NULL
 ,Quarter Int NOT NULL
  )
  INSERT INTO #PageIndex (ProjectID, FinYear, Quarter)
  SELECT [COST_Projects].[ProjectID], [COST_Projects].[FinYear], [COST_Projects].[Quarter] FROM [COST_Projects]
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
   ( 
         LOWER(ISNULL([COST_Projects].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_Projects].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([COST_Projects].[FinYear], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_Projects].[Quarter], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_Projects].[ProjectTypeID],'')) LIKE @KeyWord1
     OR STR(ISNULL([COST_Projects].[WorkOrderTypeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_Projects].[DivisionID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_Projects].[CurrencyID],'')) LIKE @KeyWord1
     OR STR(ISNULL([COST_Projects].[CFforPOV], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_Projects].[ProjectOrderValue], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_Projects].[ProjectCost], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_Projects].[MarginCurrentYear], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_Projects].[WarrantyPercentage], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_Projects].[ProjectOrderValueINR], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_Projects].[MarginCurrentYearINR], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_Projects].[ProjectCostINR], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_Projects].[BusinessPartnerID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [COST_Projects].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [COST_Projects].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [COST_Projects].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [COST_Projects].[Description] END DESC,
     CASE @OrderBy WHEN 'FinYear' THEN [COST_Projects].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [COST_Projects].[FinYear] END DESC,
     CASE @OrderBy WHEN 'Quarter' THEN [COST_Projects].[Quarter] END,
     CASE @OrderBy WHEN 'Quarter DESC' THEN [COST_Projects].[Quarter] END DESC,
     CASE @OrderBy WHEN 'ProjectTypeID' THEN [COST_Projects].[ProjectTypeID] END,
     CASE @OrderBy WHEN 'ProjectTypeID DESC' THEN [COST_Projects].[ProjectTypeID] END DESC,
     CASE @OrderBy WHEN 'WorkOrderTypeID' THEN [COST_Projects].[WorkOrderTypeID] END,
     CASE @OrderBy WHEN 'WorkOrderTypeID DESC' THEN [COST_Projects].[WorkOrderTypeID] END DESC,
     CASE @OrderBy WHEN 'DivisionID' THEN [COST_Projects].[DivisionID] END,
     CASE @OrderBy WHEN 'DivisionID DESC' THEN [COST_Projects].[DivisionID] END DESC,
     CASE @OrderBy WHEN 'CurrencyID' THEN [COST_Projects].[CurrencyID] END,
     CASE @OrderBy WHEN 'CurrencyID DESC' THEN [COST_Projects].[CurrencyID] END DESC,
     CASE @OrderBy WHEN 'CFforPOV' THEN [COST_Projects].[CFforPOV] END,
     CASE @OrderBy WHEN 'CFforPOV DESC' THEN [COST_Projects].[CFforPOV] END DESC,
     CASE @OrderBy WHEN 'ProjectOrderValue' THEN [COST_Projects].[ProjectOrderValue] END,
     CASE @OrderBy WHEN 'ProjectOrderValue DESC' THEN [COST_Projects].[ProjectOrderValue] END DESC,
     CASE @OrderBy WHEN 'ProjectCost' THEN [COST_Projects].[ProjectCost] END,
     CASE @OrderBy WHEN 'ProjectCost DESC' THEN [COST_Projects].[ProjectCost] END DESC,
     CASE @OrderBy WHEN 'MarginCurrentYear' THEN [COST_Projects].[MarginCurrentYear] END,
     CASE @OrderBy WHEN 'MarginCurrentYear DESC' THEN [COST_Projects].[MarginCurrentYear] END DESC,
     CASE @OrderBy WHEN 'WarrantyPercentage' THEN [COST_Projects].[WarrantyPercentage] END,
     CASE @OrderBy WHEN 'WarrantyPercentage DESC' THEN [COST_Projects].[WarrantyPercentage] END DESC,
     CASE @OrderBy WHEN 'ProjectOrderValueINR' THEN [COST_Projects].[ProjectOrderValueINR] END,
     CASE @OrderBy WHEN 'ProjectOrderValueINR DESC' THEN [COST_Projects].[ProjectOrderValueINR] END DESC,
     CASE @OrderBy WHEN 'MarginCurrentYearINR' THEN [COST_Projects].[MarginCurrentYearINR] END,
     CASE @OrderBy WHEN 'MarginCurrentYearINR DESC' THEN [COST_Projects].[MarginCurrentYearINR] END DESC,
     CASE @OrderBy WHEN 'ProjectCostINR' THEN [COST_Projects].[ProjectCostINR] END,
     CASE @OrderBy WHEN 'ProjectCostINR DESC' THEN [COST_Projects].[ProjectCostINR] END DESC,
     CASE @OrderBy WHEN 'BusinessPartnerID' THEN [COST_Projects].[BusinessPartnerID] END,
     CASE @OrderBy WHEN 'BusinessPartnerID DESC' THEN [COST_Projects].[BusinessPartnerID] END DESC,
     CASE @OrderBy WHEN 'COST_Divisions1_DivisionName' THEN [COST_Divisions1].[DivisionName] END,
     CASE @OrderBy WHEN 'COST_Divisions1_DivisionName DESC' THEN [COST_Divisions1].[DivisionName] END DESC,
     CASE @OrderBy WHEN 'COST_FinYear2_Descpription' THEN [COST_FinYear2].[Descpription] END,
     CASE @OrderBy WHEN 'COST_FinYear2_Descpription DESC' THEN [COST_FinYear2].[Descpription] END DESC,
     CASE @OrderBy WHEN 'COST_ProjectTypes3_ProjectTypeDescription' THEN [COST_ProjectTypes3].[ProjectTypeDescription] END,
     CASE @OrderBy WHEN 'COST_ProjectTypes3_ProjectTypeDescription DESC' THEN [COST_ProjectTypes3].[ProjectTypeDescription] END DESC,
     CASE @OrderBy WHEN 'COST_Quarters4_Description' THEN [COST_Quarters4].[Description] END,
     CASE @OrderBy WHEN 'COST_Quarters4_Description DESC' THEN [COST_Quarters4].[Description] END DESC,
     CASE @OrderBy WHEN 'COST_WorkOrderTypes5_WorkOrderTypeDescription' THEN [COST_WorkOrderTypes5].[WorkOrderTypeDescription] END,
     CASE @OrderBy WHEN 'COST_WorkOrderTypes5_WorkOrderTypeDescription DESC' THEN [COST_WorkOrderTypes5].[WorkOrderTypeDescription] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects6_Description' THEN [IDM_Projects6].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects6_Description DESC' THEN [IDM_Projects6].[Description] END DESC,
     CASE @OrderBy WHEN 'TA_Currencies7_CurrencyName' THEN [TA_Currencies7].[CurrencyName] END,
     CASE @OrderBy WHEN 'TA_Currencies7_CurrencyName DESC' THEN [TA_Currencies7].[CurrencyName] END DESC 

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
