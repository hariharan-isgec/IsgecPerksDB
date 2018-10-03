USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectorGroupUsersSelectByCardNo]
  @CardNo NVarChar(8),
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QCM_InspectorGroupUsers].[GroupID] ,
		[QCM_InspectorGroupUsers].[CardNo] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[QCM_InspectorGroups2].[Description] AS QCM_InspectorGroups2_Description 
  FROM [QCM_InspectorGroupUsers] 
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [QCM_InspectorGroupUsers].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [QCM_InspectorGroups] AS [QCM_InspectorGroups2]
    ON [QCM_InspectorGroupUsers].[GroupID] = [QCM_InspectorGroups2].[GroupID]
  WHERE
  [QCM_InspectorGroupUsers].[CardNo] = @CardNo
  ORDER BY
     CASE @OrderBy WHEN 'GroupID' THEN [QCM_InspectorGroupUsers].[GroupID] END,
     CASE @OrderBy WHEN 'GroupID DESC' THEN [QCM_InspectorGroupUsers].[GroupID] END DESC,
     CASE @OrderBy WHEN 'CardNo' THEN [QCM_InspectorGroupUsers].[CardNo] END,
     CASE @OrderBy WHEN 'CardNo DESC' THEN [QCM_InspectorGroupUsers].[CardNo] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'QCM_InspectorGroups2_Description' THEN [QCM_InspectorGroups2].[Description] END,
     CASE @OrderBy WHEN 'QCM_InspectorGroups2_Description DESC' THEN [QCM_InspectorGroups2].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
