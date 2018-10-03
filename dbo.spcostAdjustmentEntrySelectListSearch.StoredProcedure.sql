USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostAdjustmentEntrySelectListSearch]
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
 ,AdjustmentSerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (ProjectGroupID, FinYear, Quarter, Revision, AdjustmentSerialNo)
  SELECT [COST_AdjustmentEntry].[ProjectGroupID], [COST_AdjustmentEntry].[FinYear], [COST_AdjustmentEntry].[Quarter], [COST_AdjustmentEntry].[Revision], [COST_AdjustmentEntry].[AdjustmentSerialNo] FROM [COST_AdjustmentEntry]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [COST_AdjustmentEntry].[CreatedBy] = [aspnet_users1].[LoginID]
  INNER JOIN [COST_CostSheet] AS [COST_CostSheet2]
    ON [COST_AdjustmentEntry].[ProjectGroupID] = [COST_CostSheet2].[ProjectGroupID]
    AND [COST_AdjustmentEntry].[FinYear] = [COST_CostSheet2].[FinYear]
    AND [COST_AdjustmentEntry].[Quarter] = [COST_CostSheet2].[Quarter]
    AND [COST_AdjustmentEntry].[Revision] = [COST_CostSheet2].[Revision]
  LEFT OUTER JOIN [COST_ERPGLCodes] AS [COST_ERPGLCodes3]
    ON [COST_AdjustmentEntry].[CrGLCode] = [COST_ERPGLCodes3].[GLCode]
  LEFT OUTER JOIN [COST_ERPGLCodes] AS [COST_ERPGLCodes4]
    ON [COST_AdjustmentEntry].[DrGLCode] = [COST_ERPGLCodes4].[GLCode]
  INNER JOIN [COST_FinYear] AS [COST_FinYear5]
    ON [COST_AdjustmentEntry].[FinYear] = [COST_FinYear5].[FinYear]
  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups6]
    ON [COST_AdjustmentEntry].[ProjectGroupID] = [COST_ProjectGroups6].[ProjectGroupID]
  INNER JOIN [COST_Quarters] AS [COST_Quarters7]
    ON [COST_AdjustmentEntry].[Quarter] = [COST_Quarters7].[Quarter]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects8]
    ON [COST_AdjustmentEntry].[ProjectID] = [IDM_Projects8].[ProjectID]
 WHERE  
   ( 
         STR(ISNULL([COST_AdjustmentEntry].[AdjustmentSerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_AdjustmentEntry].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_AdjustmentEntry].[CrGLCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_AdjustmentEntry].[DrGLCode],'')) LIKE @KeyWord1
     OR STR(ISNULL([COST_AdjustmentEntry].[Amount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_AdjustmentEntry].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([COST_AdjustmentEntry].[FinYear], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_AdjustmentEntry].[ProjectGroupID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_AdjustmentEntry].[Revision], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_AdjustmentEntry].[CreatedBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([COST_AdjustmentEntry].[Quarter], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectGroupID' THEN [COST_AdjustmentEntry].[ProjectGroupID] END,
     CASE @OrderBy WHEN 'ProjectGroupID DESC' THEN [COST_AdjustmentEntry].[ProjectGroupID] END DESC,
     CASE @OrderBy WHEN 'FinYear' THEN [COST_AdjustmentEntry].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [COST_AdjustmentEntry].[FinYear] END DESC,
     CASE @OrderBy WHEN 'Quarter' THEN [COST_AdjustmentEntry].[Quarter] END,
     CASE @OrderBy WHEN 'Quarter DESC' THEN [COST_AdjustmentEntry].[Quarter] END DESC,
     CASE @OrderBy WHEN 'Revision' THEN [COST_AdjustmentEntry].[Revision] END,
     CASE @OrderBy WHEN 'Revision DESC' THEN [COST_AdjustmentEntry].[Revision] END DESC,
     CASE @OrderBy WHEN 'AdjustmentSerialNo' THEN [COST_AdjustmentEntry].[AdjustmentSerialNo] END,
     CASE @OrderBy WHEN 'AdjustmentSerialNo DESC' THEN [COST_AdjustmentEntry].[AdjustmentSerialNo] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [COST_AdjustmentEntry].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [COST_AdjustmentEntry].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'CrGLCode' THEN [COST_AdjustmentEntry].[CrGLCode] END,
     CASE @OrderBy WHEN 'CrGLCode DESC' THEN [COST_AdjustmentEntry].[CrGLCode] END DESC,
     CASE @OrderBy WHEN 'DrGLCode' THEN [COST_AdjustmentEntry].[DrGLCode] END,
     CASE @OrderBy WHEN 'DrGLCode DESC' THEN [COST_AdjustmentEntry].[DrGLCode] END DESC,
     CASE @OrderBy WHEN 'Amount' THEN [COST_AdjustmentEntry].[Amount] END,
     CASE @OrderBy WHEN 'Amount DESC' THEN [COST_AdjustmentEntry].[Amount] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [COST_AdjustmentEntry].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [COST_AdjustmentEntry].[Active] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [COST_AdjustmentEntry].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [COST_AdjustmentEntry].[Remarks] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [COST_AdjustmentEntry].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [COST_AdjustmentEntry].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [COST_AdjustmentEntry].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [COST_AdjustmentEntry].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'COST_CostSheet2_Remarks' THEN [COST_CostSheet2].[Remarks] END,
     CASE @OrderBy WHEN 'COST_CostSheet2_Remarks DESC' THEN [COST_CostSheet2].[Remarks] END DESC,
     CASE @OrderBy WHEN 'COST_ERPGLCodes3_GLDescription' THEN [COST_ERPGLCodes3].[GLDescription] END,
     CASE @OrderBy WHEN 'COST_ERPGLCodes3_GLDescription DESC' THEN [COST_ERPGLCodes3].[GLDescription] END DESC,
     CASE @OrderBy WHEN 'COST_ERPGLCodes4_GLDescription' THEN [COST_ERPGLCodes4].[GLDescription] END,
     CASE @OrderBy WHEN 'COST_ERPGLCodes4_GLDescription DESC' THEN [COST_ERPGLCodes4].[GLDescription] END DESC,
     CASE @OrderBy WHEN 'COST_FinYear5_Descpription' THEN [COST_FinYear5].[Descpription] END,
     CASE @OrderBy WHEN 'COST_FinYear5_Descpription DESC' THEN [COST_FinYear5].[Descpription] END DESC,
     CASE @OrderBy WHEN 'COST_ProjectGroups6_ProjectGroupDescription' THEN [COST_ProjectGroups6].[ProjectGroupDescription] END,
     CASE @OrderBy WHEN 'COST_ProjectGroups6_ProjectGroupDescription DESC' THEN [COST_ProjectGroups6].[ProjectGroupDescription] END DESC,
     CASE @OrderBy WHEN 'COST_Quarters7_Description' THEN [COST_Quarters7].[Description] END,
     CASE @OrderBy WHEN 'COST_Quarters7_Description DESC' THEN [COST_Quarters7].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects8_Description' THEN [IDM_Projects8].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects8_Description DESC' THEN [IDM_Projects8].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [COST_AdjustmentEntry].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [COST_CostSheet2].[Remarks] AS COST_CostSheet2_Remarks,
    [COST_ERPGLCodes3].[GLDescription] AS COST_ERPGLCodes3_GLDescription,
    [COST_ERPGLCodes4].[GLDescription] AS COST_ERPGLCodes4_GLDescription,
    [COST_FinYear5].[Descpription] AS COST_FinYear5_Descpription,
    [COST_ProjectGroups6].[ProjectGroupDescription] AS COST_ProjectGroups6_ProjectGroupDescription,
    [COST_Quarters7].[Description] AS COST_Quarters7_Description,
    [IDM_Projects8].[Description] AS IDM_Projects8_Description 
  FROM [COST_AdjustmentEntry] 
      INNER JOIN #PageIndex
          ON [COST_AdjustmentEntry].[ProjectGroupID] = #PageIndex.ProjectGroupID
          AND [COST_AdjustmentEntry].[FinYear] = #PageIndex.FinYear
          AND [COST_AdjustmentEntry].[Quarter] = #PageIndex.Quarter
          AND [COST_AdjustmentEntry].[Revision] = #PageIndex.Revision
          AND [COST_AdjustmentEntry].[AdjustmentSerialNo] = #PageIndex.AdjustmentSerialNo
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [COST_AdjustmentEntry].[CreatedBy] = [aspnet_users1].[LoginID]
  INNER JOIN [COST_CostSheet] AS [COST_CostSheet2]
    ON [COST_AdjustmentEntry].[ProjectGroupID] = [COST_CostSheet2].[ProjectGroupID]
    AND [COST_AdjustmentEntry].[FinYear] = [COST_CostSheet2].[FinYear]
    AND [COST_AdjustmentEntry].[Quarter] = [COST_CostSheet2].[Quarter]
    AND [COST_AdjustmentEntry].[Revision] = [COST_CostSheet2].[Revision]
  LEFT OUTER JOIN [COST_ERPGLCodes] AS [COST_ERPGLCodes3]
    ON [COST_AdjustmentEntry].[CrGLCode] = [COST_ERPGLCodes3].[GLCode]
  LEFT OUTER JOIN [COST_ERPGLCodes] AS [COST_ERPGLCodes4]
    ON [COST_AdjustmentEntry].[DrGLCode] = [COST_ERPGLCodes4].[GLCode]
  INNER JOIN [COST_FinYear] AS [COST_FinYear5]
    ON [COST_AdjustmentEntry].[FinYear] = [COST_FinYear5].[FinYear]
  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups6]
    ON [COST_AdjustmentEntry].[ProjectGroupID] = [COST_ProjectGroups6].[ProjectGroupID]
  INNER JOIN [COST_Quarters] AS [COST_Quarters7]
    ON [COST_AdjustmentEntry].[Quarter] = [COST_Quarters7].[Quarter]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects8]
    ON [COST_AdjustmentEntry].[ProjectID] = [IDM_Projects8].[ProjectID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
