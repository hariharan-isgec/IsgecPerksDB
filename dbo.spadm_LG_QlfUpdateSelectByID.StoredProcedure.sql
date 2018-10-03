USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadm_LG_QlfUpdateSelectByID]
  @CardNo NvarChar(36)    
  AS
  SELECT
		[HRM_QlfUpdate].[uid],
		[HRM_QlfUpdate].[CardNo],
		[HRM_QlfUpdate].[emailid],
		[HRM_QlfUpdate].[DepartmentID],
		[HRM_QlfUpdate].[Qlf1ID],
		[HRM_QlfUpdate].[Qlf1Yr],
		[HRM_QlfUpdate].[Qlf1NotInList],
		[HRM_QlfUpdate].[Qlf1Specified],
		[HRM_QlfUpdate].[Qlf2ID],
		[HRM_QlfUpdate].[Qlf2Yr],
		[HRM_QlfUpdate].[Qlf2NotInList],
		[HRM_QlfUpdate].[Qlf2Specified],
		[HRM_QlfUpdate].[FatherName],
		[HRM_QlfUpdate].[DateOfBirth],
		[HRM_QlfUpdate].[BloodGroupID],
		[HRM_QlfUpdate].[N_CellNo],
		[HRM_QlfUpdate].[N_Qlf1ID],
		[HRM_QlfUpdate].[N_Qlf1Yr],
		[HRM_QlfUpdate].[N_Qlf2ID],
		[HRM_QlfUpdate].[N_Qlf2Yr],
		[HRM_QlfUpdate].[N_FatherName],
		[HRM_QlfUpdate].[N_DateOfBirth],
		[HRM_QlfUpdate].[N_BloodGroupID],
		[HRM_QlfUpdate].[sendmail],
		[HRM_QlfUpdate].[Changed],
		[HRM_QlfUpdate].[Updated],
		[HRM_QlfUpdate].[UpdatedOn],
		[HRM_Departments1].[DepartmentID] AS HRM_Departments1_DepartmentID,
		[HRM_Departments1].[Description] AS HRM_Departments1_Description,
		[HRM_Employees2].[CardNo] AS HRM_Employees2_CardNo,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[HRM_Employees2].[C_OfficeID] AS HRM_Employees2_C_OfficeID,
		[HRM_Qualifications3].[QualificationID] AS HRM_Qualifications3_QualificationID,
		[HRM_Qualifications3].[Description] AS HRM_Qualifications3_Description,
		[HRM_Qualifications4].[QualificationID] AS HRM_Qualifications4_QualificationID,
		[HRM_Qualifications4].[Description] AS HRM_Qualifications4_Description 
  FROM [HRM_QlfUpdate] 
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments1]
    ON [HRM_QlfUpdate].[DepartmentID] = [HRM_Departments1].[DepartmentID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [HRM_QlfUpdate].[CardNo] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [HRM_Qualifications] AS [HRM_Qualifications3]
    ON [HRM_QlfUpdate].[Qlf1ID] = [HRM_Qualifications3].[QualificationID]
  LEFT OUTER JOIN [HRM_Qualifications] AS [HRM_Qualifications4]
    ON [HRM_QlfUpdate].[Qlf2ID] = [HRM_Qualifications4].[QualificationID]
  WHERE
  [HRM_QlfUpdate].[uid] = convert(UniqueIdentifier,@CardNo)
GO
