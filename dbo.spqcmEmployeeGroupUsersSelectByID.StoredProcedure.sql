USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmEmployeeGroupUsersSelectByID]
  @LoginID NVarChar(8),
  @GroupiD Int,
  @CardNo NVarChar(8) 
  AS
  SELECT
		[QCM_EmployeeGroupUsers].[GroupiD] ,
		[QCM_EmployeeGroupUsers].[CardNo] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[QCM_EmployeeGroups2].[Description] AS QCM_EmployeeGroups2_Description 
  FROM [QCM_EmployeeGroupUsers] 
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [QCM_EmployeeGroupUsers].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [QCM_EmployeeGroups] AS [QCM_EmployeeGroups2]
    ON [QCM_EmployeeGroupUsers].[GroupiD] = [QCM_EmployeeGroups2].[GroupID]
  WHERE
  [QCM_EmployeeGroupUsers].[GroupiD] = @GroupiD
  AND [QCM_EmployeeGroupUsers].[CardNo] = @CardNo
GO
