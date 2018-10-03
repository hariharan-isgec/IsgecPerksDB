USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostAdjustmentEntrySelectListFilteres]
  @Filter_FinYear Int,
  @Filter_ProjectGroupID Int,
  @Filter_Revision Int,
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
 ,Revision Int NOT NULL
 ,AdjustmentSerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectGroupID'
  SET @LGSQL = @LGSQL + ', FinYear'
  SET @LGSQL = @LGSQL + ', Quarter'
  SET @LGSQL = @LGSQL + ', Revision'
  SET @LGSQL = @LGSQL + ', AdjustmentSerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[COST_AdjustmentEntry].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + ', [COST_AdjustmentEntry].[FinYear]'
  SET @LGSQL = @LGSQL + ', [COST_AdjustmentEntry].[Quarter]'
  SET @LGSQL = @LGSQL + ', [COST_AdjustmentEntry].[Revision]'
  SET @LGSQL = @LGSQL + ', [COST_AdjustmentEntry].[AdjustmentSerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [COST_AdjustmentEntry] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [COST_AdjustmentEntry].[CreatedBy] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_CostSheet] AS [COST_CostSheet2]'
  SET @LGSQL = @LGSQL + '    ON [COST_AdjustmentEntry].[ProjectGroupID] = [COST_CostSheet2].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + '    AND [COST_AdjustmentEntry].[FinYear] = [COST_CostSheet2].[FinYear]'
  SET @LGSQL = @LGSQL + '    AND [COST_AdjustmentEntry].[Quarter] = [COST_CostSheet2].[Quarter]'
  SET @LGSQL = @LGSQL + '    AND [COST_AdjustmentEntry].[Revision] = [COST_CostSheet2].[Revision]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [COST_ERPGLCodes] AS [COST_ERPGLCodes3]'
  SET @LGSQL = @LGSQL + '    ON [COST_AdjustmentEntry].[CrGLCode] = [COST_ERPGLCodes3].[GLCode]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [COST_ERPGLCodes] AS [COST_ERPGLCodes4]'
  SET @LGSQL = @LGSQL + '    ON [COST_AdjustmentEntry].[DrGLCode] = [COST_ERPGLCodes4].[GLCode]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_FinYear] AS [COST_FinYear5]'
  SET @LGSQL = @LGSQL + '    ON [COST_AdjustmentEntry].[FinYear] = [COST_FinYear5].[FinYear]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups6]'
  SET @LGSQL = @LGSQL + '    ON [COST_AdjustmentEntry].[ProjectGroupID] = [COST_ProjectGroups6].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_Quarters] AS [COST_Quarters7]'
  SET @LGSQL = @LGSQL + '    ON [COST_AdjustmentEntry].[Quarter] = [COST_Quarters7].[Quarter]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects8]'
  SET @LGSQL = @LGSQL + '    ON [COST_AdjustmentEntry].[ProjectID] = [IDM_Projects8].[ProjectID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_FinYear > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_AdjustmentEntry].[FinYear] = ' + STR(@Filter_FinYear)
  IF (@Filter_ProjectGroupID > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_AdjustmentEntry].[ProjectGroupID] = ' + STR(@Filter_ProjectGroupID)
  IF (@Filter_Revision > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_AdjustmentEntry].[Revision] = ' + STR(@Filter_Revision)
  IF (@Filter_Quarter > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_AdjustmentEntry].[Quarter] = ' + STR(@Filter_Quarter)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectGroupID' THEN '[COST_AdjustmentEntry].[ProjectGroupID]'
                        WHEN 'ProjectGroupID DESC' THEN '[COST_AdjustmentEntry].[ProjectGroupID] DESC'
                        WHEN 'FinYear' THEN '[COST_AdjustmentEntry].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[COST_AdjustmentEntry].[FinYear] DESC'
                        WHEN 'Quarter' THEN '[COST_AdjustmentEntry].[Quarter]'
                        WHEN 'Quarter DESC' THEN '[COST_AdjustmentEntry].[Quarter] DESC'
                        WHEN 'Revision' THEN '[COST_AdjustmentEntry].[Revision]'
                        WHEN 'Revision DESC' THEN '[COST_AdjustmentEntry].[Revision] DESC'
                        WHEN 'AdjustmentSerialNo' THEN '[COST_AdjustmentEntry].[AdjustmentSerialNo]'
                        WHEN 'AdjustmentSerialNo DESC' THEN '[COST_AdjustmentEntry].[AdjustmentSerialNo] DESC'
                        WHEN 'ProjectID' THEN '[COST_AdjustmentEntry].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[COST_AdjustmentEntry].[ProjectID] DESC'
                        WHEN 'CrGLCode' THEN '[COST_AdjustmentEntry].[CrGLCode]'
                        WHEN 'CrGLCode DESC' THEN '[COST_AdjustmentEntry].[CrGLCode] DESC'
                        WHEN 'DrGLCode' THEN '[COST_AdjustmentEntry].[DrGLCode]'
                        WHEN 'DrGLCode DESC' THEN '[COST_AdjustmentEntry].[DrGLCode] DESC'
                        WHEN 'Amount' THEN '[COST_AdjustmentEntry].[Amount]'
                        WHEN 'Amount DESC' THEN '[COST_AdjustmentEntry].[Amount] DESC'
                        WHEN 'Active' THEN '[COST_AdjustmentEntry].[Active]'
                        WHEN 'Active DESC' THEN '[COST_AdjustmentEntry].[Active] DESC'
                        WHEN 'Remarks' THEN '[COST_AdjustmentEntry].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[COST_AdjustmentEntry].[Remarks] DESC'
                        WHEN 'CreatedOn' THEN '[COST_AdjustmentEntry].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[COST_AdjustmentEntry].[CreatedOn] DESC'
                        WHEN 'CreatedBy' THEN '[COST_AdjustmentEntry].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[COST_AdjustmentEntry].[CreatedBy] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'COST_CostSheet2_Remarks' THEN '[COST_CostSheet2].[Remarks]'
                        WHEN 'COST_CostSheet2_Remarks DESC' THEN '[COST_CostSheet2].[Remarks] DESC'
                        WHEN 'COST_ERPGLCodes3_GLDescription' THEN '[COST_ERPGLCodes3].[GLDescription]'
                        WHEN 'COST_ERPGLCodes3_GLDescription DESC' THEN '[COST_ERPGLCodes3].[GLDescription] DESC'
                        WHEN 'COST_ERPGLCodes4_GLDescription' THEN '[COST_ERPGLCodes4].[GLDescription]'
                        WHEN 'COST_ERPGLCodes4_GLDescription DESC' THEN '[COST_ERPGLCodes4].[GLDescription] DESC'
                        WHEN 'COST_FinYear5_Descpription' THEN '[COST_FinYear5].[Descpription]'
                        WHEN 'COST_FinYear5_Descpription DESC' THEN '[COST_FinYear5].[Descpription] DESC'
                        WHEN 'COST_ProjectGroups6_ProjectGroupDescription' THEN '[COST_ProjectGroups6].[ProjectGroupDescription]'
                        WHEN 'COST_ProjectGroups6_ProjectGroupDescription DESC' THEN '[COST_ProjectGroups6].[ProjectGroupDescription] DESC'
                        WHEN 'COST_Quarters7_Description' THEN '[COST_Quarters7].[Description]'
                        WHEN 'COST_Quarters7_Description DESC' THEN '[COST_Quarters7].[Description] DESC'
                        WHEN 'IDM_Projects8_Description' THEN '[IDM_Projects8].[Description]'
                        WHEN 'IDM_Projects8_Description DESC' THEN '[IDM_Projects8].[Description] DESC'
                        ELSE '[COST_AdjustmentEntry].[ProjectGroupID],[COST_AdjustmentEntry].[FinYear],[COST_AdjustmentEntry].[Quarter],[COST_AdjustmentEntry].[Revision],[COST_AdjustmentEntry].[AdjustmentSerialNo]'
                    END
  EXEC (@LGSQL)

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
