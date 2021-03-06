USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsUsersSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @ActiveState Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,LoginID NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (LoginID)
  SELECT [aspnet_Users].[LoginID] FROM [aspnet_Users]
 WHERE  
      [aspnet_Users].[ActiveState] = (@ActiveState)
   AND ( 
         LOWER(ISNULL([aspnet_Users].[LoginID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[UserFullName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[UserName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[EMailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[C_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[C_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([aspnet_Users].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[C_DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[C_ProjectSiteID],'')) LIKE @KeyWord1
     OR STR(ISNULL([aspnet_Users].[C_DesignationID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'LoginID' THEN [aspnet_Users].[LoginID] END,
     CASE @OrderBy WHEN 'LoginID DESC' THEN [aspnet_Users].[LoginID] END DESC,
     CASE @OrderBy WHEN 'UserFullName' THEN [aspnet_Users].[UserFullName] END,
     CASE @OrderBy WHEN 'UserFullName DESC' THEN [aspnet_Users].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'UserName' THEN [aspnet_Users].[UserName] END,
     CASE @OrderBy WHEN 'UserName DESC' THEN [aspnet_Users].[UserName] END DESC,
     CASE @OrderBy WHEN 'Contractual' THEN [aspnet_Users].[Contractual] END,
     CASE @OrderBy WHEN 'Contractual DESC' THEN [aspnet_Users].[Contractual] END DESC,
     CASE @OrderBy WHEN 'EMailID' THEN [aspnet_Users].[EMailID] END,
     CASE @OrderBy WHEN 'EMailID DESC' THEN [aspnet_Users].[EMailID] END DESC,
     CASE @OrderBy WHEN 'C_DateOfJoining' THEN [aspnet_Users].[C_DateOfJoining] END,
     CASE @OrderBy WHEN 'C_DateOfJoining DESC' THEN [aspnet_Users].[C_DateOfJoining] END DESC,
     CASE @OrderBy WHEN 'C_CompanyID' THEN [aspnet_Users].[C_CompanyID] END,
     CASE @OrderBy WHEN 'C_CompanyID DESC' THEN [aspnet_Users].[C_CompanyID] END DESC,
     CASE @OrderBy WHEN 'C_DivisionID' THEN [aspnet_Users].[C_DivisionID] END,
     CASE @OrderBy WHEN 'C_DivisionID DESC' THEN [aspnet_Users].[C_DivisionID] END DESC,
     CASE @OrderBy WHEN 'C_OfficeID' THEN [aspnet_Users].[C_OfficeID] END,
     CASE @OrderBy WHEN 'C_OfficeID DESC' THEN [aspnet_Users].[C_OfficeID] END DESC,
     CASE @OrderBy WHEN 'C_DepartmentID' THEN [aspnet_Users].[C_DepartmentID] END,
     CASE @OrderBy WHEN 'C_DepartmentID DESC' THEN [aspnet_Users].[C_DepartmentID] END DESC,
     CASE @OrderBy WHEN 'C_ProjectSiteID' THEN [aspnet_Users].[C_ProjectSiteID] END,
     CASE @OrderBy WHEN 'C_ProjectSiteID DESC' THEN [aspnet_Users].[C_ProjectSiteID] END DESC,
     CASE @OrderBy WHEN 'C_DesignationID' THEN [aspnet_Users].[C_DesignationID] END,
     CASE @OrderBy WHEN 'C_DesignationID DESC' THEN [aspnet_Users].[C_DesignationID] END DESC,
     CASE @OrderBy WHEN 'ActiveState' THEN [aspnet_Users].[ActiveState] END,
     CASE @OrderBy WHEN 'ActiveState DESC' THEN [aspnet_Users].[ActiveState] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[aspnet_Users].[LoginID] ,
		[aspnet_Users].[UserFullName] ,
		[aspnet_Users].[UserName] ,
		[aspnet_Users].[Contractual] ,
		[aspnet_Users].[EMailID] ,
		[aspnet_Users].[C_DateOfJoining] ,
		[aspnet_Users].[C_CompanyID] ,
		[aspnet_Users].[C_DivisionID] ,
		[aspnet_Users].[C_OfficeID] ,
		[aspnet_Users].[C_DepartmentID] ,
		[aspnet_Users].[C_ProjectSiteID] ,
		[aspnet_Users].[C_DesignationID] ,
		[aspnet_Users].[ActiveState]  
  FROM [aspnet_Users] 
    	INNER JOIN #PageIndex
          ON [aspnet_Users].[LoginID] = #PageIndex.LoginID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
