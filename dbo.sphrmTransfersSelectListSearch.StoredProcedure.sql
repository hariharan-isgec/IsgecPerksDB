USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmTransfersSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @U_UnderTransfer Bit,
  @Resigned Bit,
  @ActiveState Bit,
  @Confirmed Bit,
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
  INNER JOIN [HRM_Designations] AS [HRM_Designations1]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations1].[DesignationID]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies2]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies2].[CompanyID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions3]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions3].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices4]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices4].[OfficeID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments5]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments5].[DepartmentID]
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects6]
    ON [HRM_Employees].[C_ProjectSiteID] = [DCM_Projects6].[ProjectCode]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies7]
    ON [HRM_Employees].[U_CompanyID] = [HRM_Companies7].[CompanyID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions8]
    ON [HRM_Employees].[U_DivisionID] = [HRM_Divisions8].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices9]
    ON [HRM_Employees].[U_OfficeID] = [HRM_Offices9].[OfficeID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments10]
    ON [HRM_Employees].[U_DepartmentID] = [HRM_Departments10].[DepartmentID]
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects11]
    ON [HRM_Employees].[U_ProjectSiteID] = [DCM_Projects11].[ProjectCode]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users12]
    ON [HRM_Employees].[ModifiedBy] = [aspnet_Users12].[UserName]
 WHERE  
      [HRM_Employees].[U_UnderTransfer] = @U_UnderTransfer
  AND [HRM_Employees].[Resigned] = @Resigned
  AND [HRM_Employees].[ActiveState] = @ActiveState
  --AND [HRM_Employees].[Confirmed] = @Confirmed
   AND ( 
         LOWER(ISNULL([HRM_Employees].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_ProjectSiteID],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Employees].[U_CompanyID],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Employees].[U_DivisionID],'')) LIKE @KeyWord1
