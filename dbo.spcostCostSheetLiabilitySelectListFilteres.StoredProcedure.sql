USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCostSheetLiabilitySelectListFilteres]
  @Filter_ProjectGroupID Int,
  @Filter_FinYear Int,
  @Filter_Quarter Int,
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
  SET @LGSQL = @LGSQL + '[COST_CostSheetLiability].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + ', [COST_CostSheetLiability].[FinYear]'
  SET @LGSQL = @LGSQL + ', [COST_CostSheetLiability].[Quarter]'
  SET @LGSQL = @LGSQL + ', [COST_CostSheetLiability].[Revision]'
  SET @LGSQL = @LGSQL + ', [COST_CostSheetLiability].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [COST_CostSheetLiability].[GLCode]'
  SET @LGSQL = @LGSQL + ', [COST_CostSheetLiability].[AdjustmentSerialNo]'
  SET @LGSQL = @LGSQL + ', [COST_CostSheetLiability].[AdjustmentCredit]'
  SET @LGSQL = @LGSQL + ' FROM [COST_CostSheetLiability] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_CostSheet] AS [COST_CostSheet1]'
  SET @LGSQL = @LGSQL + '    ON [COST_CostSheetLiability].[ProjectGroupID] = [COST_CostSheet1].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + '    AND [COST_CostSheetLiability].[FinYear] = [COST_CostSheet1].[FinYear]'
  SET @LGSQL = @LGSQL + '    AND [COST_CostSheetLiability].[Quarter] = [COST_CostSheet1].[Quarter]'
  SET @LGSQL = @LGSQL + '    AND [COST_CostSheetLiability].[Revision] = [COST_CostSheet1].[Revision]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_ERPGLCodes] AS [COST_ERPGLCodes2]'
  SET @LGSQL = @LGSQL + '    ON [COST_CostSheetLiability].[GLCode] = [COST_ERPGLCodes2].[GLCode]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_FinYear] AS [COST_FinYear3]'
  SET @LGSQL = @LGSQL + '    ON [COST_CostSheetLiability].[FinYear] = [COST_FinYear3].[FinYear]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups4]'
  SET @LGSQL = @LGSQL + '    ON [COST_CostSheetLiability].[ProjectGroupID] = [COST_ProjectGroups4].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_Quarters] AS [COST_Quarters5]'
  SET @LGSQL = @LGSQL + '    ON [COST_CostSheetLiability].[Quarter] = [COST_Quarters5].[Quarter]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects6]'
  SET @LGSQL = @LGSQL + '    ON [COST_CostSheetLiability].[ProjectID] = [IDM_Projects6].[ProjectID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectGroupID > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_CostSheetLiability].[ProjectGroupID] = ' + STR(@Filter_ProjectGroupID)
  IF (@Filter_FinYear > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_CostSheetLiability].[FinYear] = ' + STR(@Filter_FinYear)
  IF (@Filter_Quarter > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_CostSheetLiability].[Quarter] = ' + STR(@Filter_Quarter)
  IF (@Filter_Revision > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_CostSheetLiability].[Revision] = ' + STR(@Filter_Revision)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectGroupID' THEN '[COST_CostSheetLiability].[ProjectGroupID]'
                        WHEN 'ProjectGroupID DESC' THEN '[COST_CostSheetLiability].[ProjectGroupID] DESC'
                        WHEN 'FinYear' THEN '[COST_CostSheetLiability].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[COST_CostSheetLiability].[FinYear] DESC'
                        WHEN 'Quarter' THEN '[COST_CostSheetLiability].[Quarter]'
                        WHEN 'Quarter DESC' THEN '[COST_CostSheetLiability].[Quarter] DESC'
                        WHEN 'Revision' THEN '[COST_CostSheetLiability].[Revision]'
                        WHEN 'Revision DESC' THEN '[COST_CostSheetLiability].[Revision] DESC'
                        WHEN 'ProjectID' THEN '[COST_CostSheetLiability].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[COST_CostSheetLiability].[ProjectID] DESC'
                        WHEN 'GLCode' THEN '[COST_CostSheetLiability].[GLCode]'
                        WHEN 'GLCode DESC' THEN '[COST_CostSheetLiability].[GLCode] DESC'
                        WHEN 'AdjustmentSerialNo' THEN '[COST_CostSheetLiability].[AdjustmentSerialNo]'
                        WHEN 'AdjustmentSerialNo DESC' THEN '[COST_CostSheetLiability].[AdjustmentSerialNo] DESC'
                        WHEN 'AdjustmentCredit' THEN '[COST_CostSheetLiability].[AdjustmentCredit]'
                        WHEN 'AdjustmentCredit DESC' THEN '[COST_CostSheetLiability].[AdjustmentCredit] DESC'
                        WHEN 'CrAmount' THEN '[COST_CostSheetLiability].[CrAmount]'
                        WHEN 'CrAmount DESC' THEN '[COST_CostSheetLiability].[CrAmount] DESC'
                        WHEN 'DrAmount' THEN '[COST_CostSheetLiability].[DrAmount]'
                        WHEN 'DrAmount DESC' THEN '[COST_CostSheetLiability].[DrAmount] DESC'
                        WHEN 'Amount' THEN '[COST_CostSheetLiability].[Amount]'
                        WHEN 'Amount DESC' THEN '[COST_CostSheetLiability].[Amount] DESC'
                        WHEN 'AdjustmentEntry' THEN '[COST_CostSheetLiability].[AdjustmentEntry]'
                        WHEN 'AdjustmentEntry DESC' THEN '[COST_CostSheetLiability].[AdjustmentEntry] DESC'
                        WHEN 'CrFC' THEN '[COST_CostSheetLiability].[CrFC]'
                        WHEN 'CrFC DESC' THEN '[COST_CostSheetLiability].[CrFC] DESC'
                        WHEN 'DrFC' THEN '[COST_CostSheetLiability].[DrFC]'
                        WHEN 'DrFC DESC' THEN '[COST_CostSheetLiability].[DrFC] DESC'
                        WHEN 'NetFC' THEN '[COST_CostSheetLiability].[NetFC]'
                        WHEN 'NetFC DESC' THEN '[COST_CostSheetLiability].[NetFC] DESC'
                        WHEN 'FC' THEN '[COST_CostSheetLiability].[FC]'
                        WHEN 'FC DESC' THEN '[COST_CostSheetLiability].[FC] DESC'
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
                        ELSE '[COST_CostSheetLiability].[ProjectGroupID],[COST_CostSheetLiability].[FinYear],[COST_CostSheetLiability].[Quarter],[COST_CostSheetLiability].[Revision],[COST_CostSheetLiability].[ProjectID],[COST_CostSheetLiability].[GLCode],[COST_CostSheetLiability].[AdjustmentSerialNo],[COST_CostSheetLiability].[AdjustmentCredit]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [COST_CostSheetLiability].* ,
    [COST_CostSheet1].[Remarks] AS COST_CostSheet1_Remarks,
    [COST_ERPGLCodes2].[GLDescription] AS COST_ERPGLCodes2_GLDescription,
    [COST_FinYear3].[Descpription] AS COST_FinYear3_Descpription,
    [COST_ProjectGroups4].[ProjectGroupDescription] AS COST_ProjectGroups4_ProjectGroupDescription,
    [COST_Quarters5].[Description] AS COST_Quarters5_Description,
    [IDM_Projects6].[Description] AS IDM_Projects6_Description 
  FROM [COST_CostSheetLiability] 
      INNER JOIN #PageIndex
          ON [COST_CostSheetLiability].[ProjectGroupID] = #PageIndex.ProjectGroupID
          AND [COST_CostSheetLiability].[FinYear] = #PageIndex.FinYear
          AND [COST_CostSheetLiability].[Quarter] = #PageIndex.Quarter
          AND [COST_CostSheetLiability].[Revision] = #PageIndex.Revision
          AND [COST_CostSheetLiability].[ProjectID] = #PageIndex.ProjectID
          AND [COST_CostSheetLiability].[GLCode] = #PageIndex.GLCode
          AND [COST_CostSheetLiability].[AdjustmentSerialNo] = #PageIndex.AdjustmentSerialNo
          AND [COST_CostSheetLiability].[AdjustmentCredit] = #PageIndex.AdjustmentCredit
  INNER JOIN [COST_CostSheet] AS [COST_CostSheet1]
    ON [COST_CostSheetLiability].[ProjectGroupID] = [COST_CostSheet1].[ProjectGroupID]
    AND [COST_CostSheetLiability].[FinYear] = [COST_CostSheet1].[FinYear]
    AND [COST_CostSheetLiability].[Quarter] = [COST_CostSheet1].[Quarter]
    AND [COST_CostSheetLiability].[Revision] = [COST_CostSheet1].[Revision]
  INNER JOIN [COST_ERPGLCodes] AS [COST_ERPGLCodes2]
    ON [COST_CostSheetLiability].[GLCode] = [COST_ERPGLCodes2].[GLCode]
  INNER JOIN [COST_FinYear] AS [COST_FinYear3]
    ON [COST_CostSheetLiability].[FinYear] = [COST_FinYear3].[FinYear]
  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups4]
    ON [COST_CostSheetLiability].[ProjectGroupID] = [COST_ProjectGroups4].[ProjectGroupID]
  INNER JOIN [COST_Quarters] AS [COST_Quarters5]
    ON [COST_CostSheetLiability].[Quarter] = [COST_Quarters5].[Quarter]
  INNER JOIN [IDM_Projects] AS [IDM_Projects6]
    ON [COST_CostSheetLiability].[ProjectID] = [IDM_Projects6].[ProjectID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
