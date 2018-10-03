USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLDAPUsersSelectListSearch]
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
  SELECT [ASPNETv_UsersForLDAP].[UserName] FROM [ASPNETv_UsersForLDAP]
 WHERE  
   ( 
         LOWER(ISNULL([ASPNETv_UsersForLDAP].[UserName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASPNETv_UsersForLDAP].[UserFullName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASPNETv_UsersForLDAP].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASPNETv_UsersForLDAP].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASPNETv_UsersForLDAP].[Designation],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASPNETv_UsersForLDAP].[EMailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASPNETv_UsersForLDAP].[MD5Password],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASPNETv_UsersForLDAP].[MobileNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASPNETv_UsersForLDAP].[Location],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'UserName' THEN [ASPNETv_UsersForLDAP].[UserName] END,
     CASE @orderBy WHEN 'UserName DESC' THEN [ASPNETv_UsersForLDAP].[UserName] END DESC,
     CASE @orderBy WHEN 'UserFullName' THEN [ASPNETv_UsersForLDAP].[UserFullName] END,
     CASE @orderBy WHEN 'UserFullName DESC' THEN [ASPNETv_UsersForLDAP].[UserFullName] END DESC,
     CASE @orderBy WHEN 'EmployeeName' THEN [ASPNETv_UsersForLDAP].[EmployeeName] END,
     CASE @orderBy WHEN 'EmployeeName DESC' THEN [ASPNETv_UsersForLDAP].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'Department' THEN [ASPNETv_UsersForLDAP].[Department] END,
     CASE @orderBy WHEN 'Department DESC' THEN [ASPNETv_UsersForLDAP].[Department] END DESC,
     CASE @orderBy WHEN 'Designation' THEN [ASPNETv_UsersForLDAP].[Designation] END,
     CASE @orderBy WHEN 'Designation DESC' THEN [ASPNETv_UsersForLDAP].[Designation] END DESC,
     CASE @orderBy WHEN 'EMailID' THEN [ASPNETv_UsersForLDAP].[EMailID] END,
     CASE @orderBy WHEN 'EMailID DESC' THEN [ASPNETv_UsersForLDAP].[EMailID] END DESC,
     CASE @orderBy WHEN 'MD5Password' THEN [ASPNETv_UsersForLDAP].[MD5Password] END,
     CASE @orderBy WHEN 'MD5Password DESC' THEN [ASPNETv_UsersForLDAP].[MD5Password] END DESC,
     CASE @orderBy WHEN 'MobileNo' THEN [ASPNETv_UsersForLDAP].[MobileNo] END,
     CASE @orderBy WHEN 'MobileNo DESC' THEN [ASPNETv_UsersForLDAP].[MobileNo] END DESC,
     CASE @orderBy WHEN 'Location' THEN [ASPNETv_UsersForLDAP].[Location] END,
     CASE @orderBy WHEN 'Location DESC' THEN [ASPNETv_UsersForLDAP].[Location] END DESC 

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
