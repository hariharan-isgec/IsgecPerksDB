USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmOfficialProfileSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  CardNo NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (CardNo) ' + 
               'SELECT [HRM_Employees].[CardNo] FROM [HRM_Employees] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_WorkingAreas] AS [HRM_WorkingAreas1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[WorkingAreaID] = [HRM_WorkingAreas1].[WorkingAreaID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_FunctionalStatus1] AS [HRM_FunctionalStatus12]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[FunctionalStatusID1] = [HRM_FunctionalStatus12].[FunctionalStatusID1]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_FunctionalStatus2] AS [HRM_FunctionalStatus23]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[FunctionalStatusID2] = [HRM_FunctionalStatus23].[FunctionalStatusID2]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_FunctionalStatus3] AS [HRM_FunctionalStatus34]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[FunctionalStatusID3] = [HRM_FunctionalStatus34].[FunctionalStatusID3]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_FunctionalStatus4] AS [HRM_FunctionalStatus45]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[FunctionalStatusID4] = [HRM_FunctionalStatus45].[FunctionalStatusID4]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Qualifications] AS [HRM_Qualifications6]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[QualificationID1] = [HRM_Qualifications6].[QualificationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Qualifications] AS [HRM_Qualifications7]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[QualificationID2] = [HRM_Qualifications7].[QualificationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies8]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[IncrementCompany] = [HRM_Companies8].[CompanyID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CardNo' THEN '[HRM_Employees].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[HRM_Employees].[CardNo] DESC'
                        WHEN 'EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'EmployeeName DESC' THEN '[HRM_Employees].[EmployeeName] DESC'
                        WHEN 'WorkingAreaID' THEN '[HRM_Employees].[WorkingAreaID]'
                        WHEN 'WorkingAreaID DESC' THEN '[HRM_Employees].[WorkingAreaID] DESC'
                        WHEN 'FunctionalStatusID1' THEN '[HRM_Employees].[FunctionalStatusID1]'
                        WHEN 'FunctionalStatusID1 DESC' THEN '[HRM_Employees].[FunctionalStatusID1] DESC'
                        WHEN 'FunctionalStatusID2' THEN '[HRM_Employees].[FunctionalStatusID2]'
                        WHEN 'FunctionalStatusID2 DESC' THEN '[HRM_Employees].[FunctionalStatusID2] DESC'
                        WHEN 'FunctionalStatusID3' THEN '[HRM_Employees].[FunctionalStatusID3]'
                        WHEN 'FunctionalStatusID3 DESC' THEN '[HRM_Employees].[FunctionalStatusID3] DESC'
                        WHEN 'FunctionalStatusID4' THEN '[HRM_Employees].[FunctionalStatusID4]'
                        WHEN 'FunctionalStatusID4 DESC' THEN '[HRM_Employees].[FunctionalStatusID4] DESC'
                        WHEN 'CareerStartedOn' THEN '[HRM_Employees].[CareerStartedOn]'
                        WHEN 'CareerStartedOn DESC' THEN '[HRM_Employees].[CareerStartedOn] DESC'
                        WHEN 'EducationDetails' THEN '[HRM_Employees].[EducationDetails]'
                        WHEN 'EducationDetails DESC' THEN '[HRM_Employees].[EducationDetails] DESC'
                        WHEN 'QualificationID1' THEN '[HRM_Employees].[QualificationID1]'
                        WHEN 'QualificationID1 DESC' THEN '[HRM_Employees].[QualificationID1] DESC'
                        WHEN 'QualificationYear1' THEN '[HRM_Employees].[QualificationYear1]'
                        WHEN 'QualificationYear1 DESC' THEN '[HRM_Employees].[QualificationYear1] DESC'
                        WHEN 'QualificationID2' THEN '[HRM_Employees].[QualificationID2]'
                        WHEN 'QualificationID2 DESC' THEN '[HRM_Employees].[QualificationID2] DESC'
                        WHEN 'QualificationYear2' THEN '[HRM_Employees].[QualificationYear2]'
                        WHEN 'QualificationYear2 DESC' THEN '[HRM_Employees].[QualificationYear2] DESC'
                        WHEN 'IncrementCompany' THEN '[HRM_Employees].[IncrementCompany]'
                        WHEN 'IncrementCompany DESC' THEN '[HRM_Employees].[IncrementCompany] DESC'
                        WHEN 'HRM_WorkingAreas1_WorkingAreaID' THEN '[HRM_WorkingAreas1].[WorkingAreaID]'
                        WHEN 'HRM_WorkingAreas1_WorkingAreaID DESC' THEN '[HRM_WorkingAreas1].[WorkingAreaID] DESC'
                        WHEN 'HRM_WorkingAreas1_Description' THEN '[HRM_WorkingAreas1].[Description]'
                        WHEN 'HRM_WorkingAreas1_Description DESC' THEN '[HRM_WorkingAreas1].[Description] DESC'
                        WHEN 'HRM_FunctionalStatus12_FunctionalStatusID1' THEN '[HRM_FunctionalStatus12].[FunctionalStatusID1]'
                        WHEN 'HRM_FunctionalStatus12_FunctionalStatusID1 DESC' THEN '[HRM_FunctionalStatus12].[FunctionalStatusID1] DESC'
                        WHEN 'HRM_FunctionalStatus12_Description' THEN '[HRM_FunctionalStatus12].[Description]'
                        WHEN 'HRM_FunctionalStatus12_Description DESC' THEN '[HRM_FunctionalStatus12].[Description] DESC'
                        WHEN 'HRM_FunctionalStatus23_FunctionalStatusID2' THEN '[HRM_FunctionalStatus23].[FunctionalStatusID2]'
                        WHEN 'HRM_FunctionalStatus23_FunctionalStatusID2 DESC' THEN '[HRM_FunctionalStatus23].[FunctionalStatusID2] DESC'
                        WHEN 'HRM_FunctionalStatus23_Description' THEN '[HRM_FunctionalStatus23].[Description]'
                        WHEN 'HRM_FunctionalStatus23_Description DESC' THEN '[HRM_FunctionalStatus23].[Description] DESC'
                        WHEN 'HRM_FunctionalStatus34_FunctionalStatusID3' THEN '[HRM_FunctionalStatus34].[FunctionalStatusID3]'
                        WHEN 'HRM_FunctionalStatus34_FunctionalStatusID3 DESC' THEN '[HRM_FunctionalStatus34].[FunctionalStatusID3] DESC'
                        WHEN 'HRM_FunctionalStatus34_Description' THEN '[HRM_FunctionalStatus34].[Description]'
                        WHEN 'HRM_FunctionalStatus34_Description DESC' THEN '[HRM_FunctionalStatus34].[Description] DESC'
                        WHEN 'HRM_FunctionalStatus45_FunctionalStatusID4' THEN '[HRM_FunctionalStatus45].[FunctionalStatusID4]'
                        WHEN 'HRM_FunctionalStatus45_FunctionalStatusID4 DESC' THEN '[HRM_FunctionalStatus45].[FunctionalStatusID4] DESC'
                        WHEN 'HRM_FunctionalStatus45_Description' THEN '[HRM_FunctionalStatus45].[Description]'
                        WHEN 'HRM_FunctionalStatus45_Description DESC' THEN '[HRM_FunctionalStatus45].[Description] DESC'
                        WHEN 'HRM_Qualifications6_QualificationID' THEN '[HRM_Qualifications6].[QualificationID]'
                        WHEN 'HRM_Qualifications6_QualificationID DESC' THEN '[HRM_Qualifications6].[QualificationID] DESC'
                        WHEN 'HRM_Qualifications6_Description' THEN '[HRM_Qualifications6].[Description]'
                        WHEN 'HRM_Qualifications6_Description DESC' THEN '[HRM_Qualifications6].[Description] DESC'
                        WHEN 'HRM_Qualifications7_QualificationID' THEN '[HRM_Qualifications7].[QualificationID]'
                        WHEN 'HRM_Qualifications7_QualificationID DESC' THEN '[HRM_Qualifications7].[QualificationID] DESC'
                        WHEN 'HRM_Qualifications7_Description' THEN '[HRM_Qualifications7].[Description]'
                        WHEN 'HRM_Qualifications7_Description DESC' THEN '[HRM_Qualifications7].[Description] DESC'
                        WHEN 'HRM_Companies8_CompanyID' THEN '[HRM_Companies8].[CompanyID]'
                        WHEN 'HRM_Companies8_CompanyID DESC' THEN '[HRM_Companies8].[CompanyID] DESC'
                        WHEN 'HRM_Companies8_Description' THEN '[HRM_Companies8].[Description]'
                        WHEN 'HRM_Companies8_Description DESC' THEN '[HRM_Companies8].[Description] DESC'
                        WHEN 'HRM_Companies8_ShortName' THEN '[HRM_Companies8].[ShortName]'
                        WHEN 'HRM_Companies8_ShortName DESC' THEN '[HRM_Companies8].[ShortName] DESC'
                        WHEN 'HRM_Companies8_BaaNID' THEN '[HRM_Companies8].[BaaNID]'
                        WHEN 'HRM_Companies8_BaaNID DESC' THEN '[HRM_Companies8].[BaaNID] DESC'
                        ELSE '[HRM_Employees].[CardNo]'
                    END
  EXEC (@LGSQL)

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
