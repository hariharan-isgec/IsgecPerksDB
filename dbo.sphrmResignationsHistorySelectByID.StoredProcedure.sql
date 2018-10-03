USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmResignationsHistorySelectByID]
  @ResignID Int
  AS
  SELECT
		[HRM_Resignations].[ResignID],
		[HRM_Resignations].[CardNo],
		[HRM_Resignations].[StatusID],
		[HRM_Resignations].[ResignedOn],
		[HRM_Resignations].[ReleavedOn],
		[HRM_Resignations].[Remarks],
		[HRM_Resignations].[Executed],
		[HRM_Resignations].[Cancelled],
		[HRM_Resignations].[ProcessedBy],
		[HRM_Resignations].[ProcessedOn],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees1].[C_DateOfJoining] AS HRM_Employees1_C_DateOfJoining,
		[HRM_Employees1].[C_CompanyID] AS HRM_Employees1_C_CompanyID,
		[HRM_Employees1].[C_DivisionID] AS HRM_Employees1_C_DivisionID,
		[HRM_Employees1].[C_OfficeID] AS HRM_Employees1_C_OfficeID,
		[HRM_Employees1].[C_DepartmentID] AS HRM_Employees1_C_DepartmentID,
		[HRM_Employees1].[C_ProjectSiteID] AS HRM_Employees1_C_ProjectSiteID,
		[HRM_Employees1].[C_DesignationID] AS HRM_Employees1_C_DesignationID,
		[HRM_Employees1].[ActiveState] AS HRM_Employees1_ActiveState,
		[HRM_Status2].[StatusID] AS HRM_Status2_StatusID,
		[HRM_Status2].[Description] AS HRM_Status2_Description,
		[HRM_Status2].[Sequence] AS HRM_Status2_Sequence,
		[HRM_Employees3].[CardNo] AS HRM_Employees3_CardNo,
		[HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName,
		[HRM_Employees3].[C_DateOfJoining] AS HRM_Employees3_C_DateOfJoining,
		[HRM_Employees3].[C_CompanyID] AS HRM_Employees3_C_CompanyID,
		[HRM_Employees3].[C_DivisionID] AS HRM_Employees3_C_DivisionID,
		[HRM_Employees3].[C_OfficeID] AS HRM_Employees3_C_OfficeID,
		[HRM_Employees3].[C_DepartmentID] AS HRM_Employees3_C_DepartmentID,
		[HRM_Employees3].[C_ProjectSiteID] AS HRM_Employees3_C_ProjectSiteID,
		[HRM_Employees3].[C_DesignationID] AS HRM_Employees3_C_DesignationID,
		[HRM_Employees3].[ActiveState] AS HRM_Employees3_ActiveState 
  FROM [HRM_Resignations] 
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Resignations].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [HRM_Status] AS [HRM_Status2]
    ON [HRM_Resignations].[StatusID] = [HRM_Status2].[StatusID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [HRM_Resignations].[ProcessedBy] = [HRM_Employees3].[CardNo]
  WHERE
  [HRM_Resignations].[ResignID] = @ResignID
GO
