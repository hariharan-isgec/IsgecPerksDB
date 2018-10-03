USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmResignationsHistorySelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @Executed Bit,
  @Cancelled Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  ResignID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (ResignID) ' + 
               'SELECT [HRM_Resignations].[ResignID] FROM [HRM_Resignations] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Resignations].[CardNo] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Status] AS [HRM_Status2]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Resignations].[StatusID] = [HRM_Status2].[StatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Resignations].[ProcessedBy] = [HRM_Employees3].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [HRM_Resignations].[Executed] = ''' + CONVERT(NVarChar(10), @Executed) + ''''
  SET @LGSQL = @LGSQL + ' AND [HRM_Resignations].[Cancelled] = ''' + CONVERT(NVarChar(10), @Cancelled) + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ResignID' THEN '[HRM_Resignations].[ResignID]'
                        WHEN 'ResignID DESC' THEN '[HRM_Resignations].[ResignID] DESC'
                        WHEN 'CardNo' THEN '[HRM_Resignations].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[HRM_Resignations].[CardNo] DESC'
                        WHEN 'StatusID' THEN '[HRM_Resignations].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[HRM_Resignations].[StatusID] DESC'
                        WHEN 'ResignedOn' THEN '[HRM_Resignations].[ResignedOn]'
                        WHEN 'ResignedOn DESC' THEN '[HRM_Resignations].[ResignedOn] DESC'
                        WHEN 'ReleavedOn' THEN '[HRM_Resignations].[ReleavedOn]'
                        WHEN 'ReleavedOn DESC' THEN '[HRM_Resignations].[ReleavedOn] DESC'
                        WHEN 'Remarks' THEN '[HRM_Resignations].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[HRM_Resignations].[Remarks] DESC'
                        WHEN 'Executed' THEN '[HRM_Resignations].[Executed]'
                        WHEN 'Executed DESC' THEN '[HRM_Resignations].[Executed] DESC'
                        WHEN 'Cancelled' THEN '[HRM_Resignations].[Cancelled]'
                        WHEN 'Cancelled DESC' THEN '[HRM_Resignations].[Cancelled] DESC'
                        WHEN 'ProcessedBy' THEN '[HRM_Resignations].[ProcessedBy]'
                        WHEN 'ProcessedBy DESC' THEN '[HRM_Resignations].[ProcessedBy] DESC'
                        WHEN 'ProcessedOn' THEN '[HRM_Resignations].[ProcessedOn]'
                        WHEN 'ProcessedOn DESC' THEN '[HRM_Resignations].[ProcessedOn] DESC'
                        WHEN 'HRM_Employees1_CardNo' THEN '[HRM_Employees1].[CardNo]'
                        WHEN 'HRM_Employees1_CardNo DESC' THEN '[HRM_Employees1].[CardNo] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'HRM_Employees1_C_DateOfJoining' THEN '[HRM_Employees1].[C_DateOfJoining]'
                        WHEN 'HRM_Employees1_C_DateOfJoining DESC' THEN '[HRM_Employees1].[C_DateOfJoining] DESC'
                        WHEN 'HRM_Employees1_C_CompanyID' THEN '[HRM_Employees1].[C_CompanyID]'
                        WHEN 'HRM_Employees1_C_CompanyID DESC' THEN '[HRM_Employees1].[C_CompanyID] DESC'
                        WHEN 'HRM_Employees1_C_DivisionID' THEN '[HRM_Employees1].[C_DivisionID]'
                        WHEN 'HRM_Employees1_C_DivisionID DESC' THEN '[HRM_Employees1].[C_DivisionID] DESC'
                        WHEN 'HRM_Employees1_C_OfficeID' THEN '[HRM_Employees1].[C_OfficeID]'
                        WHEN 'HRM_Employees1_C_OfficeID DESC' THEN '[HRM_Employees1].[C_OfficeID] DESC'
                        WHEN 'HRM_Employees1_C_DepartmentID' THEN '[HRM_Employees1].[C_DepartmentID]'
                        WHEN 'HRM_Employees1_C_DepartmentID DESC' THEN '[HRM_Employees1].[C_DepartmentID] DESC'
                        WHEN 'HRM_Employees1_C_ProjectSiteID' THEN '[HRM_Employees1].[C_ProjectSiteID]'
                        WHEN 'HRM_Employees1_C_ProjectSiteID DESC' THEN '[HRM_Employees1].[C_ProjectSiteID] DESC'
                        WHEN 'HRM_Employees1_C_DesignationID' THEN '[HRM_Employees1].[C_DesignationID]'
                        WHEN 'HRM_Employees1_C_DesignationID DESC' THEN '[HRM_Employees1].[C_DesignationID] DESC'
                        WHEN 'HRM_Employees1_ActiveState' THEN '[HRM_Employees1].[ActiveState]'
                        WHEN 'HRM_Employees1_ActiveState DESC' THEN '[HRM_Employees1].[ActiveState] DESC'
                        WHEN 'HRM_Status2_StatusID' THEN '[HRM_Status2].[StatusID]'
                        WHEN 'HRM_Status2_StatusID DESC' THEN '[HRM_Status2].[StatusID] DESC'
                        WHEN 'HRM_Status2_Description' THEN '[HRM_Status2].[Description]'
                        WHEN 'HRM_Status2_Description DESC' THEN '[HRM_Status2].[Description] DESC'
                        WHEN 'HRM_Status2_Sequence' THEN '[HRM_Status2].[Sequence]'
                        WHEN 'HRM_Status2_Sequence DESC' THEN '[HRM_Status2].[Sequence] DESC'
                        WHEN 'HRM_Employees3_CardNo' THEN '[HRM_Employees3].[CardNo]'
                        WHEN 'HRM_Employees3_CardNo DESC' THEN '[HRM_Employees3].[CardNo] DESC'
                        WHEN 'HRM_Employees3_EmployeeName' THEN '[HRM_Employees3].[EmployeeName]'
                        WHEN 'HRM_Employees3_EmployeeName DESC' THEN '[HRM_Employees3].[EmployeeName] DESC'
                        WHEN 'HRM_Employees3_C_DateOfJoining' THEN '[HRM_Employees3].[C_DateOfJoining]'
                        WHEN 'HRM_Employees3_C_DateOfJoining DESC' THEN '[HRM_Employees3].[C_DateOfJoining] DESC'
                        WHEN 'HRM_Employees3_C_CompanyID' THEN '[HRM_Employees3].[C_CompanyID]'
                        WHEN 'HRM_Employees3_C_CompanyID DESC' THEN '[HRM_Employees3].[C_CompanyID] DESC'
                        WHEN 'HRM_Employees3_C_DivisionID' THEN '[HRM_Employees3].[C_DivisionID]'
                        WHEN 'HRM_Employees3_C_DivisionID DESC' THEN '[HRM_Employees3].[C_DivisionID] DESC'
                        WHEN 'HRM_Employees3_C_OfficeID' THEN '[HRM_Employees3].[C_OfficeID]'
                        WHEN 'HRM_Employees3_C_OfficeID DESC' THEN '[HRM_Employees3].[C_OfficeID] DESC'
                        WHEN 'HRM_Employees3_C_DepartmentID' THEN '[HRM_Employees3].[C_DepartmentID]'
                        WHEN 'HRM_Employees3_C_DepartmentID DESC' THEN '[HRM_Employees3].[C_DepartmentID] DESC'
                        WHEN 'HRM_Employees3_C_ProjectSiteID' THEN '[HRM_Employees3].[C_ProjectSiteID]'
                        WHEN 'HRM_Employees3_C_ProjectSiteID DESC' THEN '[HRM_Employees3].[C_ProjectSiteID] DESC'
                        WHEN 'HRM_Employees3_C_DesignationID' THEN '[HRM_Employees3].[C_DesignationID]'
                        WHEN 'HRM_Employees3_C_DesignationID DESC' THEN '[HRM_Employees3].[C_DesignationID] DESC'
                        WHEN 'HRM_Employees3_ActiveState' THEN '[HRM_Employees3].[ActiveState]'
                        WHEN 'HRM_Employees3_ActiveState DESC' THEN '[HRM_Employees3].[ActiveState] DESC'
                        ELSE '[HRM_Resignations].[ResignID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [HRM_Resignations].[ResignID] = #PageIndex.ResignID
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Resignations].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [HRM_Status] AS [HRM_Status2]
    ON [HRM_Resignations].[StatusID] = [HRM_Status2].[StatusID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [HRM_Resignations].[ProcessedBy] = [HRM_Employees3].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
