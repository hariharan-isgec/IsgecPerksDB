USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnCardReplacementSelectByID]
  @ReplacedCardNo NVarChar(8)
  AS
  SELECT
		[ATN_CardReplacement].[ReplacedCardNo],
		[ATN_CardReplacement].[CardNo],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees1].[VerificationRequired] AS HRM_Employees1_VerificationRequired,
		[HRM_Employees1].[VerifierID] AS HRM_Employees1_VerifierID,
		[HRM_Employees1].[ApprovalRequired] AS HRM_Employees1_ApprovalRequired,
		[HRM_Employees1].[ApproverID] AS HRM_Employees1_ApproverID,
		[HRM_Employees1].[C_DateOfJoining] AS HRM_Employees1_C_DateOfJoining,
		[HRM_Employees1].[C_DateOfReleaving] AS HRM_Employees1_C_DateOfReleaving,
		[HRM_Employees1].[C_CompanyID] AS HRM_Employees1_C_CompanyID,
		[HRM_Employees1].[C_DivisionID] AS HRM_Employees1_C_DivisionID,
		[HRM_Employees1].[C_OfficeID] AS HRM_Employees1_C_OfficeID,
		[HRM_Employees1].[C_DepartmentID] AS HRM_Employees1_C_DepartmentID,
		[HRM_Employees1].[C_DesignationID] AS HRM_Employees1_C_DesignationID,
		[HRM_Employees1].[ActiveState] AS HRM_Employees1_ActiveState 
  FROM [ATN_CardReplacement] 
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_CardReplacement].[CardNo] = [HRM_Employees1].[CardNo]
  WHERE
  [ATN_CardReplacement].[ReplacedCardNo] = @ReplacedCardNo
GO
