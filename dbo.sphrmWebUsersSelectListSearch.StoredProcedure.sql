USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmWebUsersSelectListSearch]
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
 ,UserName NVarChar(256) NOT NULL
  )
  INSERT INTO #PageIndex (UserName)
  SELECT [aspnet_Users].[UserName] FROM [aspnet_Users]
 WHERE  
   ( 
         LOWER(ISNULL([aspnet_Users].[UserName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[LoweredUserName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[MobileAlias],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[UserFullName],'')) LIKE @KeyWord1
     OR STR(ISNULL([aspnet_Users].[LocationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[ExtnNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[MobileNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[EMailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[C_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[C_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([aspnet_Users].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[C_DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[C_ProjectSiteID],'')) LIKE @KeyWord1
     OR STR(ISNULL([aspnet_Users].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[VPN_IP],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[VPN_Password],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[LoginID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[MD5Password],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'ApplicationId' THEN [aspnet_Users].[ApplicationId] END,
     CASE @orderBy WHEN 'ApplicationId DESC' THEN [aspnet_Users].[ApplicationId] END DESC,
     CASE @orderBy WHEN 'UserId' THEN [aspnet_Users].[UserId] END,
     CASE @orderBy WHEN 'UserId DESC' THEN [aspnet_Users].[UserId] END DESC,
     CASE @orderBy WHEN 'UserName' THEN [aspnet_Users].[UserName] END,
     CASE @orderBy WHEN 'UserName DESC' THEN [aspnet_Users].[UserName] END DESC,
     CASE @orderBy WHEN 'LoweredUserName' THEN [aspnet_Users].[LoweredUserName] END,
     CASE @orderBy WHEN 'LoweredUserName DESC' THEN [aspnet_Users].[LoweredUserName] END DESC,
     CASE @orderBy WHEN 'MobileAlias' THEN [aspnet_Users].[MobileAlias] END,
     CASE @orderBy WHEN 'MobileAlias DESC' THEN [aspnet_Users].[MobileAlias] END DESC,
     CASE @orderBy WHEN 'IsAnonymous' THEN [aspnet_Users].[IsAnonymous] END,
     CASE @orderBy WHEN 'IsAnonymous DESC' THEN [aspnet_Users].[IsAnonymous] END DESC,
     CASE @orderBy WHEN 'LastActivityDate' THEN [aspnet_Users].[LastActivityDate] END,
     CASE @orderBy WHEN 'LastActivityDate DESC' THEN [aspnet_Users].[LastActivityDate] END DESC,
     CASE @orderBy WHEN 'UserFullName' THEN [aspnet_Users].[UserFullName] END,
     CASE @orderBy WHEN 'UserFullName DESC' THEN [aspnet_Users].[UserFullName] END DESC,
     CASE @orderBy WHEN 'LocationID' THEN [aspnet_Users].[LocationID] END,
     CASE @orderBy WHEN 'LocationID DESC' THEN [aspnet_Users].[LocationID] END DESC,
     CASE @orderBy WHEN 'ExtnNo' THEN [aspnet_Users].[ExtnNo] END,
     CASE @orderBy WHEN 'ExtnNo DESC' THEN [aspnet_Users].[ExtnNo] END DESC,
     CASE @orderBy WHEN 'MobileNo' THEN [aspnet_Users].[MobileNo] END,
     CASE @orderBy WHEN 'MobileNo DESC' THEN [aspnet_Users].[MobileNo] END DESC,
     CASE @orderBy WHEN 'EMailID' THEN [aspnet_Users].[EMailID] END,
     CASE @orderBy WHEN 'EMailID DESC' THEN [aspnet_Users].[EMailID] END DESC,
     CASE @orderBy WHEN 'C_DateOfJoining' THEN [aspnet_Users].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'C_DateOfJoining DESC' THEN [aspnet_Users].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'C_CompanyID' THEN [aspnet_Users].[C_CompanyID] END,
     CASE @orderBy WHEN 'C_CompanyID DESC' THEN [aspnet_Users].[C_CompanyID] END DESC,
     CASE @orderBy WHEN 'C_DivisionID' THEN [aspnet_Users].[C_DivisionID] END,
     CASE @orderBy WHEN 'C_DivisionID DESC' THEN [aspnet_Users].[C_DivisionID] END DESC,
     CASE @orderBy WHEN 'C_OfficeID' THEN [aspnet_Users].[C_OfficeID] END,
     CASE @orderBy WHEN 'C_OfficeID DESC' THEN [aspnet_Users].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'C_DepartmentID' THEN [aspnet_Users].[C_DepartmentID] END,
     CASE @orderBy WHEN 'C_DepartmentID DESC' THEN [aspnet_Users].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'C_ProjectSiteID' THEN [aspnet_Users].[C_ProjectSiteID] END,
     CASE @orderBy WHEN 'C_ProjectSiteID DESC' THEN [aspnet_Users].[C_ProjectSiteID] END DESC,
     CASE @orderBy WHEN 'C_DesignationID' THEN [aspnet_Users].[C_DesignationID] END,
     CASE @orderBy WHEN 'C_DesignationID DESC' THEN [aspnet_Users].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'ActiveState' THEN [aspnet_Users].[ActiveState] END,
     CASE @orderBy WHEN 'ActiveState DESC' THEN [aspnet_Users].[ActiveState] END DESC,
     CASE @orderBy WHEN 'VPN_IP' THEN [aspnet_Users].[VPN_IP] END,
     CASE @orderBy WHEN 'VPN_IP DESC' THEN [aspnet_Users].[VPN_IP] END DESC,
     CASE @orderBy WHEN 'VPN_Password' THEN [aspnet_Users].[VPN_Password] END,
     CASE @orderBy WHEN 'VPN_Password DESC' THEN [aspnet_Users].[VPN_Password] END DESC,
     CASE @orderBy WHEN 'VPN_Expires' THEN [aspnet_Users].[VPN_Expires] END,
     CASE @orderBy WHEN 'VPN_Expires DESC' THEN [aspnet_Users].[VPN_Expires] END DESC,
     CASE @orderBy WHEN 'LoginID' THEN [aspnet_Users].[LoginID] END,
     CASE @orderBy WHEN 'LoginID DESC' THEN [aspnet_Users].[LoginID] END DESC,
     CASE @orderBy WHEN 'Contractual' THEN [aspnet_Users].[Contractual] END,
     CASE @orderBy WHEN 'Contractual DESC' THEN [aspnet_Users].[Contractual] END DESC,
     CASE @orderBy WHEN 'MD5Password' THEN [aspnet_Users].[MD5Password] END,
     CASE @orderBy WHEN 'MD5Password DESC' THEN [aspnet_Users].[MD5Password] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		CONVERT(NVarChar(36),[aspnet_Users].[ApplicationId]) AS ApplicationId,
		CONVERT(NVarChar(36),[aspnet_Users].[UserId]) AS UserId,
		[aspnet_Users].[UserName] ,
		[aspnet_Users].[LoweredUserName] ,
		[aspnet_Users].[MobileAlias] ,
		[aspnet_Users].[IsAnonymous] ,
		[aspnet_Users].[LastActivityDate] ,
		[aspnet_Users].[UserFullName] ,
		[aspnet_Users].[LocationID] ,
		[aspnet_Users].[ExtnNo] ,
		[aspnet_Users].[MobileNo] ,
		[aspnet_Users].[EMailID] ,
		[aspnet_Users].[C_DateOfJoining] ,
		[aspnet_Users].[C_CompanyID] ,
		[aspnet_Users].[C_DivisionID] ,
		[aspnet_Users].[C_OfficeID] ,
		[aspnet_Users].[C_DepartmentID] ,
		[aspnet_Users].[C_ProjectSiteID] ,
		[aspnet_Users].[C_DesignationID] ,
		[aspnet_Users].[ActiveState] ,
		[aspnet_Users].[VPN_IP] ,
		[aspnet_Users].[VPN_Password] ,
		[aspnet_Users].[VPN_Expires] ,
		[aspnet_Users].[LoginID] ,
		[aspnet_Users].[Contractual] ,
		[aspnet_Users].[MD5Password]  
  FROM [aspnet_Users] 
    	INNER JOIN #PageIndex
          ON [aspnet_Users].[UserName] = #PageIndex.UserName
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
