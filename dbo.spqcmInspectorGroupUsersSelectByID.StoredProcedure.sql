USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectorGroupUsersSelectByID]
  @LoginID NVarChar(8),
  @GroupID Int,
  @CardNo NVarChar(8) 
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
  [QCM_InspectorGroupUsers].[GroupID] = @GroupID
  AND [QCM_InspectorGroupUsers].[CardNo] = @CardNo
GO
