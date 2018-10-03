USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmOfficialProfileSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  CardNo NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (CardNo)
  SELECT [HRM_Employees].[CardNo] FROM [HRM_Employees]
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
   ( 
         LOWER(ISNULL([HRM_Employees].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[WorkingAreaID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[FunctionalStatusID1], 0)) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[FunctionalStatusID2], 0)) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[FunctionalStatusID3], 0)) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[FunctionalStatusID4], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[EducationDetails],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[QualificationID1], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[QualificationYear1],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[QualificationID2], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[QualificationYear2],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[IncrementCompany],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_WorkingAreas1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_FunctionalStatus12].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_FunctionalStatus23].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_FunctionalStatus34].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_FunctionalStatus45].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Qualifications6].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Qualifications7].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies8].[CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies8].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies8].[ShortName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies8].[BaaNID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CardNo' THEN [HRM_Employees].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [HRM_Employees].[CardNo] END DESC,
     CASE @orderBy WHEN 'EmployeeName' THEN [HRM_Employees].[EmployeeName] END,
     CASE @orderBy WHEN 'EmployeeName DESC' THEN [HRM_Employees].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'WorkingAreaID' THEN [HRM_Employees].[WorkingAreaID] END,
     CASE @orderBy WHEN 'WorkingAreaID DESC' THEN [HRM_Employees].[WorkingAreaID] END DESC,
     CASE @orderBy WHEN 'FunctionalStatusID1' THEN [HRM_Employees].[FunctionalStatusID1] END,
     CASE @orderBy WHEN 'FunctionalStatusID1 DESC' THEN [HRM_Employees].[FunctionalStatusID1] END DESC,
     CASE @orderBy WHEN 'FunctionalStatusID2' THEN [HRM_Employees].[FunctionalStatusID2] END,
     CASE @orderBy WHEN 'FunctionalStatusID2 DESC' THEN [HRM_Employees].[FunctionalStatusID2] END DESC,
     CASE @orderBy WHEN 'FunctionalStatusID3' THEN [HRM_Employees].[FunctionalStatusID3] END,
     CASE @orderBy WHEN 'FunctionalStatusID3 DESC' THEN [HRM_Employees].[FunctionalStatusID3] END DESC,
     CASE @orderBy WHEN 'FunctionalStatusID4' THEN [HRM_Employees].[FunctionalStatusID4] END,
     CASE @orderBy WHEN 'FunctionalStatusID4 DESC' THEN [HRM_Employees].[FunctionalStatusID4] END DESC,
     CASE @orderBy WHEN 'CareerStartedOn' THEN [HRM_Employees].[CareerStartedOn] END,
     CASE @orderBy WHEN 'CareerStartedOn DESC' THEN [HRM_Employees].[CareerStartedOn] END DESC,
     CASE @orderBy WHEN 'EducationDetails' THEN [HRM_Employees].[EducationDetails] END,
     CASE @orderBy WHEN 'EducationDetails DESC' THEN [HRM_Employees].[EducationDetails] END DESC,
     CASE @orderBy WHEN 'QualificationID1' THEN [HRM_Employees].[QualificationID1] END,
     CASE @orderBy WHEN 'QualificationID1 DESC' THEN [HRM_Employees].[QualificationID1] END DESC,
     CASE @orderBy WHEN 'QualificationYear1' THEN [HRM_Employees].[QualificationYear1] END,
     CASE @orderBy WHEN 'QualificationYear1 DESC' THEN [HRM_Employees].[QualificationYear1] END DESC,
     CASE @orderBy WHEN 'QualificationID2' THEN [HRM_Employees].[QualificationID2] END,
     CASE @orderBy WHEN 'QualificationID2 DESC' THEN [HRM_Employees].[QualificationID2] END DESC,
     CASE @orderBy WHEN 'QualificationYear2' THEN [HRM_Employees].[QualificationYear2] END,
     CASE @orderBy WHEN 'QualificationYear2 DESC' THEN [HRM_Employees].[QualificationYear2] END DESC,
     CASE @orderBy WHEN 'IncrementCompany' THEN [HRM_Employees].[IncrementCompany] END,
     CASE @orderBy WHEN 'IncrementCompany DESC' THEN [HRM_Employees].[IncrementCompany] END DESC,
     CASE @orderBy WHEN 'HRM_WorkingAreas1_WorkingAreaID' THEN [HRM_WorkingAreas1].[WorkingAreaID] END,
     CASE @orderBy WHEN 'HRM_WorkingAreas1_WorkingAreaID DESC' THEN [HRM_WorkingAreas1].[WorkingAreaID] END DESC,
     CASE @orderBy WHEN 'HRM_WorkingAreas1_Description' THEN [HRM_WorkingAreas1].[Description] END,
     CASE @orderBy WHEN 'HRM_WorkingAreas1_Description DESC' THEN [HRM_WorkingAreas1].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_FunctionalStatus12_FunctionalStatusID1' THEN [HRM_FunctionalStatus12].[FunctionalStatusID1] END,
     CASE @orderBy WHEN 'HRM_FunctionalStatus12_FunctionalStatusID1 DESC' THEN [HRM_FunctionalStatus12].[FunctionalStatusID1] END DESC,
     CASE @orderBy WHEN 'HRM_FunctionalStatus12_Description' THEN [HRM_FunctionalStatus12].[Description] END,
     CASE @orderBy WHEN 'HRM_FunctionalStatus12_Description DESC' THEN [HRM_FunctionalStatus12].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_FunctionalStatus23_FunctionalStatusID2' THEN [HRM_FunctionalStatus23].[FunctionalStatusID2] END,
     CASE @orderBy WHEN 'HRM_FunctionalStatus23_FunctionalStatusID2 DESC' THEN [HRM_FunctionalStatus23].[FunctionalStatusID2] END DESC,
     CASE @orderBy WHEN 'HRM_FunctionalStatus23_Description' THEN [HRM_FunctionalStatus23].[Description] END,
     CASE @orderBy WHEN 'HRM_FunctionalStatus23_Description DESC' THEN [HRM_FunctionalStatus23].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_FunctionalStatus34_FunctionalStatusID3' THEN [HRM_FunctionalStatus34].[FunctionalStatusID3] END,
     CASE @orderBy WHEN 'HRM_FunctionalStatus34_FunctionalStatusID3 DESC' THEN [HRM_FunctionalStatus34].[FunctionalStatusID3] END DESC,
     CASE @orderBy WHEN 'HRM_FunctionalStatus34_Description' THEN [HRM_FunctionalStatus34].[Description] END,
     CASE @orderBy WHEN 'HRM_FunctionalStatus34_Description DESC' THEN [HRM_FunctionalStatus34].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_FunctionalStatus45_FunctionalStatusID4' THEN [HRM_FunctionalStatus45].[FunctionalStatusID4] END,
     CASE @orderBy WHEN 'HRM_FunctionalStatus45_FunctionalStatusID4 DESC' THEN [HRM_FunctionalStatus45].[FunctionalStatusID4] END DESC,
     CASE @orderBy WHEN 'HRM_FunctionalStatus45_Description' THEN [HRM_FunctionalStatus45].[Description] END,
     CASE @orderBy WHEN 'HRM_FunctionalStatus45_Description DESC' THEN [HRM_FunctionalStatus45].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Qualifications6_QualificationID' THEN [HRM_Qualifications6].[QualificationID] END,
     CASE @orderBy WHEN 'HRM_Qualifications6_QualificationID DESC' THEN [HRM_Qualifications6].[QualificationID] END DESC,
     CASE @orderBy WHEN 'HRM_Qualifications6_Description' THEN [HRM_Qualifications6].[Description] END,
     CASE @orderBy WHEN 'HRM_Qualifications6_Description DESC' THEN [HRM_Qualifications6].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Qualifications7_QualificationID' THEN [HRM_Qualifications7].[QualificationID] END,
     CASE @orderBy WHEN 'HRM_Qualifications7_QualificationID DESC' THEN [HRM_Qualifications7].[QualificationID] END DESC,
     CASE @orderBy WHEN 'HRM_Qualifications7_Description' THEN [HRM_Qualifications7].[Description] END,
     CASE @orderBy WHEN 'HRM_Qualifications7_Description DESC' THEN [HRM_Qualifications7].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Companies8_CompanyID' THEN [HRM_Companies8].[CompanyID] END,
     CASE @orderBy WHEN 'HRM_Companies8_CompanyID DESC' THEN [HRM_Companies8].[CompanyID] END DESC,
     CASE @orderBy WHEN 'HRM_Companies8_Description' THEN [HRM_Companies8].[Description] END,
     CASE @orderBy WHEN 'HRM_Companies8_Description DESC' THEN [HRM_Companies8].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Companies8_ShortName' THEN [HRM_Companies8].[ShortName] END,
     CASE @orderBy WHEN 'HRM_Companies8_ShortName DESC' THEN [HRM_Companies8].[ShortName] END DESC,
     CASE @orderBy WHEN 'HRM_Companies8_BaaNID' THEN [HRM_Companies8].[BaaNID] END,
     CASE @orderBy WHEN 'HRM_Companies8_BaaNID DESC' THEN [HRM_Companies8].[BaaNID] END DESC 

    SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [HRM_Employees].[CardNo] = #PageIndex.CardNo
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
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
