USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmPromotionsHistorySelectByID]
  @PromotionID Int
  AS
  SELECT
		[HRM_Promotions].[PromotionID],
		[HRM_Promotions].[CardNo],
		[HRM_Promotions].[PromotionOn],
		[HRM_Promotions].[DesignationID],
		[HRM_Promotions].[Remarks],
		[HRM_Promotions].[Executed],
		[HRM_Promotions].[Cancelled],
		[HRM_Promotions].[ProcessedBy],
		[HRM_Promotions].[ProcessedOn],
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
		[HRM_Designations2].[DesignationID] AS HRM_Designations2_DesignationID,
		[HRM_Designations2].[Description] AS HRM_Designations2_Description,
		[HRM_Designations2].[ShortName] AS HRM_Designations2_ShortName,
		[HRM_Designations2].[Sequence] AS HRM_Designations2_Sequence,
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
  FROM [HRM_Promotions] 
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Promotions].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [HRM_Designations] AS [HRM_Designations2]
    ON [HRM_Promotions].[DesignationID] = [HRM_Designations2].[DesignationID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [HRM_Promotions].[ProcessedBy] = [HRM_Employees3].[CardNo]
  WHERE
  [HRM_Promotions].[PromotionID] = @PromotionID
GO
