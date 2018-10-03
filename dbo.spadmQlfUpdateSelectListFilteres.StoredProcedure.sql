USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmQlfUpdateSelectListFilteres]
  @Filter_CardNo NVarChar(8),
  @Filter_DepartmentID NVarChar(6),
  @Filter_Qlf1ID Int,
  @Filter_Qlf2ID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CardNo'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[HRM_QlfUpdate].[CardNo]'  SET @LGSQL = @LGSQL + ' FROM [HRM_QlfUpdate] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_QlfUpdate].[DepartmentID] = [HRM_Departments1].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [HRM_QlfUpdate].[CardNo] = [HRM_Employees2].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Qualifications] AS [HRM_Qualifications3]'
  SET @LGSQL = @LGSQL + '    ON [HRM_QlfUpdate].[Qlf1ID] = [HRM_Qualifications3].[QualificationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Qualifications] AS [HRM_Qualifications4]'
  SET @LGSQL = @LGSQL + '    ON [HRM_QlfUpdate].[Qlf2ID] = [HRM_Qualifications4].[QualificationID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [HRM_QlfUpdate].[CardNo] = ''' + @Filter_CardNo + ''''
  IF (@Filter_DepartmentID > '') 
    SET @LGSQL = @LGSQL + ' AND [HRM_QlfUpdate].[DepartmentID] = ''' + @Filter_DepartmentID + ''''
  IF (@Filter_Qlf1ID > 0) 
    SET @LGSQL = @LGSQL + ' AND [HRM_QlfUpdate].[Qlf1ID] = ' + STR(@Filter_Qlf1ID)
  IF (@Filter_Qlf2ID > 0) 
    SET @LGSQL = @LGSQL + ' AND [HRM_QlfUpdate].[Qlf2ID] = ' + STR(@Filter_Qlf2ID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'uid' THEN '[HRM_QlfUpdate].[uid]'
                        WHEN 'uid DESC' THEN '[HRM_QlfUpdate].[uid] DESC'
                        WHEN 'CardNo' THEN '[HRM_QlfUpdate].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[HRM_QlfUpdate].[CardNo] DESC'
                        WHEN 'emailid' THEN '[HRM_QlfUpdate].[emailid]'
                        WHEN 'emailid DESC' THEN '[HRM_QlfUpdate].[emailid] DESC'
                        WHEN 'DepartmentID' THEN '[HRM_QlfUpdate].[DepartmentID]'
                        WHEN 'DepartmentID DESC' THEN '[HRM_QlfUpdate].[DepartmentID] DESC'
                        WHEN 'Qlf1ID' THEN '[HRM_QlfUpdate].[Qlf1ID]'
                        WHEN 'Qlf1ID DESC' THEN '[HRM_QlfUpdate].[Qlf1ID] DESC'
                        WHEN 'Qlf1Yr' THEN '[HRM_QlfUpdate].[Qlf1Yr]'
                        WHEN 'Qlf1Yr DESC' THEN '[HRM_QlfUpdate].[Qlf1Yr] DESC'
                        WHEN 'Qlf1NotInList' THEN '[HRM_QlfUpdate].[Qlf1NotInList]'
                        WHEN 'Qlf1NotInList DESC' THEN '[HRM_QlfUpdate].[Qlf1NotInList] DESC'
                        WHEN 'Qlf1Specified' THEN '[HRM_QlfUpdate].[Qlf1Specified]'
                        WHEN 'Qlf1Specified DESC' THEN '[HRM_QlfUpdate].[Qlf1Specified] DESC'
                        WHEN 'Qlf2ID' THEN '[HRM_QlfUpdate].[Qlf2ID]'
                        WHEN 'Qlf2ID DESC' THEN '[HRM_QlfUpdate].[Qlf2ID] DESC'
                        WHEN 'Qlf2Yr' THEN '[HRM_QlfUpdate].[Qlf2Yr]'
                        WHEN 'Qlf2Yr DESC' THEN '[HRM_QlfUpdate].[Qlf2Yr] DESC'
                        WHEN 'Qlf2NotInList' THEN '[HRM_QlfUpdate].[Qlf2NotInList]'
                        WHEN 'Qlf2NotInList DESC' THEN '[HRM_QlfUpdate].[Qlf2NotInList] DESC'
                        WHEN 'Qlf2Specified' THEN '[HRM_QlfUpdate].[Qlf2Specified]'
                        WHEN 'Qlf2Specified DESC' THEN '[HRM_QlfUpdate].[Qlf2Specified] DESC'
                        WHEN 'FatherName' THEN '[HRM_QlfUpdate].[FatherName]'
                        WHEN 'FatherName DESC' THEN '[HRM_QlfUpdate].[FatherName] DESC'
                        WHEN 'DateOfBirth' THEN '[HRM_QlfUpdate].[DateOfBirth]'
                        WHEN 'DateOfBirth DESC' THEN '[HRM_QlfUpdate].[DateOfBirth] DESC'
                        WHEN 'BloodGroupID' THEN '[HRM_QlfUpdate].[BloodGroupID]'
                        WHEN 'BloodGroupID DESC' THEN '[HRM_QlfUpdate].[BloodGroupID] DESC'
                        WHEN 'N_CellNo' THEN '[HRM_QlfUpdate].[N_CellNo]'
                        WHEN 'N_CellNo DESC' THEN '[HRM_QlfUpdate].[N_CellNo] DESC'
                        WHEN 'N_Qlf1ID' THEN '[HRM_QlfUpdate].[N_Qlf1ID]'
                        WHEN 'N_Qlf1ID DESC' THEN '[HRM_QlfUpdate].[N_Qlf1ID] DESC'
                        WHEN 'N_Qlf1Yr' THEN '[HRM_QlfUpdate].[N_Qlf1Yr]'
                        WHEN 'N_Qlf1Yr DESC' THEN '[HRM_QlfUpdate].[N_Qlf1Yr] DESC'
                        WHEN 'N_Qlf2ID' THEN '[HRM_QlfUpdate].[N_Qlf2ID]'
                        WHEN 'N_Qlf2ID DESC' THEN '[HRM_QlfUpdate].[N_Qlf2ID] DESC'
                        WHEN 'N_Qlf2Yr' THEN '[HRM_QlfUpdate].[N_Qlf2Yr]'
                        WHEN 'N_Qlf2Yr DESC' THEN '[HRM_QlfUpdate].[N_Qlf2Yr] DESC'
                        WHEN 'N_FatherName' THEN '[HRM_QlfUpdate].[N_FatherName]'
                        WHEN 'N_FatherName DESC' THEN '[HRM_QlfUpdate].[N_FatherName] DESC'
                        WHEN 'N_DateOfBirth' THEN '[HRM_QlfUpdate].[N_DateOfBirth]'
                        WHEN 'N_DateOfBirth DESC' THEN '[HRM_QlfUpdate].[N_DateOfBirth] DESC'
                        WHEN 'N_BloodGroupID' THEN '[HRM_QlfUpdate].[N_BloodGroupID]'
                        WHEN 'N_BloodGroupID DESC' THEN '[HRM_QlfUpdate].[N_BloodGroupID] DESC'
                        WHEN 'sendmail' THEN '[HRM_QlfUpdate].[sendmail]'
                        WHEN 'sendmail DESC' THEN '[HRM_QlfUpdate].[sendmail] DESC'
                        WHEN 'Changed' THEN '[HRM_QlfUpdate].[Changed]'
                        WHEN 'Changed DESC' THEN '[HRM_QlfUpdate].[Changed] DESC'
                        WHEN 'Updated' THEN '[HRM_QlfUpdate].[Updated]'
                        WHEN 'Updated DESC' THEN '[HRM_QlfUpdate].[Updated] DESC'
                        WHEN 'UpdatedOn' THEN '[HRM_QlfUpdate].[UpdatedOn]'
                        WHEN 'UpdatedOn DESC' THEN '[HRM_QlfUpdate].[UpdatedOn] DESC'
                        WHEN 'HRM_Departments1_DepartmentID' THEN '[HRM_Departments1].[DepartmentID]'
                        WHEN 'HRM_Departments1_DepartmentID DESC' THEN '[HRM_Departments1].[DepartmentID] DESC'
                        WHEN 'HRM_Departments1_Description' THEN '[HRM_Departments1].[Description]'
                        WHEN 'HRM_Departments1_Description DESC' THEN '[HRM_Departments1].[Description] DESC'
                        WHEN 'HRM_Employees2_CardNo' THEN '[HRM_Employees2].[CardNo]'
                        WHEN 'HRM_Employees2_CardNo DESC' THEN '[HRM_Employees2].[CardNo] DESC'
                        WHEN 'HRM_Employees2_EmployeeName' THEN '[HRM_Employees2].[EmployeeName]'
                        WHEN 'HRM_Employees2_EmployeeName DESC' THEN '[HRM_Employees2].[EmployeeName] DESC'
                        WHEN 'HRM_Employees2_C_OfficeID' THEN '[HRM_Employees2].[C_OfficeID]'
                        WHEN 'HRM_Employees2_C_OfficeID DESC' THEN '[HRM_Employees2].[C_OfficeID] DESC'
                        WHEN 'HRM_Qualifications3_QualificationID' THEN '[HRM_Qualifications3].[QualificationID]'
                        WHEN 'HRM_Qualifications3_QualificationID DESC' THEN '[HRM_Qualifications3].[QualificationID] DESC'
                        WHEN 'HRM_Qualifications3_Description' THEN '[HRM_Qualifications3].[Description]'
                        WHEN 'HRM_Qualifications3_Description DESC' THEN '[HRM_Qualifications3].[Description] DESC'
                        WHEN 'HRM_Qualifications4_QualificationID' THEN '[HRM_Qualifications4].[QualificationID]'
                        WHEN 'HRM_Qualifications4_QualificationID DESC' THEN '[HRM_Qualifications4].[QualificationID] DESC'
                        WHEN 'HRM_Qualifications4_Description' THEN '[HRM_Qualifications4].[Description]'
                        WHEN 'HRM_Qualifications4_Description DESC' THEN '[HRM_Qualifications4].[Description] DESC'
                        ELSE '[HRM_QlfUpdate].[CardNo]'
                    END
  EXEC (@LGSQL)

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
