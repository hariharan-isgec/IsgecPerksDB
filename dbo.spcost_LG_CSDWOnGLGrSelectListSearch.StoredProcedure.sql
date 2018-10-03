USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spcost_LG_CSDWOnGLGrSelectListSearch]
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
 ,ProjectGroupID Int NOT NULL
 ,FinYear Int NOT NULL
 ,Quarter Int NOT NULL
 ,Revision Int NOT NULL
 ,WorkOrderTypeID Int NOT NULL
 ,GLGroupID Int NOT NULL
  )
  INSERT INTO #PageIndex (ProjectGroupID, FinYear, Quarter, Revision, WorkOrderTypeID, GLGroupID)
  SELECT [COST_CSDataWOnGLGroup].[ProjectGroupID], [COST_CSDataWOnGLGroup].[FinYear], [COST_CSDataWOnGLGroup].[Quarter], [COST_CSDataWOnGLGroup].[Revision], [COST_CSDataWOnGLGroup].[WorkOrderTypeID], [COST_CSDataWOnGLGroup].[GLGroupID] FROM [COST_CSDataWOnGLGroup]
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
 WHERE  [COST_CSDataWOnGLGroup].[WorkOrderTypeID] IN (2,3) AND  
   ( 
         STR(ISNULL([COST_CSDataWOnGLGroup].[ProjectGroupID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_CSDataWOnGLGroup].[FinYear], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_CSDataWOnGLGroup].[Quarter], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_CSDataWOnGLGroup].[Revision], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_CSDataWOnGLGroup].[WorkOrderTypeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_CSDataWOnGLGroup].[GLGroupID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_CSDataWOnGLGroup].[CrAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_CSDataWOnGLGroup].[DrAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_CSDataWOnGLGroup].[Amount], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectGroupID' THEN [COST_CSDataWOnGLGroup].[ProjectGroupID] END,
     CASE @OrderBy WHEN 'ProjectGroupID DESC' THEN [COST_CSDataWOnGLGroup].[ProjectGroupID] END DESC,
     CASE @OrderBy WHEN 'FinYear' THEN [COST_CSDataWOnGLGroup].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [COST_CSDataWOnGLGroup].[FinYear] END DESC,
     CASE @OrderBy WHEN 'Quarter' THEN [COST_CSDataWOnGLGroup].[Quarter] END,
     CASE @OrderBy WHEN 'Quarter DESC' THEN [COST_CSDataWOnGLGroup].[Quarter] END DESC,
     CASE @OrderBy WHEN 'Revision' THEN [COST_CSDataWOnGLGroup].[Revision] END,
     CASE @OrderBy WHEN 'Revision DESC' THEN [COST_CSDataWOnGLGroup].[Revision] END DESC,
     CASE @OrderBy WHEN 'WorkOrderTypeID' THEN [COST_CSDataWOnGLGroup].[WorkOrderTypeID] END,
     CASE @OrderBy WHEN 'WorkOrderTypeID DESC' THEN [COST_CSDataWOnGLGroup].[WorkOrderTypeID] END DESC,
     CASE @OrderBy WHEN 'GLGroupID' THEN [COST_CSDataWOnGLGroup].[GLGroupID] END,
     CASE @OrderBy WHEN 'GLGroupID DESC' THEN [COST_CSDataWOnGLGroup].[GLGroupID] END DESC,
     CASE @OrderBy WHEN 'CrAmount' THEN [COST_CSDataWOnGLGroup].[CrAmount] END,
     CASE @OrderBy WHEN 'CrAmount DESC' THEN [COST_CSDataWOnGLGroup].[CrAmount] END DESC,
     CASE @OrderBy WHEN 'DrAmount' THEN [COST_CSDataWOnGLGroup].[DrAmount] END,
     CASE @OrderBy WHEN 'DrAmount DESC' THEN [COST_CSDataWOnGLGroup].[DrAmount] END DESC,
     CASE @OrderBy WHEN 'Amount' THEN [COST_CSDataWOnGLGroup].[Amount] END,
     CASE @OrderBy WHEN 'Amount DESC' THEN [COST_CSDataWOnGLGroup].[Amount] END DESC,
     CASE @OrderBy WHEN 'COST_CostSheet1_Remarks' THEN [COST_CostSheet1].[Remarks] END,
     CASE @OrderBy WHEN 'COST_CostSheet1_Remarks DESC' THEN [COST_CostSheet1].[Remarks] END DESC,
     CASE @OrderBy WHEN 'COST_FinYear2_Descpription' THEN [COST_FinYear2].[Descpription] END,
     CASE @OrderBy WHEN 'COST_FinYear2_Descpription DESC' THEN [COST_FinYear2].[Descpription] END DESC,
     CASE @OrderBy WHEN 'COST_GLGroups3_GLGroupDescriptions' THEN [COST_GLGroups3].[GLGroupDescriptions] END,
     CASE @OrderBy WHEN 'COST_GLGroups3_GLGroupDescriptions DESC' THEN [COST_GLGroups3].[GLGroupDescriptions] END DESC,
     CASE @OrderBy WHEN 'COST_ProjectGroups4_ProjectGroupDescription' THEN [COST_ProjectGroups4].[ProjectGroupDescription] END,
     CASE @OrderBy WHEN 'COST_ProjectGroups4_ProjectGroupDescription DESC' THEN [COST_ProjectGroups4].[ProjectGroupDescription] END DESC,
     CASE @OrderBy WHEN 'COST_Quarters5_Description' THEN [COST_Quarters5].[Description] END,
     CASE @OrderBy WHEN 'COST_Quarters5_Description DESC' THEN [COST_Quarters5].[Description] END DESC,
     CASE @OrderBy WHEN 'COST_WorkOrderTypes6_WorkOrderTypeDescription' THEN [COST_WorkOrderTypes6].[WorkOrderTypeDescription] END,
     CASE @OrderBy WHEN 'COST_WorkOrderTypes6_WorkOrderTypeDescription DESC' THEN [COST_WorkOrderTypes6].[WorkOrderTypeDescription] END DESC 

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
