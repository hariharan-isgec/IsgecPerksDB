USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmIGvsEGSelectByEmployeeGroupID]
  @EmployeeGroupID Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QCM_InspectorGroupEmployeeGroup].[InspectorGroupID] ,
		[QCM_InspectorGroupEmployeeGroup].[EmployeeGroupID] ,
		[QCM_EmployeeGroups1].[Description] AS QCM_EmployeeGroups1_Description,
		[QCM_InspectorGroups2].[Description] AS QCM_InspectorGroups2_Description 
  FROM [QCM_InspectorGroupEmployeeGroup] 
  INNER JOIN [QCM_EmployeeGroups] AS [QCM_EmployeeGroups1]
    ON [QCM_InspectorGroupEmployeeGroup].[EmployeeGroupID] = [QCM_EmployeeGroups1].[GroupID]
  INNER JOIN [QCM_InspectorGroups] AS [QCM_InspectorGroups2]
    ON [QCM_InspectorGroupEmployeeGroup].[InspectorGroupID] = [QCM_InspectorGroups2].[GroupID]
  WHERE
  [QCM_InspectorGroupEmployeeGroup].[EmployeeGroupID] = @EmployeeGroupID
  ORDER BY
     CASE @OrderBy WHEN 'InspectorGroupID' THEN [QCM_InspectorGroupEmployeeGroup].[InspectorGroupID] END,
     CASE @OrderBy WHEN 'InspectorGroupID DESC' THEN [QCM_InspectorGroupEmployeeGroup].[InspectorGroupID] END DESC,
     CASE @OrderBy WHEN 'EmployeeGroupID' THEN [QCM_InspectorGroupEmployeeGroup].[EmployeeGroupID] END,
     CASE @OrderBy WHEN 'EmployeeGroupID DESC' THEN [QCM_InspectorGroupEmployeeGroup].[EmployeeGroupID] END DESC,
     CASE @OrderBy WHEN 'QCM_EmployeeGroups1_Description' THEN [QCM_EmployeeGroups1].[Description] END,
     CASE @OrderBy WHEN 'QCM_EmployeeGroups1_Description DESC' THEN [QCM_EmployeeGroups1].[Description] END DESC,
     CASE @OrderBy WHEN 'QCM_InspectorGroups2_Description' THEN [QCM_InspectorGroups2].[Description] END,
     CASE @OrderBy WHEN 'QCM_InspectorGroups2_Description DESC' THEN [QCM_InspectorGroups2].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
