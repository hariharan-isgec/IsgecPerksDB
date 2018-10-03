USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsApproversSelectByID]
  @FinYear NVarChar(4),
  @CardNo NVarChar(8) 
  AS
  SELECT
		[PMS_Approvers].[FinYear] ,
		[PMS_Approvers].[CardNo] ,
		[PMS_Approvers].[Apparaiser] ,
		[PMS_Approvers].[ReviewerI] ,
		[PMS_Approvers].[ReviewerII] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName,
		[HRM_Employees4].[EmployeeName] AS HRM_Employees4_EmployeeName,
		[PMS_FinYear5].[Description] AS PMS_FinYear5_Description 
  FROM [PMS_Approvers] 
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [PMS_Approvers].[CardNo] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [PMS_Approvers].[Apparaiser] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [PMS_Approvers].[ReviewerI] = [HRM_Employees3].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees4]
    ON [PMS_Approvers].[ReviewerII] = [HRM_Employees4].[CardNo]
  INNER JOIN [PMS_FinYear] AS [PMS_FinYear5]
    ON [PMS_Approvers].[FinYear] = [PMS_FinYear5].[FinYear]
  WHERE
  [PMS_Approvers].[FinYear] = @FinYear
  AND [PMS_Approvers].[CardNo] = @CardNo
GO
