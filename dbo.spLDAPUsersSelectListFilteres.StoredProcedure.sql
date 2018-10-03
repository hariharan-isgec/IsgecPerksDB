USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLDAPUsersSelectListFilteres]
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
  SET @LGSQL = @LGSQL + '[ASPNETv_UsersForLDAP].[UserName]'
  SET @LGSQL = @LGSQL + ' FROM [ASPNETv_UsersForLDAP] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UserName' THEN '[ASPNETv_UsersForLDAP].[UserName]'
                        WHEN 'UserName DESC' THEN '[ASPNETv_UsersForLDAP].[UserName] DESC'
                        WHEN 'UserFullName' THEN '[ASPNETv_UsersForLDAP].[UserFullName]'
                        WHEN 'UserFullName DESC' THEN '[ASPNETv_UsersForLDAP].[UserFullName] DESC'
                        WHEN 'EmployeeName' THEN '[ASPNETv_UsersForLDAP].[EmployeeName]'
                        WHEN 'EmployeeName DESC' THEN '[ASPNETv_UsersForLDAP].[EmployeeName] DESC'
                        WHEN 'Department' THEN '[ASPNETv_UsersForLDAP].[Department]'
                        WHEN 'Department DESC' THEN '[ASPNETv_UsersForLDAP].[Department] DESC'
                        WHEN 'Designation' THEN '[ASPNETv_UsersForLDAP].[Designation]'
                        WHEN 'Designation DESC' THEN '[ASPNETv_UsersForLDAP].[Designation] DESC'
                        WHEN 'EMailID' THEN '[ASPNETv_UsersForLDAP].[EMailID]'
                        WHEN 'EMailID DESC' THEN '[ASPNETv_UsersForLDAP].[EMailID] DESC'
                        WHEN 'MD5Password' THEN '[ASPNETv_UsersForLDAP].[MD5Password]'
                        WHEN 'MD5Password DESC' THEN '[ASPNETv_UsersForLDAP].[MD5Password] DESC'
                        WHEN 'MobileNo' THEN '[ASPNETv_UsersForLDAP].[MobileNo]'
                        WHEN 'MobileNo DESC' THEN '[ASPNETv_UsersForLDAP].[MobileNo] DESC'
                        WHEN 'Location' THEN '[ASPNETv_UsersForLDAP].[Location]'
                        WHEN 'Location DESC' THEN '[ASPNETv_UsersForLDAP].[Location] DESC'
                        ELSE '[ASPNETv_UsersForLDAP].[UserName]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ASPNETv_UsersForLDAP].[UserName] ,
		[ASPNETv_UsersForLDAP].[UserFullName] ,
		[ASPNETv_UsersForLDAP].[EmployeeName] ,
		[ASPNETv_UsersForLDAP].[Department] ,
		[ASPNETv_UsersForLDAP].[Designation] ,
		[ASPNETv_UsersForLDAP].[EMailID] ,
		[ASPNETv_UsersForLDAP].[MD5Password] ,
		[ASPNETv_UsersForLDAP].[MobileNo] ,
		[ASPNETv_UsersForLDAP].[ProjectSiteID], 
		[ASPNETv_UsersForLDAP].[ProjectSiteEMailID], 
		[ASPNETv_UsersForLDAP].[ProjectSiteEMailPassword], 
		[ASPNETv_UsersForLDAP].[Location],  
		[ASPNETv_UsersForLDAP].[ContactNumbers],
		[ASPNETv_UsersForLDAP].[Blackberry]    
  FROM [ASPNETv_UsersForLDAP] 
    	INNER JOIN #PageIndex
          ON [ASPNETv_UsersForLDAP].[UserName] = #PageIndex.UserName
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
