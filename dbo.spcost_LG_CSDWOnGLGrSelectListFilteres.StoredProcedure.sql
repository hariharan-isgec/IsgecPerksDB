USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spcost_LG_CSDWOnGLGrSelectListFilteres]
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
 ,WorkOrderTypeID Int NOT NULL
 ,GLGroupID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectGroupID'
  SET @LGSQL = @LGSQL + ', FinYear'
  SET @LGSQL = @LGSQL + ', Quarter'
  SET @LGSQL = @LGSQL + ', Revision'
  SET @LGSQL = @LGSQL + ', WorkOrderTypeID'
  SET @LGSQL = @LGSQL + ', GLGroupID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[COST_CSDataWOnGLGroup].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + ', [COST_CSDataWOnGLGroup].[FinYear]'
  SET @LGSQL = @LGSQL + ', [COST_CSDataWOnGLGroup].[Quarter]'
  SET @LGSQL = @LGSQL + ', [COST_CSDataWOnGLGroup].[Revision]'
  SET @LGSQL = @LGSQL + ', [COST_CSDataWOnGLGroup].[WorkOrderTypeID]'
  SET @LGSQL = @LGSQL + ', [COST_CSDataWOnGLGroup].[GLGroupID]'
  SET @LGSQL = @LGSQL + ' FROM [COST_CSDataWOnGLGroup] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_CostSheet] AS [COST_CostSheet1]'
  SET @LGSQL = @LGSQL + '    ON [COST_CSDataWOnGLGroup].[ProjectGroupID] = [COST_CostSheet1].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + '    AND [COST_CSDataWOnGLGroup].[FinYear] = [COST_CostSheet1].[FinYear]'
  SET @LGSQL = @LGSQL + '    AND [COST_CSDataWOnGLGroup].[Quarter] = [COST_CostSheet1].[Quarter]'
  SET @LGSQL = @LGSQL + '    AND [COST_CSDataWOnGLGroup].[Revision] = [COST_CostSheet1].[Revision]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_FinYear] AS [COST_FinYear2]'
  SET @LGSQL = @LGSQL + '    ON [COST_CSDataWOnGLGroup].[FinYear] = [COST_FinYear2].[FinYear]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_GLGroups] AS [COST_GLGroups3]'
  SET @LGSQL = @LGSQL + '    ON [COST_CSDataWOnGLGroup].[GLGroupID] = [COST_GLGroups3].[GLGroupID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups4]'
  SET @LGSQL = @LGSQL + '    ON [COST_CSDataWOnGLGroup].[ProjectGroupID] = [COST_ProjectGroups4].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_Quarters] AS [COST_Quarters5]'
  SET @LGSQL = @LGSQL + '    ON [COST_CSDataWOnGLGroup].[Quarter] = [COST_Quarters5].[Quarter]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_WorkOrderTypes] AS [COST_WorkOrderTypes6]'
  SET @LGSQL = @LGSQL + '    ON [COST_CSDataWOnGLGroup].[WorkOrderTypeID] = [COST_WorkOrderTypes6].[WorkOrderTypeID]'
  SET @LGSQL = @LGSQL + '  WHERE [COST_CSDataWOnGLGroup].[WorkOrderTypeID] IN (2,3) '
  IF (@Filter_ProjectGroupID > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_CSDataWOnGLGroup].[ProjectGroupID] = ' + STR(@Filter_ProjectGroupID)
  IF (@Filter_FinYear > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_CSDataWOnGLGroup].[FinYear] = ' + STR(@Filter_FinYear)
  IF (@Filter_Quarter > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_CSDataWOnGLGroup].[Quarter] = ' + STR(@Filter_Quarter)
  IF (@Filter_Revision > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_CSDataWOnGLGroup].[Revision] = ' + STR(@Filter_Revision)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectGroupID' THEN '[COST_CSDataWOnGLGroup].[ProjectGroupID]'
                        WHEN 'ProjectGroupID DESC' THEN '[COST_CSDataWOnGLGroup].[ProjectGroupID] DESC'
                        WHEN 'FinYear' THEN '[COST_CSDataWOnGLGroup].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[COST_CSDataWOnGLGroup].[FinYear] DESC'
                        WHEN 'Quarter' THEN '[COST_CSDataWOnGLGroup].[Quarter]'
                        WHEN 'Quarter DESC' THEN '[COST_CSDataWOnGLGroup].[Quarter] DESC'
                        WHEN 'Revision' THEN '[COST_CSDataWOnGLGroup].[Revision]'
                        WHEN 'Revision DESC' THEN '[COST_CSDataWOnGLGroup].[Revision] DESC'
                        WHEN 'WorkOrderTypeID' THEN '[COST_CSDataWOnGLGroup].[WorkOrderTypeID]'
                        WHEN 'WorkOrderTypeID DESC' THEN '[COST_CSDataWOnGLGroup].[WorkOrderTypeID] DESC'
                        WHEN 'GLGroupID' THEN '[COST_CSDataWOnGLGroup].[GLGroupID]'
                        WHEN 'GLGroupID DESC' THEN '[COST_CSDataWOnGLGroup].[GLGroupID] DESC'
                        WHEN 'CrAmount' THEN '[COST_CSDataWOnGLGroup].[CrAmount]'
                        WHEN 'CrAmount DESC' THEN '[COST_CSDataWOnGLGroup].[CrAmount] DESC'
                        WHEN 'DrAmount' THEN '[COST_CSDataWOnGLGroup].[DrAmount]'
                        WHEN 'DrAmount DESC' THEN '[COST_CSDataWOnGLGroup].[DrAmount] DESC'
                        WHEN 'Amount' THEN '[COST_CSDataWOnGLGroup].[Amount]'
                        WHEN 'Amount DESC' THEN '[COST_CSDataWOnGLGroup].[Amount] DESC'
                        WHEN 'COST_CostSheet1_Remarks' THEN '[COST_CostSheet1].[Remarks]'
                        WHEN 'COST_CostSheet1_Remarks DESC' THEN '[COST_CostSheet1].[Remarks] DESC'
                        WHEN 'COST_FinYear2_Descpription' THEN '[COST_FinYear2].[Descpription]'
                        WHEN 'COST_FinYear2_Descpription DESC' THEN '[COST_FinYear2].[Descpription] DESC'
                        WHEN 'COST_GLGroups3_GLGroupDescriptions' THEN '[COST_GLGroups3].[GLGroupDescriptions]'
                        WHEN 'COST_GLGroups3_GLGroupDescriptions DESC' THEN '[COST_GLGroups3].[GLGroupDescriptions] DESC'
                        WHEN 'COST_ProjectGroups4_ProjectGroupDescription' THEN '[COST_ProjectGroups4].[ProjectGroupDescription]'
                        WHEN 'COST_ProjectGroups4_ProjectGroupDescription DESC' THEN '[COST_ProjectGroups4].[ProjectGroupDescription] DESC'
                        WHEN 'COST_Quarters5_Description' THEN '[COST_Quarters5].[Description]'
                        WHEN 'COST_Quarters5_Description DESC' THEN '[COST_Quarters5].[Description] DESC'
                        WHEN 'COST_WorkOrderTypes6_WorkOrderTypeDescription' THEN '[COST_WorkOrderTypes6].[WorkOrderTypeDescription]'
                        WHEN 'COST_WorkOrderTypes6_WorkOrderTypeDescription DESC' THEN '[COST_WorkOrderTypes6].[WorkOrderTypeDescription] DESC'
                        ELSE '[COST_CSDataWOnGLGroup].[ProjectGroupID],[COST_CSDataWOnGLGroup].[FinYear],[COST_CSDataWOnGLGroup].[Quarter],[COST_CSDataWOnGLGroup].[Revision],[COST_CSDataWOnGLGroup].[WorkOrderTypeID],[COST_CSDataWOnGLGroup].[GLGroupID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [COST_CSDataWOnGLGroup].* ,
    [COST_CostSheet1].[Remarks] AS COST_CostSheet1_Remarks,
    [COST_FinYear2].[Descpription] AS COST_FinYear2_Descpription,
    [COST_GLGroups3].[GLGroupDescriptions] AS COST_GLGroups3_GLGroupDescriptions,
    [COST_ProjectGroups4].[ProjectGroupDescription] AS COST_ProjectGroups4_ProjectGroupDescription,
    [COST_Quarters5].[Description] AS COST_Quarters5_Description,
    [COST_WorkOrderTypes6].[WorkOrderTypeDescription] AS COST_WorkOrderTypes6_WorkOrderTypeDescription 
  FROM [COST_CSDataWOnGLGroup] 
      INNER JOIN #PageIndex
          ON [COST_CSDataWOnGLGroup].[ProjectGroupID] = #PageIndex.ProjectGroupID
          AND [COST_CSDataWOnGLGroup].[FinYear] = #PageIndex.FinYear
          AND [COST_CSDataWOnGLGroup].[Quarter] = #PageIndex.Quarter
          AND [COST_CSDataWOnGLGroup].[Revision] = #PageIndex.Revision
          AND [COST_CSDataWOnGLGroup].[WorkOrderTypeID] = #PageIndex.WorkOrderTypeID
          AND [COST_CSDataWOnGLGroup].[GLGroupID] = #PageIndex.GLGroupID
  INNER JOIN [COST_CostSheet] AS [COST_CostSheet1]
    ON [COST_CSDataWOnGLGroup].[ProjectGroupID] = [COST_CostSheet1].[ProjectGroupID]
    AND [COST_CSDataWOnGLGroup].[FinYear] = [COST_CostSheet1].[FinYear]
    AND [COST_CSDataWOnGLGroup].[Quarter] = [COST_CostSheet1].[Quarter]
    AND [COST_CSDataWOnGLGroup].[Revision] = [COST_CostSheet1].[Revision]
  INNER JOIN [COST_FinYear] AS [COST_FinYear2]
    ON [COST_CSDataWOnGLGroup].[FinYear] = [COST_FinYear2].[FinYear]
  INNER JOIN [COST_GLGroups] AS [COST_GLGroups3]
    ON [COST_CSDataWOnGLGroup].[GLGroupID] = [COST_GLGroups3].[GLGroupID]
  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups4]
    ON [COST_CSDataWOnGLGroup].[ProjectGroupID] = [COST_ProjectGroups4].[ProjectGroupID]
  INNER JOIN [COST_Quarters] AS [COST_Quarters5]
    ON [COST_CSDataWOnGLGroup].[Quarter] = [COST_Quarters5].[Quarter]
  INNER JOIN [COST_WorkOrderTypes] AS [COST_WorkOrderTypes6]
    ON [COST_CSDataWOnGLGroup].[WorkOrderTypeID] = [COST_WorkOrderTypes6].[WorkOrderTypeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
