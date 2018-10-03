USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCostSheetSelectListSearch]
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
  )
  INSERT INTO #PageIndex (ProjectGroupID, FinYear, Quarter, Revision)
  SELECT [COST_CostSheet].[ProjectGroupID], [COST_CostSheet].[FinYear], [COST_CostSheet].[Quarter], [COST_CostSheet].[Revision] FROM [COST_CostSheet]
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
   ( 
         STR(ISNULL([COST_CostSheet].[ProjectGroupID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_CostSheet].[FinYear], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_CostSheet].[Quarter], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_CostSheet].[Revision], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_CostSheet].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_CostSheet].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_CostSheet].[CreatedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_CostSheet].[ApproverRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_CostSheet].[ApprovedBy],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectGroupID' THEN [COST_CostSheet].[ProjectGroupID] END,
     CASE @OrderBy WHEN 'ProjectGroupID DESC' THEN [COST_CostSheet].[ProjectGroupID] END DESC,
     CASE @OrderBy WHEN 'FinYear' THEN [COST_CostSheet].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [COST_CostSheet].[FinYear] END DESC,
     CASE @OrderBy WHEN 'Quarter' THEN [COST_CostSheet].[Quarter] END,
     CASE @OrderBy WHEN 'Quarter DESC' THEN [COST_CostSheet].[Quarter] END DESC,
     CASE @OrderBy WHEN 'Revision' THEN [COST_CostSheet].[Revision] END,
     CASE @OrderBy WHEN 'Revision DESC' THEN [COST_CostSheet].[Revision] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [COST_CostSheet].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [COST_CostSheet].[StatusID] END DESC,
     CASE @OrderBy WHEN 'AutoUpdateERPData' THEN [COST_CostSheet].[AutoUpdateERPData] END,
     CASE @OrderBy WHEN 'AutoUpdateERPData DESC' THEN [COST_CostSheet].[AutoUpdateERPData] END DESC,
     CASE @OrderBy WHEN 'LockERPData' THEN [COST_CostSheet].[LockERPData] END,
     CASE @OrderBy WHEN 'LockERPData DESC' THEN [COST_CostSheet].[LockERPData] END DESC,
     CASE @OrderBy WHEN 'LockAdjustmentEntry' THEN [COST_CostSheet].[LockAdjustmentEntry] END,
     CASE @OrderBy WHEN 'LockAdjustmentEntry DESC' THEN [COST_CostSheet].[LockAdjustmentEntry] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [COST_CostSheet].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [COST_CostSheet].[Remarks] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [COST_CostSheet].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [COST_CostSheet].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [COST_CostSheet].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [COST_CostSheet].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'ApproverRemarks' THEN [COST_CostSheet].[ApproverRemarks] END,
     CASE @OrderBy WHEN 'ApproverRemarks DESC' THEN [COST_CostSheet].[ApproverRemarks] END DESC,
     CASE @OrderBy WHEN 'ApprovedBy' THEN [COST_CostSheet].[ApprovedBy] END,
     CASE @OrderBy WHEN 'ApprovedBy DESC' THEN [COST_CostSheet].[ApprovedBy] END DESC,
     CASE @OrderBy WHEN 'ApprovedOn' THEN [COST_CostSheet].[ApprovedOn] END,
     CASE @OrderBy WHEN 'ApprovedOn DESC' THEN [COST_CostSheet].[ApprovedOn] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'COST_CostSheetStates3_Description' THEN [COST_CostSheetStates3].[Description] END,
     CASE @OrderBy WHEN 'COST_CostSheetStates3_Description DESC' THEN [COST_CostSheetStates3].[Description] END DESC,
     CASE @OrderBy WHEN 'COST_FinYear4_Descpription' THEN [COST_FinYear4].[Descpription] END,
     CASE @OrderBy WHEN 'COST_FinYear4_Descpription DESC' THEN [COST_FinYear4].[Descpription] END DESC,
     CASE @OrderBy WHEN 'COST_ProjectGroups5_ProjectGroupDescription' THEN [COST_ProjectGroups5].[ProjectGroupDescription] END,
     CASE @OrderBy WHEN 'COST_ProjectGroups5_ProjectGroupDescription DESC' THEN [COST_ProjectGroups5].[ProjectGroupDescription] END DESC,
     CASE @OrderBy WHEN 'COST_Quarters6_Description' THEN [COST_Quarters6].[Description] END,
     CASE @OrderBy WHEN 'COST_Quarters6_Description DESC' THEN [COST_Quarters6].[Description] END DESC 

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
