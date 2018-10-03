USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmOfficialProfileSelectByID]
  @CardNo NVarChar(8)
  AS
  SELECT
		[HRM_Employees].[CardNo],
		[HRM_Employees].[EmployeeName],
		[HRM_Employees].[WorkingAreaID],
		[HRM_Employees].[FunctionalStatusID1],
		[HRM_Employees].[FunctionalStatusID2],
		[HRM_Employees].[FunctionalStatusID3],
		[HRM_Employees].[FunctionalStatusID4],
		[HRM_Employees].[CareerStartedOn],
		[HRM_Employees].[EducationDetails],
		[HRM_Employees].[QualificationID1],
		[HRM_Employees].[QualificationYear1],
		[HRM_Employees].[QualificationID2],
		[HRM_Employees].[QualificationYear2],
		[HRM_Employees].[IncrementCompany],
		[HRM_WorkingAreas1].[WorkingAreaID] AS HRM_WorkingAreas1_WorkingAreaID,
		[HRM_WorkingAreas1].[Description] AS HRM_WorkingAreas1_Description,
		[HRM_FunctionalStatus12].[FunctionalStatusID1] AS HRM_FunctionalStatus12_FunctionalStatusID1,
		[HRM_FunctionalStatus12].[Description] AS HRM_FunctionalStatus12_Description,
		[HRM_FunctionalStatus23].[FunctionalStatusID2] AS HRM_FunctionalStatus23_FunctionalStatusID2,
		[HRM_FunctionalStatus23].[Description] AS HRM_FunctionalStatus23_Description,
		[HRM_FunctionalStatus34].[FunctionalStatusID3] AS HRM_FunctionalStatus34_FunctionalStatusID3,
		[HRM_FunctionalStatus34].[Description] AS HRM_FunctionalStatus34_Description,
		[HRM_FunctionalStatus45].[FunctionalStatusID4] AS HRM_FunctionalStatus45_FunctionalStatusID4,
		[HRM_FunctionalStatus45].[Description] AS HRM_FunctionalStatus45_Description,
		[HRM_Qualifications6].[QualificationID] AS HRM_Qualifications6_QualificationID,
		[HRM_Qualifications6].[Description] AS HRM_Qualifications6_Description,
		[HRM_Qualifications7].[QualificationID] AS HRM_Qualifications7_QualificationID,
		[HRM_Qualifications7].[Description] AS HRM_Qualifications7_Description,
		[HRM_Companies8].[CompanyID] AS HRM_Companies8_CompanyID,
		[HRM_Companies8].[Description] AS HRM_Companies8_Description,
		[HRM_Companies8].[ShortName] AS HRM_Companies8_ShortName,
		[HRM_Companies8].[BaaNID] AS HRM_Companies8_BaaNID 
  FROM [HRM_Employees] 
  LEFT OUTER JOIN [HRM_WorkingAreas] AS [HRM_WorkingAreas1]
    ON [HRM_Employees].[WorkingAreaID] = [HRM_WorkingAreas1].[WorkingAreaID]
  LEFT OUTER JOIN [HRM_FunctionalStatus1] AS [HRM_FunctionalStatus12]
    ON [HRM_Employees].[FunctionalStatusID1] = [HRM_FunctionalStatus12].[FunctionalStatusID1]
  LEFT OUTER JOIN [HRM_FunctionalStatus2] AS [HRM_FunctionalStatus23]
    ON [HRM_Employees].[FunctionalStatusID2] = [HRM_FunctionalStatus23].[FunctionalStatusID2]
  LEFT OUTER JOIN [HRM_FunctionalStatus3] AS [HRM_FunctionalStatus34]
    ON [HRM_Employees].[FunctionalStatusID3] = [HRM_FunctionalStatus34].[FunctionalStatusID3]
  LEFT OUTER JOIN [HRM_FunctionalStatus4] AS [HRM_FunctionalStatus45]
    ON [HRM_Employees].[FunctionalStatusID4] = [HRM_FunctionalStatus45].[FunctionalStatusID4]
  LEFT OUTER JOIN [HRM_Qualifications] AS [HRM_Qualifications6]
    ON [HRM_Employees].[QualificationID1] = [HRM_Qualifications6].[QualificationID]
  LEFT OUTER JOIN [HRM_Qualifications] AS [HRM_Qualifications7]
    ON [HRM_Employees].[QualificationID2] = [HRM_Qualifications7].[QualificationID]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies8]
    ON [HRM_Employees].[IncrementCompany] = [HRM_Companies8].[CompanyID]
  WHERE
  [HRM_Employees].[CardNo] = @CardNo
GO
