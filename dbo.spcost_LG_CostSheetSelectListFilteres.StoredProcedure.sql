USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcost_LG_CostSheetSelectListFilteres]
  @Filter_ProjectGroupID Int,
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
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectGroupID'
  SET @LGSQL = @LGSQL + ', FinYear'
  SET @LGSQL = @LGSQL + ', Quarter'
  SET @LGSQL = @LGSQL + ', Revision'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[COST_CostSheet].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + ', [COST_CostSheet].[FinYear]'
  SET @LGSQL = @LGSQL + ', [COST_CostSheet].[Quarter]'
  SET @LGSQL = @LGSQL + ', [COST_CostSheet].[Revision]'
  SET @LGSQL = @LGSQL + ' FROM [COST_CostSheet] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [COST_CostSheet].[CreatedBy] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]'
  SET @LGSQL = @LGSQL + '    ON [COST_CostSheet].[ApprovedBy] = [aspnet_users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [COST_CostSheetStates] AS [COST_CostSheetStates3]'
  SET @LGSQL = @LGSQL + '    ON [COST_CostSheet].[StatusID] = [COST_CostSheetStates3].[StatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_FinYear] AS [COST_FinYear4]'
  SET @LGSQL = @LGSQL + '    ON [COST_CostSheet].[FinYear] = [COST_FinYear4].[FinYear]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups5]'
  SET @LGSQL = @LGSQL + '    ON [COST_CostSheet].[ProjectGroupID] = [COST_ProjectGroups5].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_Quarters] AS [COST_Quarters6]'
  SET @LGSQL = @LGSQL + '    ON [COST_CostSheet].[Quarter] = [COST_Quarters6].[Quarter]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectGroupID > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_CostSheet].[ProjectGroupID] = ' + STR(@Filter_ProjectGroupID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectGroupID' THEN '[COST_CostSheet].[ProjectGroupID]'
                        WHEN 'ProjectGroupID DESC' THEN '[COST_CostSheet].[ProjectGroupID] DESC'
                        WHEN 'FinYear' THEN '[COST_CostSheet].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[COST_CostSheet].[FinYear] DESC'
                        WHEN 'Quarter' THEN '[COST_CostSheet].[Quarter]'
                        WHEN 'Quarter DESC' THEN '[COST_CostSheet].[Quarter] DESC'
                        WHEN 'Revision' THEN '[COST_CostSheet].[Revision]'
                        WHEN 'Revision DESC' THEN '[COST_CostSheet].[Revision] DESC'
                        WHEN 'StatusID' THEN '[COST_CostSheet].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[COST_CostSheet].[StatusID] DESC'
                        WHEN 'AutoUpdateERPData' THEN '[COST_CostSheet].[AutoUpdateERPData]'
                        WHEN 'AutoUpdateERPData DESC' THEN '[COST_CostSheet].[AutoUpdateERPData] DESC'
                        WHEN 'LockERPData' THEN '[COST_CostSheet].[LockERPData]'
                        WHEN 'LockERPData DESC' THEN '[COST_CostSheet].[LockERPData] DESC'
                        WHEN 'LockAdjustmentEntry' THEN '[COST_CostSheet].[LockAdjustmentEntry]'
                        WHEN 'LockAdjustmentEntry DESC' THEN '[COST_CostSheet].[LockAdjustmentEntry] DESC'
                        WHEN 'Remarks' THEN '[COST_CostSheet].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[COST_CostSheet].[Remarks] DESC'
                        WHEN 'CreatedBy' THEN '[COST_CostSheet].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[COST_CostSheet].[CreatedBy] DESC'
                        WHEN 'CreatedOn' THEN '[COST_CostSheet].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[COST_CostSheet].[CreatedOn] DESC'
                        WHEN 'ApproverRemarks' THEN '[COST_CostSheet].[ApproverRemarks]'
                        WHEN 'ApproverRemarks DESC' THEN '[COST_CostSheet].[ApproverRemarks] DESC'
                        WHEN 'ApprovedBy' THEN '[COST_CostSheet].[ApprovedBy]'
                        WHEN 'ApprovedBy DESC' THEN '[COST_CostSheet].[ApprovedBy] DESC'
                        WHEN 'ApprovedOn' THEN '[COST_CostSheet].[ApprovedOn]'
                        WHEN 'ApprovedOn DESC' THEN '[COST_CostSheet].[ApprovedOn] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'COST_CostSheetStates3_Description' THEN '[COST_CostSheetStates3].[Description]'
                        WHEN 'COST_CostSheetStates3_Description DESC' THEN '[COST_CostSheetStates3].[Description] DESC'
                        WHEN 'COST_FinYear4_Descpription' THEN '[COST_FinYear4].[Descpription]'
                        WHEN 'COST_FinYear4_Descpription DESC' THEN '[COST_FinYear4].[Descpription] DESC'
                        WHEN 'COST_ProjectGroups5_ProjectGroupDescription' THEN '[COST_ProjectGroups5].[ProjectGroupDescription]'
                        WHEN 'COST_ProjectGroups5_ProjectGroupDescription DESC' THEN '[COST_ProjectGroups5].[ProjectGroupDescription] DESC'
                        WHEN 'COST_Quarters6_Description' THEN '[COST_Quarters6].[Description]'
                        WHEN 'COST_Quarters6_Description DESC' THEN '[COST_Quarters6].[Description] DESC'
                        ELSE '[COST_CostSheet].[FinYear],[COST_CostSheet].[Quarter],[COST_CostSheet].[Revision],[COST_CostSheet].[ProjectGroupID] DESC'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [COST_CostSheet].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [COST_CostSheetStates3].[Description] AS COST_CostSheetStates3_Description,
    [COST_FinYear4].[Descpription] AS COST_FinYear4_Descpription,
    [COST_ProjectGroups5].[ProjectGroupDescription] AS COST_ProjectGroups5_ProjectGroupDescription,
    [COST_Quarters6].[Description] AS COST_Quarters6_Description 
  FROM [COST_CostSheet] 
      INNER JOIN #PageIndex
          ON [COST_CostSheet].[ProjectGroupID] = #PageIndex.ProjectGroupID
          AND [COST_CostSheet].[FinYear] = #PageIndex.FinYear
          AND [COST_CostSheet].[Quarter] = #PageIndex.Quarter
          AND [COST_CostSheet].[Revision] = #PageIndex.Revision
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [COST_CostSheet].[CreatedBy] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [COST_CostSheet].[ApprovedBy] = [aspnet_users2].[LoginID]
  LEFT OUTER JOIN [COST_CostSheetStates] AS [COST_CostSheetStates3]
    ON [COST_CostSheet].[StatusID] = [COST_CostSheetStates3].[StatusID]
  INNER JOIN [COST_FinYear] AS [COST_FinYear4]
    ON [COST_CostSheet].[FinYear] = [COST_FinYear4].[FinYear]
  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups5]
    ON [COST_CostSheet].[ProjectGroupID] = [COST_ProjectGroups5].[ProjectGroupID]
  INNER JOIN [COST_Quarters] AS [COST_Quarters6]
    ON [COST_CostSheet].[Quarter] = [COST_Quarters6].[Quarter]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
