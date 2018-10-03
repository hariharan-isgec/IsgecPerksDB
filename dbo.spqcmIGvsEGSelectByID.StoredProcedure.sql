USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmIGvsEGSelectByID]
  @LoginID NVarChar(8),
  @InspectorGroupID Int,
  @EmployeeGroupID Int 
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
  [QCM_InspectorGroupEmployeeGroup].[InspectorGroupID] = @InspectorGroupID
  AND [QCM_InspectorGroupEmployeeGroup].[EmployeeGroupID] = @EmployeeGroupID
GO
