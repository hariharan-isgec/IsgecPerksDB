USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmUsersSelectList]
  @ActiveState Bit,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[aspnet_Users].[UserName] ,
		[aspnet_Users].[UserFullName] ,
		[aspnet_Users].[C_CompanyID] ,
		[aspnet_Users].[C_DivisionID] ,
		[aspnet_Users].[C_OfficeID] ,
		[aspnet_Users].[C_DepartmentID] ,
		[aspnet_Users].[C_DesignationID] ,
		[aspnet_Users].[Contractual] ,
		[aspnet_Users].[ActiveState] ,
		[aspnet_Users].[MobileNo] ,
		[aspnet_Users].[EMailID] ,
		[aspnet_Users].[ExtnNo] ,
		[HRM_Companies2].[Description] AS HRM_Companies2_Description,
		[HRM_Departments3].[Description] AS HRM_Departments3_Description,
		[HRM_Designations4].[Description] AS HRM_Designations4_Description,
		[HRM_Divisions5].[Description] AS HRM_Divisions5_Description,
		[HRM_Offices6].[Description] AS HRM_Offices6_Description 
  FROM [aspnet_Users] 
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies2]
    ON [aspnet_Users].[C_CompanyID] = [HRM_Companies2].[CompanyID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments3]
    ON [aspnet_Users].[C_DepartmentID] = [HRM_Departments3].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations4]
    ON [aspnet_Users].[C_DesignationID] = [HRM_Designations4].[DesignationID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]
    ON [aspnet_Users].[C_DivisionID] = [HRM_Divisions5].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices6]
    ON [aspnet_Users].[C_OfficeID] = [HRM_Offices6].[OfficeID]
  WHERE 1 = 1  
  AND [aspnet_Users].[ActiveState] = (@ActiveState)  
  ORDER BY
     CASE @OrderBy WHEN 'UserName' THEN [aspnet_Users].[UserName] END,
     CASE @OrderBy WHEN 'UserName DESC' THEN [aspnet_Users].[UserName] END DESC,
     CASE @OrderBy WHEN 'UserFullName' THEN [aspnet_Users].[UserFullName] END,
     CASE @OrderBy WHEN 'UserFullName DESC' THEN [aspnet_Users].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'C_CompanyID' THEN [aspnet_Users].[C_CompanyID] END,
     CASE @OrderBy WHEN 'C_CompanyID DESC' THEN [aspnet_Users].[C_CompanyID] END DESC,
     CASE @OrderBy WHEN 'C_DivisionID' THEN [aspnet_Users].[C_DivisionID] END,
     CASE @OrderBy WHEN 'C_DivisionID DESC' THEN [aspnet_Users].[C_DivisionID] END DESC,
     CASE @OrderBy WHEN 'C_OfficeID' THEN [aspnet_Users].[C_OfficeID] END,
     CASE @OrderBy WHEN 'C_OfficeID DESC' THEN [aspnet_Users].[C_OfficeID] END DESC,
     CASE @OrderBy WHEN 'C_DepartmentID' THEN [aspnet_Users].[C_DepartmentID] END,
     CASE @OrderBy WHEN 'C_DepartmentID DESC' THEN [aspnet_Users].[C_DepartmentID] END DESC,
     CASE @OrderBy WHEN 'C_DesignationID' THEN [aspnet_Users].[C_DesignationID] END,
     CASE @OrderBy WHEN 'C_DesignationID DESC' THEN [aspnet_Users].[C_DesignationID] END DESC,
     CASE @OrderBy WHEN 'Contractual' THEN [aspnet_Users].[Contractual] END,
     CASE @OrderBy WHEN 'Contractual DESC' THEN [aspnet_Users].[Contractual] END DESC,
     CASE @OrderBy WHEN 'ActiveState' THEN [aspnet_Users].[ActiveState] END,
     CASE @OrderBy WHEN 'ActiveState DESC' THEN [aspnet_Users].[ActiveState] END DESC,
     CASE @OrderBy WHEN 'MobileNo' THEN [aspnet_Users].[MobileNo] END,
     CASE @OrderBy WHEN 'MobileNo DESC' THEN [aspnet_Users].[MobileNo] END DESC,
     CASE @OrderBy WHEN 'EMailID' THEN [aspnet_Users].[EMailID] END,
     CASE @OrderBy WHEN 'EMailID DESC' THEN [aspnet_Users].[EMailID] END DESC,
     CASE @OrderBy WHEN 'ExtnNo' THEN [aspnet_Users].[ExtnNo] END,
     CASE @OrderBy WHEN 'ExtnNo DESC' THEN [aspnet_Users].[ExtnNo] END DESC,
     CASE @OrderBy WHEN 'HRM_Companies2_Description' THEN [HRM_Companies2].[Description] END,
     CASE @OrderBy WHEN 'HRM_Companies2_Description DESC' THEN [HRM_Companies2].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Departments3_Description' THEN [HRM_Departments3].[Description] END,
     CASE @OrderBy WHEN 'HRM_Departments3_Description DESC' THEN [HRM_Departments3].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Designations4_Description' THEN [HRM_Designations4].[Description] END,
     CASE @OrderBy WHEN 'HRM_Designations4_Description DESC' THEN [HRM_Designations4].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description' THEN [HRM_Divisions5].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description DESC' THEN [HRM_Divisions5].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Offices6_Description' THEN [HRM_Offices6].[Description] END,
     CASE @OrderBy WHEN 'HRM_Offices6_Description DESC' THEN [HRM_Offices6].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
