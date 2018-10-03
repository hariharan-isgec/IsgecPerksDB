USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFormsHSelectByID]
  @FinYear NVarChar(4),
  @CardNo NVarChar(8) 
  AS
  SELECT
		[PMS_FormsH].[FinYear] ,
		[PMS_FormsH].[CardNo] ,
		[PMS_FormsH].[FormStatusID] ,
		[PMS_FormsH].[SubmittedOn] ,
		[PMS_FormsH].[ApprovedOn] ,
		[PMS_FormsH].[ApprovedBy] ,
		[PMS_FormsH].[SubmittedToHROn] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[PMS_FinYear4].[Description] AS PMS_FinYear4_Description,
		[PMS_FormStatus5].[Description] AS PMS_FormStatus5_Description 
  FROM [PMS_FormsH] 
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [PMS_FormsH].[CardNo] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [PMS_FormsH].[ApprovedBy] = [HRM_Employees2].[CardNo]
  INNER JOIN [PMS_Approvers] AS [PMS_Approvers3]
    ON [PMS_FormsH].[FinYear] = [PMS_Approvers3].[FinYear]
    AND [PMS_FormsH].[CardNo] = [PMS_Approvers3].[CardNo]
  INNER JOIN [PMS_FinYear] AS [PMS_FinYear4]
    ON [PMS_FormsH].[FinYear] = [PMS_FinYear4].[FinYear]
  INNER JOIN [PMS_FormStatus] AS [PMS_FormStatus5]
    ON [PMS_FormsH].[FormStatusID] = [PMS_FormStatus5].[FormStatusID]
  WHERE
  [PMS_FormsH].[FinYear] = @FinYear
  AND [PMS_FormsH].[CardNo] = @CardNo
GO
