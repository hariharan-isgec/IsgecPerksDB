USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrm_LG_TransfersHistorySelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @Executed Bit,
  @Cancelled Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  TransferID Int NOT NULL
  )
  INSERT INTO #PageIndex (TransferID)
  SELECT [HRM_Transfers].[TransferID] FROM [HRM_Transfers]
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Transfers].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [HRM_Companies] AS [HRM_Companies2]
    ON [HRM_Transfers].[CompanyID] = [HRM_Companies2].[CompanyID]
  INNER JOIN [HRM_Divisions] AS [HRM_Divisions3]
    ON [HRM_Transfers].[DivisionID] = [HRM_Divisions3].[DivisionID]
  INNER JOIN [HRM_Offices] AS [HRM_Offices4]
    ON [HRM_Transfers].[OfficeID] = [HRM_Offices4].[OfficeID]
  INNER JOIN [HRM_Departments] AS [HRM_Departments5]
    ON [HRM_Transfers].[DepartmentID] = [HRM_Departments5].[DepartmentID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees6]
    ON [HRM_Transfers].[ProcessedBy] = [HRM_Employees6].[CardNo]
 WHERE [HRM_Transfers].[OfficeID] = 6 AND [HRM_Transfers].[VerifiedBy] IS NULL  
   AND [HRM_Transfers].[Executed] = @Executed
   AND [HRM_Transfers].[Cancelled] = @Cancelled
   AND ( 
         STR(ISNULL([HRM_Transfers].[TransferID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Transfers].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Transfers].[CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Transfers].[DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Transfers].[OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Transfers].[DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Transfers].[ProjectSiteID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Transfers].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Transfers].[ProcessedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees1].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_ProjectSiteID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees1].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies2].[CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies2].[ShortName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies2].[BaaNID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Divisions3].[DivisionID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Divisions3].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices4].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices4].[Address],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices4].[City],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Departments5].[DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Departments5].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees6].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees6].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees6].[C_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees6].[C_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees6].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees6].[C_DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees6].[C_ProjectSiteID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees6].[C_DesignationID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'TransferID' THEN [HRM_Transfers].[TransferID] END,
     CASE @orderBy WHEN 'TransferID DESC' THEN [HRM_Transfers].[TransferID] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [HRM_Transfers].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [HRM_Transfers].[CardNo] END DESC,
     CASE @orderBy WHEN 'CompanyID' THEN [HRM_Transfers].[CompanyID] END,
     CASE @orderBy WHEN 'CompanyID DESC' THEN [HRM_Transfers].[CompanyID] END DESC,
     CASE @orderBy WHEN 'DivisionID' THEN [HRM_Transfers].[DivisionID] END,
     CASE @orderBy WHEN 'DivisionID DESC' THEN [HRM_Transfers].[DivisionID] END DESC,
     CASE @orderBy WHEN 'OfficeID' THEN [HRM_Transfers].[OfficeID] END,
     CASE @orderBy WHEN 'OfficeID DESC' THEN [HRM_Transfers].[OfficeID] END DESC,
     CASE @orderBy WHEN 'DepartmentID' THEN [HRM_Transfers].[DepartmentID] END,
     CASE @orderBy WHEN 'DepartmentID DESC' THEN [HRM_Transfers].[DepartmentID] END DESC,
     CASE @orderBy WHEN 'ProjectSiteID' THEN [HRM_Transfers].[ProjectSiteID] END,
     CASE @orderBy WHEN 'ProjectSiteID DESC' THEN [HRM_Transfers].[ProjectSiteID] END DESC,
     CASE @orderBy WHEN 'TransferedOn' THEN [HRM_Transfers].[TransferedOn] END,
     CASE @orderBy WHEN 'TransferedOn DESC' THEN [HRM_Transfers].[TransferedOn] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [HRM_Transfers].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [HRM_Transfers].[Remarks] END DESC,
     CASE @orderBy WHEN 'ActiveState' THEN [HRM_Transfers].[ActiveState] END,
     CASE @orderBy WHEN 'ActiveState DESC' THEN [HRM_Transfers].[ActiveState] END DESC,
     CASE @orderBy WHEN 'Executed' THEN [HRM_Transfers].[Executed] END,
     CASE @orderBy WHEN 'Executed DESC' THEN [HRM_Transfers].[Executed] END DESC,
     CASE @orderBy WHEN 'Cancelled' THEN [HRM_Transfers].[Cancelled] END,
     CASE @orderBy WHEN 'Cancelled DESC' THEN [HRM_Transfers].[Cancelled] END DESC,
     CASE @orderBy WHEN 'ProcessedBy' THEN [HRM_Transfers].[ProcessedBy] END,
     CASE @orderBy WHEN 'ProcessedBy DESC' THEN [HRM_Transfers].[ProcessedBy] END DESC,
     CASE @orderBy WHEN 'ProcessedOn' THEN [HRM_Transfers].[ProcessedOn] END,
     CASE @orderBy WHEN 'ProcessedOn DESC' THEN [HRM_Transfers].[ProcessedOn] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo' THEN [HRM_Employees1].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo DESC' THEN [HRM_Employees1].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_DateOfJoining' THEN [HRM_Employees1].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_DateOfJoining DESC' THEN [HRM_Employees1].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_CompanyID' THEN [HRM_Employees1].[C_CompanyID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_CompanyID DESC' THEN [HRM_Employees1].[C_CompanyID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_DivisionID' THEN [HRM_Employees1].[C_DivisionID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_DivisionID DESC' THEN [HRM_Employees1].[C_DivisionID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_OfficeID' THEN [HRM_Employees1].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_OfficeID DESC' THEN [HRM_Employees1].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_DepartmentID' THEN [HRM_Employees1].[C_DepartmentID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_DepartmentID DESC' THEN [HRM_Employees1].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_ProjectSiteID' THEN [HRM_Employees1].[C_ProjectSiteID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_ProjectSiteID DESC' THEN [HRM_Employees1].[C_ProjectSiteID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_DesignationID' THEN [HRM_Employees1].[C_DesignationID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_DesignationID DESC' THEN [HRM_Employees1].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_ActiveState' THEN [HRM_Employees1].[ActiveState] END,
     CASE @orderBy WHEN 'HRM_Employees1_ActiveState DESC' THEN [HRM_Employees1].[ActiveState] END DESC,
     CASE @orderBy WHEN 'HRM_Companies2_CompanyID' THEN [HRM_Companies2].[CompanyID] END,
     CASE @orderBy WHEN 'HRM_Companies2_CompanyID DESC' THEN [HRM_Companies2].[CompanyID] END DESC,
     CASE @orderBy WHEN 'HRM_Companies2_Description' THEN [HRM_Companies2].[Description] END,
     CASE @orderBy WHEN 'HRM_Companies2_Description DESC' THEN [HRM_Companies2].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Companies2_ShortName' THEN [HRM_Companies2].[ShortName] END,
     CASE @orderBy WHEN 'HRM_Companies2_ShortName DESC' THEN [HRM_Companies2].[ShortName] END DESC,
     CASE @orderBy WHEN 'HRM_Companies2_BaaNID' THEN [HRM_Companies2].[BaaNID] END,
     CASE @orderBy WHEN 'HRM_Companies2_BaaNID DESC' THEN [HRM_Companies2].[BaaNID] END DESC,
     CASE @orderBy WHEN 'HRM_Divisions3_DivisionID' THEN [HRM_Divisions3].[DivisionID] END,
     CASE @orderBy WHEN 'HRM_Divisions3_DivisionID DESC' THEN [HRM_Divisions3].[DivisionID] END DESC,
     CASE @orderBy WHEN 'HRM_Divisions3_Description' THEN [HRM_Divisions3].[Description] END,
     CASE @orderBy WHEN 'HRM_Divisions3_Description DESC' THEN [HRM_Divisions3].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices4_OfficeID' THEN [HRM_Offices4].[OfficeID] END,
     CASE @orderBy WHEN 'HRM_Offices4_OfficeID DESC' THEN [HRM_Offices4].[OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Offices4_Description' THEN [HRM_Offices4].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices4_Description DESC' THEN [HRM_Offices4].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices4_Address' THEN [HRM_Offices4].[Address] END,
     CASE @orderBy WHEN 'HRM_Offices4_Address DESC' THEN [HRM_Offices4].[Address] END DESC,
     CASE @orderBy WHEN 'HRM_Offices4_City' THEN [HRM_Offices4].[City] END,
     CASE @orderBy WHEN 'HRM_Offices4_City DESC' THEN [HRM_Offices4].[City] END DESC,
     CASE @orderBy WHEN 'HRM_Departments5_DepartmentID' THEN [HRM_Departments5].[DepartmentID] END,
     CASE @orderBy WHEN 'HRM_Departments5_DepartmentID DESC' THEN [HRM_Departments5].[DepartmentID] END DESC,
     CASE @orderBy WHEN 'HRM_Departments5_Description' THEN [HRM_Departments5].[Description] END,
     CASE @orderBy WHEN 'HRM_Departments5_Description DESC' THEN [HRM_Departments5].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Employees6_CardNo' THEN [HRM_Employees6].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees6_CardNo DESC' THEN [HRM_Employees6].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees6_EmployeeName' THEN [HRM_Employees6].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees6_EmployeeName DESC' THEN [HRM_Employees6].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees6_C_DateOfJoining' THEN [HRM_Employees6].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'HRM_Employees6_C_DateOfJoining DESC' THEN [HRM_Employees6].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'HRM_Employees6_C_CompanyID' THEN [HRM_Employees6].[C_CompanyID] END,
     CASE @orderBy WHEN 'HRM_Employees6_C_CompanyID DESC' THEN [HRM_Employees6].[C_CompanyID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees6_C_DivisionID' THEN [HRM_Employees6].[C_DivisionID] END,
     CASE @orderBy WHEN 'HRM_Employees6_C_DivisionID DESC' THEN [HRM_Employees6].[C_DivisionID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees6_C_OfficeID' THEN [HRM_Employees6].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees6_C_OfficeID DESC' THEN [HRM_Employees6].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees6_C_DepartmentID' THEN [HRM_Employees6].[C_DepartmentID] END,
     CASE @orderBy WHEN 'HRM_Employees6_C_DepartmentID DESC' THEN [HRM_Employees6].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees6_C_ProjectSiteID' THEN [HRM_Employees6].[C_ProjectSiteID] END,
     CASE @orderBy WHEN 'HRM_Employees6_C_ProjectSiteID DESC' THEN [HRM_Employees6].[C_ProjectSiteID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees6_C_DesignationID' THEN [HRM_Employees6].[C_DesignationID] END,
     CASE @orderBy WHEN 'HRM_Employees6_C_DesignationID DESC' THEN [HRM_Employees6].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees6_ActiveState' THEN [HRM_Employees6].[ActiveState] END,
     CASE @orderBy WHEN 'HRM_Employees6_ActiveState DESC' THEN [HRM_Employees6].[ActiveState] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_Transfers].[TransferID],
		[HRM_Transfers].[CardNo],
		[HRM_Transfers].[CompanyID],
		[HRM_Transfers].[DivisionID],
		[HRM_Transfers].[OfficeID],
		[HRM_Transfers].[DepartmentID],
		[HRM_Transfers].[ProjectSiteID],
		[HRM_Transfers].[TransferedOn],
		[HRM_Transfers].[Remarks],
		[HRM_Transfers].[ActiveState],
		[HRM_Transfers].[Executed],
		[HRM_Transfers].[Cancelled],
		[HRM_Transfers].[ProcessedBy],
		[HRM_Transfers].[ProcessedOn],
		[HRM_Transfers].[VerifiedBy],
		[HRM_Transfers].[VerifiedOn],
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
		[HRM_Companies2].[CompanyID] AS HRM_Companies2_CompanyID,
		[HRM_Companies2].[Description] AS HRM_Companies2_Description,
		[HRM_Companies2].[ShortName] AS HRM_Companies2_ShortName,
		[HRM_Companies2].[BaaNID] AS HRM_Companies2_BaaNID,
		[HRM_Divisions3].[DivisionID] AS HRM_Divisions3_DivisionID,
		[HRM_Divisions3].[Description] AS HRM_Divisions3_Description,
		[HRM_Offices4].[OfficeID] AS HRM_Offices4_OfficeID,
		[HRM_Offices4].[Description] AS HRM_Offices4_Description,
		[HRM_Offices4].[Address] AS HRM_Offices4_Address,
		[HRM_Offices4].[City] AS HRM_Offices4_City,
		[HRM_Departments5].[DepartmentID] AS HRM_Departments5_DepartmentID,
		[HRM_Departments5].[Description] AS HRM_Departments5_Description,
		[HRM_Employees6].[CardNo] AS HRM_Employees6_CardNo,
		[HRM_Employees6].[EmployeeName] AS HRM_Employees6_EmployeeName,
		[HRM_Employees6].[C_DateOfJoining] AS HRM_Employees6_C_DateOfJoining,
		[HRM_Employees6].[C_CompanyID] AS HRM_Employees6_C_CompanyID,
		[HRM_Employees6].[C_DivisionID] AS HRM_Employees6_C_DivisionID,
		[HRM_Employees6].[C_OfficeID] AS HRM_Employees6_C_OfficeID,
		[HRM_Employees6].[C_DepartmentID] AS HRM_Employees6_C_DepartmentID,
		[HRM_Employees6].[C_ProjectSiteID] AS HRM_Employees6_C_ProjectSiteID,
		[HRM_Employees6].[C_DesignationID] AS HRM_Employees6_C_DesignationID,
		[HRM_Employees6].[ActiveState] AS HRM_Employees6_ActiveState 
  FROM [HRM_Transfers] 
    	INNER JOIN #PageIndex
          ON [HRM_Transfers].[TransferID] = #PageIndex.TransferID
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Transfers].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [HRM_Companies] AS [HRM_Companies2]
    ON [HRM_Transfers].[CompanyID] = [HRM_Companies2].[CompanyID]
  INNER JOIN [HRM_Divisions] AS [HRM_Divisions3]
    ON [HRM_Transfers].[DivisionID] = [HRM_Divisions3].[DivisionID]
  INNER JOIN [HRM_Offices] AS [HRM_Offices4]
    ON [HRM_Transfers].[OfficeID] = [HRM_Offices4].[OfficeID]
  INNER JOIN [HRM_Departments] AS [HRM_Departments5]
    ON [HRM_Transfers].[DepartmentID] = [HRM_Departments5].[DepartmentID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees6]
    ON [HRM_Transfers].[ProcessedBy] = [HRM_Employees6].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
