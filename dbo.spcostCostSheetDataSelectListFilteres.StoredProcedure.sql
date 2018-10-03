USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCostSheetDataSelectListFilteres]
  @Filter_Quarter Int,
  @Filter_FinYear Int,
  @Filter_ProjectGroupID Int,
  @Filter_Revision Int,
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
 ,Revision Int NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,GLCode NVarChar(7) NOT NULL
 ,AdjustmentSerialNo Int NOT NULL
 ,AdjustmentCredit Bit NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectGroupID'
  SET @LGSQL = @LGSQL + ', FinYear'
  SET @LGSQL = @LGSQL + ', Quarter'
  SET @LGSQL = @LGSQL + ', Revision'
  SET @LGSQL = @LGSQL + ', ProjectID'
  SET @LGSQL = @LGSQL + ', GLCode'
  SET @LGSQL = @LGSQL + ', AdjustmentSerialNo'
  SET @LGSQL = @LGSQL + ', AdjustmentCredit'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[COST_CostSheetData].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + ', [COST_CostSheetData].[FinYear]'
  SET @LGSQL = @LGSQL + ', [COST_CostSheetData].[Quarter]'
  SET @LGSQL = @LGSQL + ', [COST_CostSheetData].[Revision]'
  SET @LGSQL = @LGSQL + ', [COST_CostSheetData].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [COST_CostSheetData].[GLCode]'
  SET @LGSQL = @LGSQL + ', [COST_CostSheetData].[AdjustmentSerialNo]'
  SET @LGSQL = @LGSQL + ', [COST_CostSheetData].[AdjustmentCredit]'
  SET @LGSQL = @LGSQL + ' FROM [COST_CostSheetData] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_CostSheet] AS [COST_CostSheet1]'
  SET @LGSQL = @LGSQL + '    ON [COST_CostSheetData].[ProjectGroupID] = [COST_CostSheet1].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + '    AND [COST_CostSheetData].[FinYear] = [COST_CostSheet1].[FinYear]'
  SET @LGSQL = @LGSQL + '    AND [COST_CostSheetData].[Quarter] = [COST_CostSheet1].[Quarter]'
  SET @LGSQL = @LGSQL + '    AND [COST_CostSheetData].[Revision] = [COST_CostSheet1].[Revision]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_ERPGLCodes] AS [COST_ERPGLCodes2]'
  SET @LGSQL = @LGSQL + '    ON [COST_CostSheetData].[GLCode] = [COST_ERPGLCodes2].[GLCode]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_FinYear] AS [COST_FinYear3]'
  SET @LGSQL = @LGSQL + '    ON [COST_CostSheetData].[FinYear] = [COST_FinYear3].[FinYear]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups4]'
  SET @LGSQL = @LGSQL + '    ON [COST_CostSheetData].[ProjectGroupID] = [COST_ProjectGroups4].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_Quarters] AS [COST_Quarters5]'
  SET @LGSQL = @LGSQL + '    ON [COST_CostSheetData].[Quarter] = [COST_Quarters5].[Quarter]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects6]'
  SET @LGSQL = @LGSQL + '    ON [COST_CostSheetData].[ProjectID] = [IDM_Projects6].[ProjectID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_Quarter > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_CostSheetData].[Quarter] = ' + STR(@Filter_Quarter)
  IF (@Filter_FinYear > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_CostSheetData].[FinYear] = ' + STR(@Filter_FinYear)
  IF (@Filter_ProjectGroupID > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_CostSheetData].[ProjectGroupID] = ' + STR(@Filter_ProjectGroupID)
  IF (@Filter_Revision > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_CostSheetData].[Revision] = ' + STR(@Filter_Revision)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectGroupID' THEN '[COST_CostSheetData].[ProjectGroupID]'
                        WHEN 'ProjectGroupID DESC' THEN '[COST_CostSheetData].[ProjectGroupID] DESC'
                        WHEN 'FinYear' THEN '[COST_CostSheetData].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[COST_CostSheetData].[FinYear] DESC'
                        WHEN 'Quarter' THEN '[COST_CostSheetData].[Quarter]'
                        WHEN 'Quarter DESC' THEN '[COST_CostSheetData].[Quarter] DESC'
                        WHEN 'Revision' THEN '[COST_CostSheetData].[Revision]'
                        WHEN 'Revision DESC' THEN '[COST_CostSheetData].[Revision] DESC'
                        WHEN 'ProjectID' THEN '[COST_CostSheetData].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[COST_CostSheetData].[ProjectID] DESC'
                        WHEN 'GLCode' THEN '[COST_CostSheetData].[GLCode]'
                        WHEN 'GLCode DESC' THEN '[COST_CostSheetData].[GLCode] DESC'
                        WHEN 'AdjustmentSerialNo' THEN '[COST_CostSheetData].[AdjustmentSerialNo]'
                        WHEN 'AdjustmentSerialNo DESC' THEN '[COST_CostSheetData].[AdjustmentSerialNo] DESC'
                        WHEN 'AdjustmentCredit' THEN '[COST_CostSheetData].[AdjustmentCredit]'
                        WHEN 'AdjustmentCredit DESC' THEN '[COST_CostSheetData].[AdjustmentCredit] DESC'
                        WHEN 'CrAmount' THEN '[COST_CostSheetData].[CrAmount]'
                        WHEN 'CrAmount DESC' THEN '[COST_CostSheetData].[CrAmount] DESC'
                        WHEN 'DrAmount' THEN '[COST_CostSheetData].[DrAmount]'
                        WHEN 'DrAmount DESC' THEN '[COST_CostSheetData].[DrAmount] DESC'
                        WHEN 'Amount' THEN '[COST_CostSheetData].[Amount]'
                        WHEN 'Amount DESC' THEN '[COST_CostSheetData].[Amount] DESC'
                        WHEN 'AdjustmentEntry' THEN '[COST_CostSheetData].[AdjustmentEntry]'
                        WHEN 'AdjustmentEntry DESC' THEN '[COST_CostSheetData].[AdjustmentEntry] DESC'
                        WHEN 'COST_CostSheet1_Remarks' THEN '[COST_CostSheet1].[Remarks]'
                        WHEN 'COST_CostSheet1_Remarks DESC' THEN '[COST_CostSheet1].[Remarks] DESC'
                        WHEN 'COST_ERPGLCodes2_GLDescription' THEN '[COST_ERPGLCodes2].[GLDescription]'
                        WHEN 'COST_ERPGLCodes2_GLDescription DESC' THEN '[COST_ERPGLCodes2].[GLDescription] DESC'
                        WHEN 'COST_FinYear3_Descpription' THEN '[COST_FinYear3].[Descpription]'
                        WHEN 'COST_FinYear3_Descpription DESC' THEN '[COST_FinYear3].[Descpription] DESC'
                        WHEN 'COST_ProjectGroups4_ProjectGroupDescription' THEN '[COST_ProjectGroups4].[ProjectGroupDescription]'
                        WHEN 'COST_ProjectGroups4_ProjectGroupDescription DESC' THEN '[COST_ProjectGroups4].[ProjectGroupDescription] DESC'
                        WHEN 'COST_Quarters5_Description' THEN '[COST_Quarters5].[Description]'
                        WHEN 'COST_Quarters5_Description DESC' THEN '[COST_Quarters5].[Description] DESC'
                        WHEN 'IDM_Projects6_Description' THEN '[IDM_Projects6].[Description]'
                        WHEN 'IDM_Projects6_Description DESC' THEN '[IDM_Projects6].[Description] DESC'
                        ELSE '[COST_CostSheetData].[ProjectGroupID],[COST_CostSheetData].[FinYear],[COST_CostSheetData].[Quarter],[COST_CostSheetData].[Revision],[COST_CostSheetData].[AdjustmentSerialNo],[COST_CostSheetData].[AdjustmentCredit],[COST_CostSheetData].[ProjectID],[COST_CostSheetData].[GLCode]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [COST_CostSheetData].* ,
    [COST_CostSheet1].[Remarks] AS COST_CostSheet1_Remarks,
    [COST_ERPGLCodes2].[GLDescription] AS COST_ERPGLCodes2_GLDescription,
    [COST_FinYear3].[Descpription] AS COST_FinYear3_Descpription,
    [COST_ProjectGroups4].[ProjectGroupDescription] AS COST_ProjectGroups4_ProjectGroupDescription,
    [COST_Quarters5].[Description] AS COST_Quarters5_Description,
    [IDM_Projects6].[Description] AS IDM_Projects6_Description 
  FROM [COST_CostSheetData] 
      INNER JOIN #PageIndex
          ON [COST_CostSheetData].[ProjectGroupID] = #PageIndex.ProjectGroupID
          AND [COST_CostSheetData].[FinYear] = #PageIndex.FinYear
          AND [COST_CostSheetData].[Quarter] = #PageIndex.Quarter
          AND [COST_CostSheetData].[Revision] = #PageIndex.Revision
          AND [COST_CostSheetData].[ProjectID] = #PageIndex.ProjectID
          AND [COST_CostSheetData].[GLCode] = #PageIndex.GLCode
          AND [COST_CostSheetData].[AdjustmentSerialNo] = #PageIndex.AdjustmentSerialNo
          AND [COST_CostSheetData].[AdjustmentCredit] = #PageIndex.AdjustmentCredit
  INNER JOIN [COST_CostSheet] AS [COST_CostSheet1]
    ON [COST_CostSheetData].[ProjectGroupID] = [COST_CostSheet1].[ProjectGroupID]
    AND [COST_CostSheetData].[FinYear] = [COST_CostSheet1].[FinYear]
    AND [COST_CostSheetData].[Quarter] = [COST_CostSheet1].[Quarter]
    AND [COST_CostSheetData].[Revision] = [COST_CostSheet1].[Revision]
  INNER JOIN [COST_ERPGLCodes] AS [COST_ERPGLCodes2]
    ON [COST_CostSheetData].[GLCode] = [COST_ERPGLCodes2].[GLCode]
  INNER JOIN [COST_FinYear] AS [COST_FinYear3]
    ON [COST_CostSheetData].[FinYear] = [COST_FinYear3].[FinYear]
  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups4]
    ON [COST_CostSheetData].[ProjectGroupID] = [COST_ProjectGroups4].[ProjectGroupID]
  INNER JOIN [COST_Quarters] AS [COST_Quarters5]
    ON [COST_CostSheetData].[Quarter] = [COST_Quarters5].[Quarter]
  INNER JOIN [IDM_Projects] AS [IDM_Projects6]
    ON [COST_CostSheetData].[ProjectID] = [IDM_Projects6].[ProjectID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
