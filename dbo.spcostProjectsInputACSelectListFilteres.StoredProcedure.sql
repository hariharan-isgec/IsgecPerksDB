USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectsInputACSelectListFilteres]
  @Filter_ProjectGroupID Int,
  @Filter_FinYear Int,
  @Filter_Quarter Int,
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
 ,ProjectGroupID Int NOT NULL
 ,FinYear Int NOT NULL
 ,Quarter Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectGroupID'
  SET @LGSQL = @LGSQL + ', FinYear'
  SET @LGSQL = @LGSQL + ', Quarter'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[COST_ProjectsInput].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + ', [COST_ProjectsInput].[FinYear]'
  SET @LGSQL = @LGSQL + ', [COST_ProjectsInput].[Quarter]'
  SET @LGSQL = @LGSQL + ' FROM [COST_ProjectsInput] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [COST_ProjectsInput].[CreatedBy] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]'
  SET @LGSQL = @LGSQL + '    ON [COST_ProjectsInput].[ApprovedBy] = [aspnet_users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_FinYear] AS [COST_FinYear3]'
  SET @LGSQL = @LGSQL + '    ON [COST_ProjectsInput].[FinYear] = [COST_FinYear3].[FinYear]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups4]'
  SET @LGSQL = @LGSQL + '    ON [COST_ProjectsInput].[ProjectGroupID] = [COST_ProjectGroups4].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [COST_ProjectInputStatus] AS [COST_ProjectInputStatus5]'
  SET @LGSQL = @LGSQL + '    ON [COST_ProjectsInput].[StatusID] = [COST_ProjectInputStatus5].[StatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_Quarters] AS [COST_Quarters6]'
  SET @LGSQL = @LGSQL + '    ON [COST_ProjectsInput].[Quarter] = [COST_Quarters6].[Quarter]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users7]'
  SET @LGSQL = @LGSQL + '    ON [COST_ProjectsInput].[ReceivedBy] = [aspnet_users7].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies8]'
  SET @LGSQL = @LGSQL + '    ON [COST_ProjectsInput].[CurrencyGOV] = [TA_Currencies8].[CurrencyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies9]'
  SET @LGSQL = @LGSQL + '    ON [COST_ProjectsInput].[CurrencyPR] = [TA_Currencies9].[CurrencyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies10]'
  SET @LGSQL = @LGSQL + '    ON [COST_ProjectsInput].[CurrencyPRByAC] = [TA_Currencies10].[CurrencyID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectGroupID > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_ProjectsInput].[ProjectGroupID] = ' + STR(@Filter_ProjectGroupID)
  IF (@Filter_FinYear > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_ProjectsInput].[FinYear] = ' + STR(@Filter_FinYear)
  IF (@Filter_Quarter > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_ProjectsInput].[Quarter] = ' + STR(@Filter_Quarter)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectGroupID' THEN '[COST_ProjectsInput].[ProjectGroupID]'
                        WHEN 'ProjectGroupID DESC' THEN '[COST_ProjectsInput].[ProjectGroupID] DESC'
                        WHEN 'StatusID' THEN '[COST_ProjectsInput].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[COST_ProjectsInput].[StatusID] DESC'
                        WHEN 'FinYear' THEN '[COST_ProjectsInput].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[COST_ProjectsInput].[FinYear] DESC'
                        WHEN 'Quarter' THEN '[COST_ProjectsInput].[Quarter]'
                        WHEN 'Quarter DESC' THEN '[COST_ProjectsInput].[Quarter] DESC'
                        WHEN 'CurrencyGOV' THEN '[COST_ProjectsInput].[CurrencyGOV]'
                        WHEN 'CurrencyGOV DESC' THEN '[COST_ProjectsInput].[CurrencyGOV] DESC'
                        WHEN 'GroupOrderValue' THEN '[COST_ProjectsInput].[GroupOrderValue]'
                        WHEN 'GroupOrderValue DESC' THEN '[COST_ProjectsInput].[GroupOrderValue] DESC'
                        WHEN 'CFforGOV' THEN '[COST_ProjectsInput].[CFforGOV]'
                        WHEN 'CFforGOV DESC' THEN '[COST_ProjectsInput].[CFforGOV] DESC'
                        WHEN 'GroupOrderValueINR' THEN '[COST_ProjectsInput].[GroupOrderValueINR]'
                        WHEN 'GroupOrderValueINR DESC' THEN '[COST_ProjectsInput].[GroupOrderValueINR] DESC'
                        WHEN 'CurrencyPR' THEN '[COST_ProjectsInput].[CurrencyPR]'
                        WHEN 'CurrencyPR DESC' THEN '[COST_ProjectsInput].[CurrencyPR] DESC'
                        WHEN 'CFforPR' THEN '[COST_ProjectsInput].[CFforPR]'
                        WHEN 'CFforPR DESC' THEN '[COST_ProjectsInput].[CFforPR] DESC'
                        WHEN 'ProjectRevenue' THEN '[COST_ProjectsInput].[ProjectRevenue]'
                        WHEN 'ProjectRevenue DESC' THEN '[COST_ProjectsInput].[ProjectRevenue] DESC'
                        WHEN 'ProjectMargin' THEN '[COST_ProjectsInput].[ProjectMargin]'
                        WHEN 'ProjectMargin DESC' THEN '[COST_ProjectsInput].[ProjectMargin] DESC'
                        WHEN 'ExportIncentive' THEN '[COST_ProjectsInput].[ExportIncentive]'
                        WHEN 'ExportIncentive DESC' THEN '[COST_ProjectsInput].[ExportIncentive] DESC'
                        WHEN 'Remarks' THEN '[COST_ProjectsInput].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[COST_ProjectsInput].[Remarks] DESC'
                        WHEN 'ProjectMarginINR' THEN '[COST_ProjectsInput].[ProjectMarginINR]'
                        WHEN 'ProjectMarginINR DESC' THEN '[COST_ProjectsInput].[ProjectMarginINR] DESC'
                        WHEN 'ProjectMarginByAC' THEN '[COST_ProjectsInput].[ProjectMarginByAC]'
                        WHEN 'ProjectMarginByAC DESC' THEN '[COST_ProjectsInput].[ProjectMarginByAC] DESC'
                        WHEN 'ProjectRevenueINR' THEN '[COST_ProjectsInput].[ProjectRevenueINR]'
                        WHEN 'ProjectRevenueINR DESC' THEN '[COST_ProjectsInput].[ProjectRevenueINR] DESC'
                        WHEN 'ProjectRevenueByAC' THEN '[COST_ProjectsInput].[ProjectRevenueByAC]'
                        WHEN 'ProjectRevenueByAC DESC' THEN '[COST_ProjectsInput].[ProjectRevenueByAC] DESC'
                        WHEN 'ExportIncentiveINR' THEN '[COST_ProjectsInput].[ExportIncentiveINR]'
                        WHEN 'ExportIncentiveINR DESC' THEN '[COST_ProjectsInput].[ExportIncentiveINR] DESC'
                        WHEN 'ExportIncentiveByAC' THEN '[COST_ProjectsInput].[ExportIncentiveByAC]'
                        WHEN 'ExportIncentiveByAC DESC' THEN '[COST_ProjectsInput].[ExportIncentiveByAC] DESC'
                        WHEN 'CFforPRByAC' THEN '[COST_ProjectsInput].[CFforPRByAC]'
                        WHEN 'CFforPRByAC DESC' THEN '[COST_ProjectsInput].[CFforPRByAC] DESC'
                        WHEN 'ProjectRevenueByACINR' THEN '[COST_ProjectsInput].[ProjectRevenueByACINR]'
                        WHEN 'ProjectRevenueByACINR DESC' THEN '[COST_ProjectsInput].[ProjectRevenueByACINR] DESC'
                        WHEN 'ProjectMarginByACINR' THEN '[COST_ProjectsInput].[ProjectMarginByACINR]'
                        WHEN 'ProjectMarginByACINR DESC' THEN '[COST_ProjectsInput].[ProjectMarginByACINR] DESC'
                        WHEN 'ExportIncentiveByACINR' THEN '[COST_ProjectsInput].[ExportIncentiveByACINR]'
                        WHEN 'ExportIncentiveByACINR DESC' THEN '[COST_ProjectsInput].[ExportIncentiveByACINR] DESC'
                        WHEN 'CFforBalanceCalculationByAC' THEN '[COST_ProjectsInput].[CFforBalanceCalculationByAC]'
                        WHEN 'CFforBalanceCalculationByAC DESC' THEN '[COST_ProjectsInput].[CFforBalanceCalculationByAC] DESC'
                        WHEN 'ReceivedBy' THEN '[COST_ProjectsInput].[ReceivedBy]'
                        WHEN 'ReceivedBy DESC' THEN '[COST_ProjectsInput].[ReceivedBy] DESC'
                        WHEN 'CreatedBy' THEN '[COST_ProjectsInput].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[COST_ProjectsInput].[CreatedBy] DESC'
                        WHEN 'CreatedOn' THEN '[COST_ProjectsInput].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[COST_ProjectsInput].[CreatedOn] DESC'
                        WHEN 'ApproverRemarks' THEN '[COST_ProjectsInput].[ApproverRemarks]'
                        WHEN 'ApproverRemarks DESC' THEN '[COST_ProjectsInput].[ApproverRemarks] DESC'
                        WHEN 'ApprovedOn' THEN '[COST_ProjectsInput].[ApprovedOn]'
                        WHEN 'ApprovedOn DESC' THEN '[COST_ProjectsInput].[ApprovedOn] DESC'
                        WHEN 'CurrencyPRByAC' THEN '[COST_ProjectsInput].[CurrencyPRByAC]'
                        WHEN 'CurrencyPRByAC DESC' THEN '[COST_ProjectsInput].[CurrencyPRByAC] DESC'
                        WHEN 'ApprovedBy' THEN '[COST_ProjectsInput].[ApprovedBy]'
                        WHEN 'ApprovedBy DESC' THEN '[COST_ProjectsInput].[ApprovedBy] DESC'
                        WHEN 'ReceiverRemarks' THEN '[COST_ProjectsInput].[ReceiverRemarks]'
                        WHEN 'ReceiverRemarks DESC' THEN '[COST_ProjectsInput].[ReceiverRemarks] DESC'
                        WHEN 'ReceivedOn' THEN '[COST_ProjectsInput].[ReceivedOn]'
                        WHEN 'ReceivedOn DESC' THEN '[COST_ProjectsInput].[ReceivedOn] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'COST_FinYear3_Descpription' THEN '[COST_FinYear3].[Descpription]'
                        WHEN 'COST_FinYear3_Descpription DESC' THEN '[COST_FinYear3].[Descpription] DESC'
                        WHEN 'COST_ProjectGroups4_ProjectGroupDescription' THEN '[COST_ProjectGroups4].[ProjectGroupDescription]'
                        WHEN 'COST_ProjectGroups4_ProjectGroupDescription DESC' THEN '[COST_ProjectGroups4].[ProjectGroupDescription] DESC'
                        WHEN 'COST_ProjectInputStatus5_Description' THEN '[COST_ProjectInputStatus5].[Description]'
                        WHEN 'COST_ProjectInputStatus5_Description DESC' THEN '[COST_ProjectInputStatus5].[Description] DESC'
                        WHEN 'COST_Quarters6_Description' THEN '[COST_Quarters6].[Description]'
                        WHEN 'COST_Quarters6_Description DESC' THEN '[COST_Quarters6].[Description] DESC'
                        WHEN 'aspnet_Users7_UserFullName' THEN '[aspnet_Users7].[UserFullName]'
                        WHEN 'aspnet_Users7_UserFullName DESC' THEN '[aspnet_Users7].[UserFullName] DESC'
                        WHEN 'TA_Currencies8_CurrencyName' THEN '[TA_Currencies8].[CurrencyName]'
                        WHEN 'TA_Currencies8_CurrencyName DESC' THEN '[TA_Currencies8].[CurrencyName] DESC'
                        WHEN 'TA_Currencies9_CurrencyName' THEN '[TA_Currencies9].[CurrencyName]'
                        WHEN 'TA_Currencies9_CurrencyName DESC' THEN '[TA_Currencies9].[CurrencyName] DESC'
                        WHEN 'TA_Currencies10_CurrencyName' THEN '[TA_Currencies10].[CurrencyName]'
                        WHEN 'TA_Currencies10_CurrencyName DESC' THEN '[TA_Currencies10].[CurrencyName] DESC'
                        ELSE '[COST_ProjectsInput].[ProjectGroupID],[COST_ProjectsInput].[FinYear],[COST_ProjectsInput].[Quarter]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [COST_ProjectsInput].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [COST_FinYear3].[Descpription] AS COST_FinYear3_Descpription,
    [COST_ProjectGroups4].[ProjectGroupDescription] AS COST_ProjectGroups4_ProjectGroupDescription,
    [COST_ProjectInputStatus5].[Description] AS COST_ProjectInputStatus5_Description,
    [COST_Quarters6].[Description] AS COST_Quarters6_Description,
    [aspnet_Users7].[UserFullName] AS aspnet_Users7_UserFullName,
    [TA_Currencies8].[CurrencyName] AS TA_Currencies8_CurrencyName,
    [TA_Currencies9].[CurrencyName] AS TA_Currencies9_CurrencyName,
    [TA_Currencies10].[CurrencyName] AS TA_Currencies10_CurrencyName 
  FROM [COST_ProjectsInput] 
      INNER JOIN #PageIndex
          ON [COST_ProjectsInput].[ProjectGroupID] = #PageIndex.ProjectGroupID
          AND [COST_ProjectsInput].[FinYear] = #PageIndex.FinYear
          AND [COST_ProjectsInput].[Quarter] = #PageIndex.Quarter
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [COST_ProjectsInput].[CreatedBy] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [COST_ProjectsInput].[ApprovedBy] = [aspnet_users2].[LoginID]
  INNER JOIN [COST_FinYear] AS [COST_FinYear3]
    ON [COST_ProjectsInput].[FinYear] = [COST_FinYear3].[FinYear]
  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups4]
    ON [COST_ProjectsInput].[ProjectGroupID] = [COST_ProjectGroups4].[ProjectGroupID]
  LEFT OUTER JOIN [COST_ProjectInputStatus] AS [COST_ProjectInputStatus5]
    ON [COST_ProjectsInput].[StatusID] = [COST_ProjectInputStatus5].[StatusID]
  INNER JOIN [COST_Quarters] AS [COST_Quarters6]
    ON [COST_ProjectsInput].[Quarter] = [COST_Quarters6].[Quarter]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users7]
    ON [COST_ProjectsInput].[ReceivedBy] = [aspnet_users7].[LoginID]
  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies8]
    ON [COST_ProjectsInput].[CurrencyGOV] = [TA_Currencies8].[CurrencyID]
  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies9]
    ON [COST_ProjectsInput].[CurrencyPR] = [TA_Currencies9].[CurrencyID]
  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies10]
    ON [COST_ProjectsInput].[CurrencyPRByAC] = [TA_Currencies10].[CurrencyID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
