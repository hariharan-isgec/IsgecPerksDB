USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmWebUsersSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,UserName NVarChar(256) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'UserName'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[aspnet_Users].[UserName]'
  SET @LGSQL = @LGSQL + ' FROM [aspnet_Users] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ApplicationId' THEN '[aspnet_Users].[ApplicationId]'
                        WHEN 'ApplicationId DESC' THEN '[aspnet_Users].[ApplicationId] DESC'
                        WHEN 'UserId' THEN '[aspnet_Users].[UserId]'
                        WHEN 'UserId DESC' THEN '[aspnet_Users].[UserId] DESC'
                        WHEN 'UserName' THEN '[aspnet_Users].[UserName]'
                        WHEN 'UserName DESC' THEN '[aspnet_Users].[UserName] DESC'
                        WHEN 'LoweredUserName' THEN '[aspnet_Users].[LoweredUserName]'
                        WHEN 'LoweredUserName DESC' THEN '[aspnet_Users].[LoweredUserName] DESC'
                        WHEN 'MobileAlias' THEN '[aspnet_Users].[MobileAlias]'
                        WHEN 'MobileAlias DESC' THEN '[aspnet_Users].[MobileAlias] DESC'
                        WHEN 'IsAnonymous' THEN '[aspnet_Users].[IsAnonymous]'
                        WHEN 'IsAnonymous DESC' THEN '[aspnet_Users].[IsAnonymous] DESC'
                        WHEN 'LastActivityDate' THEN '[aspnet_Users].[LastActivityDate]'
                        WHEN 'LastActivityDate DESC' THEN '[aspnet_Users].[LastActivityDate] DESC'
                        WHEN 'UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'UserFullName DESC' THEN '[aspnet_Users].[UserFullName] DESC'
                        WHEN 'LocationID' THEN '[aspnet_Users].[LocationID]'
                        WHEN 'LocationID DESC' THEN '[aspnet_Users].[LocationID] DESC'
                        WHEN 'ExtnNo' THEN '[aspnet_Users].[ExtnNo]'
                        WHEN 'ExtnNo DESC' THEN '[aspnet_Users].[ExtnNo] DESC'
                        WHEN 'MobileNo' THEN '[aspnet_Users].[MobileNo]'
                        WHEN 'MobileNo DESC' THEN '[aspnet_Users].[MobileNo] DESC'
                        WHEN 'EMailID' THEN '[aspnet_Users].[EMailID]'
                        WHEN 'EMailID DESC' THEN '[aspnet_Users].[EMailID] DESC'
                        WHEN 'C_DateOfJoining' THEN '[aspnet_Users].[C_DateOfJoining]'
                        WHEN 'C_DateOfJoining DESC' THEN '[aspnet_Users].[C_DateOfJoining] DESC'
                        WHEN 'C_CompanyID' THEN '[aspnet_Users].[C_CompanyID]'
                        WHEN 'C_CompanyID DESC' THEN '[aspnet_Users].[C_CompanyID] DESC'
                        WHEN 'C_DivisionID' THEN '[aspnet_Users].[C_DivisionID]'
                        WHEN 'C_DivisionID DESC' THEN '[aspnet_Users].[C_DivisionID] DESC'
                        WHEN 'C_OfficeID' THEN '[aspnet_Users].[C_OfficeID]'
                        WHEN 'C_OfficeID DESC' THEN '[aspnet_Users].[C_OfficeID] DESC'
                        WHEN 'C_DepartmentID' THEN '[aspnet_Users].[C_DepartmentID]'
                        WHEN 'C_DepartmentID DESC' THEN '[aspnet_Users].[C_DepartmentID] DESC'
                        WHEN 'C_ProjectSiteID' THEN '[aspnet_Users].[C_ProjectSiteID]'
                        WHEN 'C_ProjectSiteID DESC' THEN '[aspnet_Users].[C_ProjectSiteID] DESC'
                        WHEN 'C_DesignationID' THEN '[aspnet_Users].[C_DesignationID]'
                        WHEN 'C_DesignationID DESC' THEN '[aspnet_Users].[C_DesignationID] DESC'
                        WHEN 'ActiveState' THEN '[aspnet_Users].[ActiveState]'
                        WHEN 'ActiveState DESC' THEN '[aspnet_Users].[ActiveState] DESC'
                        WHEN 'VPN_IP' THEN '[aspnet_Users].[VPN_IP]'
                        WHEN 'VPN_IP DESC' THEN '[aspnet_Users].[VPN_IP] DESC'
                        WHEN 'VPN_Password' THEN '[aspnet_Users].[VPN_Password]'
                        WHEN 'VPN_Password DESC' THEN '[aspnet_Users].[VPN_Password] DESC'
                        WHEN 'VPN_Expires' THEN '[aspnet_Users].[VPN_Expires]'
                        WHEN 'VPN_Expires DESC' THEN '[aspnet_Users].[VPN_Expires] DESC'
                        WHEN 'LoginID' THEN '[aspnet_Users].[LoginID]'
                        WHEN 'LoginID DESC' THEN '[aspnet_Users].[LoginID] DESC'
                        WHEN 'Contractual' THEN '[aspnet_Users].[Contractual]'
                        WHEN 'Contractual DESC' THEN '[aspnet_Users].[Contractual] DESC'
                        WHEN 'MD5Password' THEN '[aspnet_Users].[MD5Password]'
                        WHEN 'MD5Password DESC' THEN '[aspnet_Users].[MD5Password] DESC'
                        ELSE '[aspnet_Users].[UserName]'
                    END
  EXEC (@LGSQL)

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
