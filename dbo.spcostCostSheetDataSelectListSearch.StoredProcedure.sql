USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCostSheetDataSelectListSearch]
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
 ,ProjectID NVarChar(6) NOT NULL
 ,GLCode NVarChar(7) NOT NULL
 ,AdjustmentSerialNo Int NOT NULL
 ,AdjustmentCredit Bit NOT NULL
  )
  INSERT INTO #PageIndex (ProjectGroupID, FinYear, Quarter, Revision, ProjectID, GLCode, AdjustmentSerialNo, AdjustmentCredit)
  SELECT [COST_CostSheetData].[ProjectGroupID], [COST_CostSheetData].[FinYear], [COST_CostSheetData].[Quarter], [COST_CostSheetData].[Revision], [COST_CostSheetData].[ProjectID], [COST_CostSheetData].[GLCode], [COST_CostSheetData].[AdjustmentSerialNo], [COST_CostSheetData].[AdjustmentCredit] FROM [COST_CostSheetData]
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
   ( 
         STR(ISNULL([COST_CostSheetData].[AdjustmentSerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_CostSheetData].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_CostSheetData].[GLCode],'')) LIKE @KeyWord1
     OR STR(ISNULL([COST_CostSheetData].[CrAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_CostSheetData].[DrAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_CostSheetData].[Amount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_CostSheetData].[Quarter], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_CostSheetData].[FinYear], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_CostSheetData].[ProjectGroupID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_CostSheetData].[Revision], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectGroupID' THEN [COST_CostSheetData].[ProjectGroupID] END,
     CASE @OrderBy WHEN 'ProjectGroupID DESC' THEN [COST_CostSheetData].[ProjectGroupID] END DESC,
     CASE @OrderBy WHEN 'FinYear' THEN [COST_CostSheetData].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [COST_CostSheetData].[FinYear] END DESC,
     CASE @OrderBy WHEN 'Quarter' THEN [COST_CostSheetData].[Quarter] END,
     CASE @OrderBy WHEN 'Quarter DESC' THEN [COST_CostSheetData].[Quarter] END DESC,
     CASE @OrderBy WHEN 'Revision' THEN [COST_CostSheetData].[Revision] END,
     CASE @OrderBy WHEN 'Revision DESC' THEN [COST_CostSheetData].[Revision] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [COST_CostSheetData].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [COST_CostSheetData].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'GLCode' THEN [COST_CostSheetData].[GLCode] END,
     CASE @OrderBy WHEN 'GLCode DESC' THEN [COST_CostSheetData].[GLCode] END DESC,
     CASE @OrderBy WHEN 'AdjustmentSerialNo' THEN [COST_CostSheetData].[AdjustmentSerialNo] END,
     CASE @OrderBy WHEN 'AdjustmentSerialNo DESC' THEN [COST_CostSheetData].[AdjustmentSerialNo] END DESC,
     CASE @OrderBy WHEN 'AdjustmentCredit' THEN [COST_CostSheetData].[AdjustmentCredit] END,
     CASE @OrderBy WHEN 'AdjustmentCredit DESC' THEN [COST_CostSheetData].[AdjustmentCredit] END DESC,
     CASE @OrderBy WHEN 'CrAmount' THEN [COST_CostSheetData].[CrAmount] END,
     CASE @OrderBy WHEN 'CrAmount DESC' THEN [COST_CostSheetData].[CrAmount] END DESC,
     CASE @OrderBy WHEN 'DrAmount' THEN [COST_CostSheetData].[DrAmount] END,
     CASE @OrderBy WHEN 'DrAmount DESC' THEN [COST_CostSheetData].[DrAmount] END DESC,
     CASE @OrderBy WHEN 'Amount' THEN [COST_CostSheetData].[Amount] END,
     CASE @OrderBy WHEN 'Amount DESC' THEN [COST_CostSheetData].[Amount] END DESC,
     CASE @OrderBy WHEN 'AdjustmentEntry' THEN [COST_CostSheetData].[AdjustmentEntry] END,
     CASE @OrderBy WHEN 'AdjustmentEntry DESC' THEN [COST_CostSheetData].[AdjustmentEntry] END DESC,
     CASE @OrderBy WHEN 'COST_CostSheet1_Remarks' THEN [COST_CostSheet1].[Remarks] END,
     CASE @OrderBy WHEN 'COST_CostSheet1_Remarks DESC' THEN [COST_CostSheet1].[Remarks] END DESC,
     CASE @OrderBy WHEN 'COST_ERPGLCodes2_GLDescription' THEN [COST_ERPGLCodes2].[GLDescription] END,
     CASE @OrderBy WHEN 'COST_ERPGLCodes2_GLDescription DESC' THEN [COST_ERPGLCodes2].[GLDescription] END DESC,
     CASE @OrderBy WHEN 'COST_FinYear3_Descpription' THEN [COST_FinYear3].[Descpription] END,
     CASE @OrderBy WHEN 'COST_FinYear3_Descpription DESC' THEN [COST_FinYear3].[Descpription] END DESC,
     CASE @OrderBy WHEN 'COST_ProjectGroups4_ProjectGroupDescription' THEN [COST_ProjectGroups4].[ProjectGroupDescription] END,
     CASE @OrderBy WHEN 'COST_ProjectGroups4_ProjectGroupDescription DESC' THEN [COST_ProjectGroups4].[ProjectGroupDescription] END DESC,
     CASE @OrderBy WHEN 'COST_Quarters5_Description' THEN [COST_Quarters5].[Description] END,
     CASE @OrderBy WHEN 'COST_Quarters5_Description DESC' THEN [COST_Quarters5].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects6_Description' THEN [IDM_Projects6].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects6_Description DESC' THEN [IDM_Projects6].[Description] END DESC 

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