--     OR STR(ISNULL([HRM_Employees].[U_OfficeID], 0)) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Employees].[U_DepartmentID],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Employees].[U_ProjectSiteID],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Employees].[C_TransferRemark],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Employees].[ModifiedBy],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Employees].[ModifiedEvent],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Employees].[ActiveStateEventName],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Designations1].[Description],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Designations1].[ShortName],'')) LIKE @KeyWord1
--     OR STR(ISNULL([HRM_Designations1].[Sequence], 0)) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Companies2].[CompanyID],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Companies2].[Description],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Companies2].[ShortName],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Companies2].[BaaNID],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Divisions3].[DivisionID],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Divisions3].[Description],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Offices4].[Description],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Offices4].[Address],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Offices4].[City],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Departments5].[DepartmentID],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Departments5].[Description],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([DCM_Projects6].[ProjectCode],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([DCM_Projects6].[Description],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Companies7].[CompanyID],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Companies7].[Description],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Companies7].[ShortName],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Companies7].[BaaNID],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Divisions8].[DivisionID],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Divisions8].[Description],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Offices9].[Description],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Offices9].[Address],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Offices9].[City],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Departments10].[DepartmentID],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Departments10].[Description],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([DCM_Projects11].[ProjectCode],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([DCM_Projects11].[Description],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([aspnet_Users12].[UserName],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([aspnet_Users12].[UserFullName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CardNo' THEN [HRM_Employees].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [HRM_Employees].[CardNo] END DESC,
     CASE @orderBy WHEN 'EmployeeName' THEN [HRM_Employees].[EmployeeName] END,
     CASE @orderBy WHEN 'EmployeeName DESC' THEN [HRM_Employees].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'C_DateOfJoining' THEN [HRM_Employees].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'C_DateOfJoining DESC' THEN [HRM_Employees].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'C_DesignationID' THEN [HRM_Employees].[C_DesignationID] END,
     CASE @orderBy WHEN 'C_DesignationID DESC' THEN [HRM_Employees].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'C_CompanyID' THEN [HRM_Employees].[C_CompanyID] END,
     CASE @orderBy WHEN 'C_CompanyID DESC' THEN [HRM_Employees].[C_CompanyID] END DESC,
     CASE @orderBy WHEN 'C_DivisionID' THEN [HRM_Employees].[C_DivisionID] END,
     CASE @orderBy WHEN 'C_DivisionID DESC' THEN [HRM_Employees].[C_DivisionID] END DESC,
     CASE @orderBy WHEN 'C_OfficeID' THEN [HRM_Employees].[C_OfficeID] END,
     CASE @orderBy WHEN 'C_OfficeID DESC' THEN [HRM_Employees].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'C_DepartmentID' THEN [HRM_Employees].[C_DepartmentID] END,
     CASE @orderBy WHEN 'C_DepartmentID DESC' THEN [HRM_Employees].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'C_ProjectSiteID' THEN [HRM_Employees].[C_ProjectSiteID] END,
     CASE @orderBy WHEN 'C_ProjectSiteID DESC' THEN [HRM_Employees].[C_ProjectSiteID] END DESC,
     CASE @orderBy WHEN 'U_UnderTransfer' THEN [HRM_Employees].[U_UnderTransfer] END,
     CASE @orderBy WHEN 'U_UnderTransfer DESC' THEN [HRM_Employees].[U_UnderTransfer] END DESC,
     CASE @orderBy WHEN 'U_CompanyID' THEN [HRM_Employees].[U_CompanyID] END,
     CASE @orderBy WHEN 'U_CompanyID DESC' THEN [HRM_Employees].[U_CompanyID] END DESC,
     CASE @orderBy WHEN 'U_DivisionID' THEN [HRM_Employees].[U_DivisionID] END,
     CASE @orderBy WHEN 'U_DivisionID DESC' THEN [HRM_Employees].[U_DivisionID] END DESC,
     CASE @orderBy WHEN 'U_OfficeID' THEN [HRM_Employees].[U_OfficeID] END,
     CASE @orderBy WHEN 'U_OfficeID DESC' THEN [HRM_Employees].[U_OfficeID] END DESC,
     CASE @orderBy WHEN 'U_DepartmentID' THEN [HRM_Employees].[U_DepartmentID] END,
     CASE @orderBy WHEN 'U_DepartmentID DESC' THEN [HRM_Employees].[U_DepartmentID] END DESC,
     CASE @orderBy WHEN 'U_ProjectSiteID' THEN [HRM_Employees].[U_ProjectSiteID] END,
     CASE @orderBy WHEN 'U_ProjectSiteID DESC' THEN [HRM_Employees].[U_ProjectSiteID] END DESC,
     CASE @orderBy WHEN 'U_ActiveState' THEN [HRM_Employees].[U_ActiveState] END,
     CASE @orderBy WHEN 'U_ActiveState DESC' THEN [HRM_Employees].[U_ActiveState] END DESC,
     CASE @orderBy WHEN 'C_TransferedOn' THEN [HRM_Employees].[C_TransferedOn] END,
     CASE @orderBy WHEN 'C_TransferedOn DESC' THEN [HRM_Employees].[C_TransferedOn] END DESC,
     CASE @orderBy WHEN 'C_TransferRemark' THEN [HRM_Employees].[C_TransferRemark] END,
     CASE @orderBy WHEN 'C_TransferRemark DESC' THEN [HRM_Employees].[C_TransferRemark] END DESC,
     CASE @orderBy WHEN 'Resigned' THEN [HRM_Employees].[Resigned] END,
     CASE @orderBy WHEN 'Resigned DESC' THEN [HRM_Employees].[Resigned] END DESC,
     CASE @orderBy WHEN 'ActiveState' THEN [HRM_Employees].[ActiveState] END,
     CASE @orderBy WHEN 'ActiveState DESC' THEN [HRM_Employees].[ActiveState] END DESC,
     CASE @orderBy WHEN 'Confirmed' THEN [HRM_Employees].[Confirmed] END,
     CASE @orderBy WHEN 'Confirmed DESC' THEN [HRM_Employees].[Confirmed] END DESC,
     CASE @orderBy WHEN 'ModifiedBy' THEN [HRM_Employees].[ModifiedBy] END,
     CASE @orderBy WHEN 'ModifiedBy DESC' THEN [HRM_Employees].[ModifiedBy] END DESC,
     CASE @orderBy WHEN 'ModifiedOn' THEN [HRM_Employees].[ModifiedOn] END,
     CASE @orderBy WHEN 'ModifiedOn DESC' THEN [HRM_Employees].[ModifiedOn] END DESC,
     CASE @orderBy WHEN 'ModifiedEvent' THEN [HRM_Employees].[ModifiedEvent] END,
     CASE @orderBy WHEN 'ModifiedEvent DESC' THEN [HRM_Employees].[ModifiedEvent] END DESC,
     CASE @orderBy WHEN 'ActiveStateEventName' THEN [HRM_Employees].[ActiveStateEventName] END,
     CASE @orderBy WHEN 'ActiveStateEventName DESC' THEN [HRM_Employees].[ActiveStateEventName] END DESC,
     CASE @orderBy WHEN 'HRM_Designations1_DesignationID' THEN [HRM_Designations1].[DesignationID] END,
     CASE @orderBy WHEN 'HRM_Designations1_DesignationID DESC' THEN [HRM_Designations1].[DesignationID] END DESC,
     CASE @orderBy WHEN 'HRM_Designations1_Description' THEN [HRM_Designations1].[Description] END,
     CASE @orderBy WHEN 'HRM_Designations1_Description DESC' THEN [HRM_Designations1].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations1_ShortName' THEN [HRM_Designations1].[ShortName] END,
     CASE @orderBy WHEN 'HRM_Designations1_ShortName DESC' THEN [HRM_Designations1].[ShortName] END DESC,
     CASE @orderBy WHEN 'HRM_Designations1_Sequence' THEN [HRM_Designations1].[Sequence] END,
     CASE @orderBy WHEN 'HRM_Designations1_Sequence DESC' THEN [HRM_Designations1].[Sequence] END DESC,
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
     CASE @orderBy WHEN 'DCM_Projects6_ProjectCode' THEN [DCM_Projects6].[ProjectCode] END,
     CASE @orderBy WHEN 'DCM_Projects6_ProjectCode DESC' THEN [DCM_Projects6].[ProjectCode] END DESC,
     CASE @orderBy WHEN 'DCM_Projects6_Description' THEN [DCM_Projects6].[Description] END,
     CASE @orderBy WHEN 'DCM_Projects6_Description DESC' THEN [DCM_Projects6].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Companies7_CompanyID' THEN [HRM_Companies7].[CompanyID] END,
     CASE @orderBy WHEN 'HRM_Companies7_CompanyID DESC' THEN [HRM_Companies7].[CompanyID] END DESC,
     CASE @orderBy WHEN 'HRM_Companies7_Description' THEN [HRM_Companies7].[Description] END,
     CASE @orderBy WHEN 'HRM_Companies7_Description DESC' THEN [HRM_Companies7].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Companies7_ShortName' THEN [HRM_Companies7].[ShortName] END,
     CASE @orderBy WHEN 'HRM_Companies7_ShortName DESC' THEN [HRM_Companies7].[ShortName] END DESC,
     CASE @orderBy WHEN 'HRM_Companies7_BaaNID' THEN [HRM_Companies7].[BaaNID] END,
     CASE @orderBy WHEN 'HRM_Companies7_BaaNID DESC' THEN [HRM_Companies7].[BaaNID] END DESC,
     CASE @orderBy WHEN 'HRM_Divisions8_DivisionID' THEN [HRM_Divisions8].[DivisionID] END,
     CASE @orderBy WHEN 'HRM_Divisions8_DivisionID DESC' THEN [HRM_Divisions8].[DivisionID] END DESC,
     CASE @orderBy WHEN 'HRM_Divisions8_Description' THEN [HRM_Divisions8].[Description] END,
     CASE @orderBy WHEN 'HRM_Divisions8_Description DESC' THEN [HRM_Divisions8].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices9_OfficeID' THEN [HRM_Offices9].[OfficeID] END,
     CASE @orderBy WHEN 'HRM_Offices9_OfficeID DESC' THEN [HRM_Offices9].[OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Offices9_Description' THEN [HRM_Offices9].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices9_Description DESC' THEN [HRM_Offices9].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices9_Address' THEN [HRM_Offices9].[Address] END,
     CASE @orderBy WHEN 'HRM_Offices9_Address DESC' THEN [HRM_Offices9].[Address] END DESC,
     CASE @orderBy WHEN 'HRM_Offices9_City' THEN [HRM_Offices9].[City] END,
     CASE @orderBy WHEN 'HRM_Offices9_City DESC' THEN [HRM_Offices9].[City] END DESC,
     CASE @orderBy WHEN 'HRM_Departments10_DepartmentID' THEN [HRM_Departments10].[DepartmentID] END,
     CASE @orderBy WHEN 'HRM_Departments10_DepartmentID DESC' THEN [HRM_Departments10].[DepartmentID] END DESC,
     CASE @orderBy WHEN 'HRM_Departments10_Description' THEN [HRM_Departments10].[Description] END,
     CASE @orderBy WHEN 'HRM_Departments10_Description DESC' THEN [HRM_Departments10].[Description] END DESC,
     CASE @orderBy WHEN 'DCM_Projects11_ProjectCode' THEN [DCM_Projects11].[ProjectCode] END,
     CASE @orderBy WHEN 'DCM_Projects11_ProjectCode DESC' THEN [DCM_Projects11].[ProjectCode] END DESC,
     CASE @orderBy WHEN 'DCM_Projects11_Description' THEN [DCM_Projects11].[Description] END,
     CASE @orderBy WHEN 'DCM_Projects11_Description DESC' THEN [DCM_Projects11].[Description] END DESC,
     CASE @orderBy WHEN 'aspnet_Users12_UserName' THEN [aspnet_Users12].[UserName] END,
     CASE @orderBy WHEN 'aspnet_Users12_UserName DESC' THEN [aspnet_Users12].[UserName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users12_UserFullName' THEN [aspnet_Users12].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users12_UserFullName DESC' THEN [aspnet_Users12].[UserFullName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_Employees].[CardNo],
		[HRM_Employees].[EmployeeName],
		[HRM_Employees].[C_DateOfJoining],
		[HRM_Employees].[C_DesignationID],
		[HRM_Employees].[C_CompanyID],
		[HRM_Employees].[C_DivisionID],
		[HRM_Employees].[C_OfficeID],
		[HRM_Employees].[C_DepartmentID],
		[HRM_Employees].[C_ProjectSiteID],
		[HRM_Employees].[U_UnderTransfer],
		[HRM_Employees].[U_CompanyID],
		[HRM_Employees].[U_DivisionID],
		[HRM_Employees].[U_OfficeID],
		[HRM_Employees].[U_DepartmentID],
		[HRM_Employees].[U_ProjectSiteID],
		[HRM_Employees].[U_ActiveState],
		[HRM_Employees].[C_TransferedOn],
		[HRM_Employees].[C_TransferRemark],
		[HRM_Employees].[Resigned],
		[HRM_Employees].[ActiveState],
		[HRM_Employees].[Confirmed],
		[HRM_Employees].[ModifiedBy],
		[HRM_Employees].[ModifiedOn],
		[HRM_Employees].[ModifiedEvent],
		[HRM_Employees].[ActiveStateEventName],
		[HRM_Designations1].[DesignationID] AS HRM_Designations1_DesignationID,
		[HRM_Designations1].[Description] AS HRM_Designations1_Description,
		[HRM_Designations1].[ShortName] AS HRM_Designations1_ShortName,
		[HRM_Designations1].[Sequence] AS HRM_Designations1_Sequence,
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
		[DCM_Projects6].[ProjectCode] AS DCM_Projects6_ProjectCode,
		[DCM_Projects6].[Description] AS DCM_Projects6_Description,
		[HRM_Companies7].[CompanyID] AS HRM_Companies7_CompanyID,
		[HRM_Companies7].[Description] AS HRM_Companies7_Description,
		[HRM_Companies7].[ShortName] AS HRM_Companies7_ShortName,
		[HRM_Companies7].[BaaNID] AS HRM_Companies7_BaaNID,
		[HRM_Divisions8].[DivisionID] AS HRM_Divisions8_DivisionID,
		[HRM_Divisions8].[Description] AS HRM_Divisions8_Description,
		[HRM_Offices9].[OfficeID] AS HRM_Offices9_OfficeID,
		[HRM_Offices9].[Description] AS HRM_Offices9_Description,
		[HRM_Offices9].[Address] AS HRM_Offices9_Address,
		[HRM_Offices9].[City] AS HRM_Offices9_City,
		[HRM_Departments10].[DepartmentID] AS HRM_Departments10_DepartmentID,
		[HRM_Departments10].[Description] AS HRM_Departments10_Description,
		[DCM_Projects11].[ProjectCode] AS DCM_Projects11_ProjectCode,
		[DCM_Projects11].[Description] AS DCM_Projects11_Description,
		[aspnet_Users12].[UserName] AS aspnet_Users12_UserName,
		[aspnet_Users12].[UserFullName] AS aspnet_Users12_UserFullName 
  FROM [HRM_Employees] 
    	INNER JOIN #PageIndex
          ON [HRM_Employees].[CardNo] = #PageIndex.CardNo
  INNER JOIN [HRM_Designations] AS [HRM_Designations1]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations1].[DesignationID]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies2]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies2].[CompanyID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions3]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions3].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices4]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices4].[OfficeID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments5]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments5].[DepartmentID]
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects6]
    ON [HRM_Employees].[C_ProjectSiteID] = [DCM_Projects6].[ProjectCode]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies7]
    ON [HRM_Employees].[U_CompanyID] = [HRM_Companies7].[CompanyID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions8]
    ON [HRM_Employees].[U_DivisionID] = [HRM_Divisions8].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices9]
    ON [HRM_Employees].[U_OfficeID] = [HRM_Offices9].[OfficeID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments10]
    ON [HRM_Employees].[U_DepartmentID] = [HRM_Departments10].[DepartmentID]
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects11]
    ON [HRM_Employees].[U_ProjectSiteID] = [DCM_Projects11].[ProjectCode]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users12]
    ON [HRM_Employees].[ModifiedBy] = [aspnet_Users12].[UserName]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
