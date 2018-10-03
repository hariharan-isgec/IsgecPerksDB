USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmstUsersSelectList]
  @ActiveState Bit,
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
		[aspnet_Users].[C_ProjectSiteID] ,
		[aspnet_Users].[Contractual] ,
		[aspnet_Users].[ActiveState] ,
		[aspnet_Users].[MobileNo] ,
		[aspnet_Users].[EMailID] ,
		[aspnet_Users].[LocationID] ,
		[aspnet_Users].[ExtnNo] ,
		[aspnet_Users].[C_DateOfJoining] ,
		[aspnet_Users].[NetworkIP] ,
		[aspnet_Users].[VPN_IP] ,
		[aspnet_Users].[VPN_Password] ,
		[aspnet_Users].[VPN_Expires] ,
		[aspnet_Users].[LoginID] ,
		[aspnet_Users].[MD5Password] ,
		[AST_Locations1].[Descriptions] AS AST_Locations1_Descriptions,
		[HRM_Companies2].[Description] AS HRM_Companies2_Description,
		[HRM_Departments3].[Description] AS HRM_Departments3_Description,
		[HRM_Designations4].[Description] AS HRM_Designations4_Description,
		[HRM_Divisions5].[Description] AS HRM_Divisions5_Description,
		[HRM_Offices6].[Description] AS HRM_Offices6_Description,
		[IDM_Projects7].[Description] AS IDM_Projects7_Description 
  FROM [aspnet_Users] 
  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations1]
    ON [aspnet_Users].[LocationID] = [AST_Locations1].[LocationID]
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
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects7]
    ON [aspnet_Users].[C_ProjectSiteID] = [IDM_Projects7].[ProjectID]
  WHERE 1 = 1  
  AND [aspnet_Users].[ActiveState] = (@ActiveState)  
  ORDER BY
     CASE @orderBy WHEN 'UserName' THEN [aspnet_Users].[UserName] END,
     CASE @orderBy WHEN 'UserName DESC' THEN [aspnet_Users].[UserName] END DESC,
     CASE @orderBy WHEN 'UserFullName' THEN [aspnet_Users].[UserFullName] END,
     CASE @orderBy WHEN 'UserFullName DESC' THEN [aspnet_Users].[UserFullName] END DESC,
     CASE @orderBy WHEN 'C_CompanyID' THEN [aspnet_Users].[C_CompanyID] END,
     CASE @orderBy WHEN 'C_CompanyID DESC' THEN [aspnet_Users].[C_CompanyID] END DESC,
     CASE @orderBy WHEN 'C_DivisionID' THEN [aspnet_Users].[C_DivisionID] END,
     CASE @orderBy WHEN 'C_DivisionID DESC' THEN [aspnet_Users].[C_DivisionID] END DESC,
     CASE @orderBy WHEN 'C_OfficeID' THEN [aspnet_Users].[C_OfficeID] END,
     CASE @orderBy WHEN 'C_OfficeID DESC' THEN [aspnet_Users].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'C_DepartmentID' THEN [aspnet_Users].[C_DepartmentID] END,
     CASE @orderBy WHEN 'C_DepartmentID DESC' THEN [aspnet_Users].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'C_DesignationID' THEN [aspnet_Users].[C_DesignationID] END,
     CASE @orderBy WHEN 'C_DesignationID DESC' THEN [aspnet_Users].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'C_ProjectSiteID' THEN [aspnet_Users].[C_ProjectSiteID] END,
     CASE @orderBy WHEN 'C_ProjectSiteID DESC' THEN [aspnet_Users].[C_ProjectSiteID] END DESC,
     CASE @orderBy WHEN 'Contractual' THEN [aspnet_Users].[Contractual] END,
     CASE @orderBy WHEN 'Contractual DESC' THEN [aspnet_Users].[Contractual] END DESC,
     CASE @orderBy WHEN 'ActiveState' THEN [aspnet_Users].[ActiveState] END,
     CASE @orderBy WHEN 'ActiveState DESC' THEN [aspnet_Users].[ActiveState] END DESC,
     CASE @orderBy WHEN 'MobileNo' THEN [aspnet_Users].[MobileNo] END,
     CASE @orderBy WHEN 'MobileNo DESC' THEN [aspnet_Users].[MobileNo] END DESC,
     CASE @orderBy WHEN 'EMailID' THEN [aspnet_Users].[EMailID] END,
     CASE @orderBy WHEN 'EMailID DESC' THEN [aspnet_Users].[EMailID] END DESC,
     CASE @orderBy WHEN 'LocationID' THEN [aspnet_Users].[LocationID] END,
     CASE @orderBy WHEN 'LocationID DESC' THEN [aspnet_Users].[LocationID] END DESC,
     CASE @orderBy WHEN 'ExtnNo' THEN [aspnet_Users].[ExtnNo] END,
     CASE @orderBy WHEN 'ExtnNo DESC' THEN [aspnet_Users].[ExtnNo] END DESC,
     CASE @orderBy WHEN 'C_DateOfJoining' THEN [aspnet_Users].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'C_DateOfJoining DESC' THEN [aspnet_Users].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'NetworkIP' THEN [aspnet_Users].[NetworkIP] END,
     CASE @orderBy WHEN 'NetworkIP DESC' THEN [aspnet_Users].[NetworkIP] END DESC,
     CASE @orderBy WHEN 'VPN_IP' THEN [aspnet_Users].[VPN_IP] END,
     CASE @orderBy WHEN 'VPN_IP DESC' THEN [aspnet_Users].[VPN_IP] END DESC,
     CASE @orderBy WHEN 'VPN_Password' THEN [aspnet_Users].[VPN_Password] END,
     CASE @orderBy WHEN 'VPN_Password DESC' THEN [aspnet_Users].[VPN_Password] END DESC,
     CASE @orderBy WHEN 'VPN_Expires' THEN [aspnet_Users].[VPN_Expires] END,
     CASE @orderBy WHEN 'VPN_Expires DESC' THEN [aspnet_Users].[VPN_Expires] END DESC,
     CASE @orderBy WHEN 'LoginID' THEN [aspnet_Users].[LoginID] END,
     CASE @orderBy WHEN 'LoginID DESC' THEN [aspnet_Users].[LoginID] END DESC,
     CASE @orderBy WHEN 'MD5Password' THEN [aspnet_Users].[MD5Password] END,
     CASE @orderBy WHEN 'MD5Password DESC' THEN [aspnet_Users].[MD5Password] END DESC,
     CASE @orderBy WHEN 'AST_Locations1_Descriptions' THEN [AST_Locations1].[Descriptions] END,
     CASE @orderBy WHEN 'AST_Locations1_Descriptions DESC' THEN [AST_Locations1].[Descriptions] END DESC,
     CASE @orderBy WHEN 'HRM_Companies2_Description' THEN [HRM_Companies2].[Description] END,
     CASE @orderBy WHEN 'HRM_Companies2_Description DESC' THEN [HRM_Companies2].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Departments3_Description' THEN [HRM_Departments3].[Description] END,
     CASE @orderBy WHEN 'HRM_Departments3_Description DESC' THEN [HRM_Departments3].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations4_Description' THEN [HRM_Designations4].[Description] END,
     CASE @orderBy WHEN 'HRM_Designations4_Description DESC' THEN [HRM_Designations4].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Divisions5_Description' THEN [HRM_Divisions5].[Description] END,
     CASE @orderBy WHEN 'HRM_Divisions5_Description DESC' THEN [HRM_Divisions5].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices6_Description' THEN [HRM_Offices6].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices6_Description DESC' THEN [HRM_Offices6].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_Projects7_Description' THEN [IDM_Projects7].[Description] END,
     CASE @orderBy WHEN 'IDM_Projects7_Description DESC' THEN [IDM_Projects7].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
