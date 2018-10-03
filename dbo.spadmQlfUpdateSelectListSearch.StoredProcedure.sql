USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmQlfUpdateSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (CardNo)
  SELECT [HRM_QlfUpdate].[CardNo] FROM [HRM_QlfUpdate]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments1]
    ON [HRM_QlfUpdate].[DepartmentID] = [HRM_Departments1].[DepartmentID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [HRM_QlfUpdate].[CardNo] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [HRM_Qualifications] AS [HRM_Qualifications3]
    ON [HRM_QlfUpdate].[Qlf1ID] = [HRM_Qualifications3].[QualificationID]
  LEFT OUTER JOIN [HRM_Qualifications] AS [HRM_Qualifications4]
    ON [HRM_QlfUpdate].[Qlf2ID] = [HRM_Qualifications4].[QualificationID]
 WHERE  
   ( 
         LOWER(ISNULL([HRM_QlfUpdate].[uid],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_QlfUpdate].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_QlfUpdate].[emailid],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_QlfUpdate].[DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_QlfUpdate].[Qlf1ID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_QlfUpdate].[Qlf1Yr],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_QlfUpdate].[Qlf1Specified],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_QlfUpdate].[Qlf2ID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_QlfUpdate].[Qlf2Yr],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_QlfUpdate].[Qlf2Specified],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_QlfUpdate].[FatherName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_QlfUpdate].[BloodGroupID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_QlfUpdate].[N_CellNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_QlfUpdate].[N_Qlf1ID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_QlfUpdate].[N_Qlf1Yr],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_QlfUpdate].[N_Qlf2ID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_QlfUpdate].[N_Qlf2Yr],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_QlfUpdate].[N_FatherName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_QlfUpdate].[N_BloodGroupID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Departments1].[DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Departments1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees2].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees2].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Qualifications3].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Qualifications4].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'uid' THEN [HRM_QlfUpdate].[uid] END,
     CASE @orderBy WHEN 'uid DESC' THEN [HRM_QlfUpdate].[uid] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [HRM_QlfUpdate].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [HRM_QlfUpdate].[CardNo] END DESC,
     CASE @orderBy WHEN 'emailid' THEN [HRM_QlfUpdate].[emailid] END,
     CASE @orderBy WHEN 'emailid DESC' THEN [HRM_QlfUpdate].[emailid] END DESC,
     CASE @orderBy WHEN 'DepartmentID' THEN [HRM_QlfUpdate].[DepartmentID] END,
     CASE @orderBy WHEN 'DepartmentID DESC' THEN [HRM_QlfUpdate].[DepartmentID] END DESC,
     CASE @orderBy WHEN 'Qlf1ID' THEN [HRM_QlfUpdate].[Qlf1ID] END,
     CASE @orderBy WHEN 'Qlf1ID DESC' THEN [HRM_QlfUpdate].[Qlf1ID] END DESC,
     CASE @orderBy WHEN 'Qlf1Yr' THEN [HRM_QlfUpdate].[Qlf1Yr] END,
     CASE @orderBy WHEN 'Qlf1Yr DESC' THEN [HRM_QlfUpdate].[Qlf1Yr] END DESC,
     CASE @orderBy WHEN 'Qlf1NotInList' THEN [HRM_QlfUpdate].[Qlf1NotInList] END,
     CASE @orderBy WHEN 'Qlf1NotInList DESC' THEN [HRM_QlfUpdate].[Qlf1NotInList] END DESC,
     CASE @orderBy WHEN 'Qlf1Specified' THEN [HRM_QlfUpdate].[Qlf1Specified] END,
     CASE @orderBy WHEN 'Qlf1Specified DESC' THEN [HRM_QlfUpdate].[Qlf1Specified] END DESC,
     CASE @orderBy WHEN 'Qlf2ID' THEN [HRM_QlfUpdate].[Qlf2ID] END,
     CASE @orderBy WHEN 'Qlf2ID DESC' THEN [HRM_QlfUpdate].[Qlf2ID] END DESC,
     CASE @orderBy WHEN 'Qlf2Yr' THEN [HRM_QlfUpdate].[Qlf2Yr] END,
     CASE @orderBy WHEN 'Qlf2Yr DESC' THEN [HRM_QlfUpdate].[Qlf2Yr] END DESC,
     CASE @orderBy WHEN 'Qlf2NotInList' THEN [HRM_QlfUpdate].[Qlf2NotInList] END,
     CASE @orderBy WHEN 'Qlf2NotInList DESC' THEN [HRM_QlfUpdate].[Qlf2NotInList] END DESC,
     CASE @orderBy WHEN 'Qlf2Specified' THEN [HRM_QlfUpdate].[Qlf2Specified] END,
     CASE @orderBy WHEN 'Qlf2Specified DESC' THEN [HRM_QlfUpdate].[Qlf2Specified] END DESC,
     CASE @orderBy WHEN 'FatherName' THEN [HRM_QlfUpdate].[FatherName] END,
     CASE @orderBy WHEN 'FatherName DESC' THEN [HRM_QlfUpdate].[FatherName] END DESC,
     CASE @orderBy WHEN 'DateOfBirth' THEN [HRM_QlfUpdate].[DateOfBirth] END,
     CASE @orderBy WHEN 'DateOfBirth DESC' THEN [HRM_QlfUpdate].[DateOfBirth] END DESC,
     CASE @orderBy WHEN 'BloodGroupID' THEN [HRM_QlfUpdate].[BloodGroupID] END,
     CASE @orderBy WHEN 'BloodGroupID DESC' THEN [HRM_QlfUpdate].[BloodGroupID] END DESC,
     CASE @orderBy WHEN 'N_CellNo' THEN [HRM_QlfUpdate].[N_CellNo] END,
     CASE @orderBy WHEN 'N_CellNo DESC' THEN [HRM_QlfUpdate].[N_CellNo] END DESC,
     CASE @orderBy WHEN 'N_Qlf1ID' THEN [HRM_QlfUpdate].[N_Qlf1ID] END,
     CASE @orderBy WHEN 'N_Qlf1ID DESC' THEN [HRM_QlfUpdate].[N_Qlf1ID] END DESC,
     CASE @orderBy WHEN 'N_Qlf1Yr' THEN [HRM_QlfUpdate].[N_Qlf1Yr] END,
     CASE @orderBy WHEN 'N_Qlf1Yr DESC' THEN [HRM_QlfUpdate].[N_Qlf1Yr] END DESC,
     CASE @orderBy WHEN 'N_Qlf2ID' THEN [HRM_QlfUpdate].[N_Qlf2ID] END,
     CASE @orderBy WHEN 'N_Qlf2ID DESC' THEN [HRM_QlfUpdate].[N_Qlf2ID] END DESC,
     CASE @orderBy WHEN 'N_Qlf2Yr' THEN [HRM_QlfUpdate].[N_Qlf2Yr] END,
     CASE @orderBy WHEN 'N_Qlf2Yr DESC' THEN [HRM_QlfUpdate].[N_Qlf2Yr] END DESC,
     CASE @orderBy WHEN 'N_FatherName' THEN [HRM_QlfUpdate].[N_FatherName] END,
     CASE @orderBy WHEN 'N_FatherName DESC' THEN [HRM_QlfUpdate].[N_FatherName] END DESC,
     CASE @orderBy WHEN 'N_DateOfBirth' THEN [HRM_QlfUpdate].[N_DateOfBirth] END,
     CASE @orderBy WHEN 'N_DateOfBirth DESC' THEN [HRM_QlfUpdate].[N_DateOfBirth] END DESC,
     CASE @orderBy WHEN 'N_BloodGroupID' THEN [HRM_QlfUpdate].[N_BloodGroupID] END,
     CASE @orderBy WHEN 'N_BloodGroupID DESC' THEN [HRM_QlfUpdate].[N_BloodGroupID] END DESC,
     CASE @orderBy WHEN 'sendmail' THEN [HRM_QlfUpdate].[sendmail] END,
     CASE @orderBy WHEN 'sendmail DESC' THEN [HRM_QlfUpdate].[sendmail] END DESC,
     CASE @orderBy WHEN 'Changed' THEN [HRM_QlfUpdate].[Changed] END,
     CASE @orderBy WHEN 'Changed DESC' THEN [HRM_QlfUpdate].[Changed] END DESC,
     CASE @orderBy WHEN 'Updated' THEN [HRM_QlfUpdate].[Updated] END,
     CASE @orderBy WHEN 'Updated DESC' THEN [HRM_QlfUpdate].[Updated] END DESC,
     CASE @orderBy WHEN 'UpdatedOn' THEN [HRM_QlfUpdate].[UpdatedOn] END,
     CASE @orderBy WHEN 'UpdatedOn DESC' THEN [HRM_QlfUpdate].[UpdatedOn] END DESC,
     CASE @orderBy WHEN 'HRM_Departments1_DepartmentID' THEN [HRM_Departments1].[DepartmentID] END,
     CASE @orderBy WHEN 'HRM_Departments1_DepartmentID DESC' THEN [HRM_Departments1].[DepartmentID] END DESC,
     CASE @orderBy WHEN 'HRM_Departments1_Description' THEN [HRM_Departments1].[Description] END,
     CASE @orderBy WHEN 'HRM_Departments1_Description DESC' THEN [HRM_Departments1].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_CardNo' THEN [HRM_Employees2].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees2_CardNo DESC' THEN [HRM_Employees2].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_OfficeID' THEN [HRM_Employees2].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_OfficeID DESC' THEN [HRM_Employees2].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Qualifications3_QualificationID' THEN [HRM_Qualifications3].[QualificationID] END,
     CASE @orderBy WHEN 'HRM_Qualifications3_QualificationID DESC' THEN [HRM_Qualifications3].[QualificationID] END DESC,
     CASE @orderBy WHEN 'HRM_Qualifications3_Description' THEN [HRM_Qualifications3].[Description] END,
     CASE @orderBy WHEN 'HRM_Qualifications3_Description DESC' THEN [HRM_Qualifications3].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Qualifications4_QualificationID' THEN [HRM_Qualifications4].[QualificationID] END,
     CASE @orderBy WHEN 'HRM_Qualifications4_QualificationID DESC' THEN [HRM_Qualifications4].[QualificationID] END DESC,
     CASE @orderBy WHEN 'HRM_Qualifications4_Description' THEN [HRM_Qualifications4].[Description] END,
     CASE @orderBy WHEN 'HRM_Qualifications4_Description DESC' THEN [HRM_Qualifications4].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		Convert(NVarChar(36),[HRM_QlfUpdate].[uid]) as uid,
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
    	INNER JOIN #PageIndex
          ON [HRM_QlfUpdate].[CardNo] = #PageIndex.CardNo
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments1]
    ON [HRM_QlfUpdate].[DepartmentID] = [HRM_Departments1].[DepartmentID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [HRM_QlfUpdate].[CardNo] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [HRM_Qualifications] AS [HRM_Qualifications3]
    ON [HRM_QlfUpdate].[Qlf1ID] = [HRM_Qualifications3].[QualificationID]
  LEFT OUTER JOIN [HRM_Qualifications] AS [HRM_Qualifications4]
    ON [HRM_QlfUpdate].[Qlf2ID] = [HRM_Qualifications4].[QualificationID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
