USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmUsersSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,UserName NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'UserName'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[aspnet_users].[UserName]'  SET @LGSQL = @LGSQL + ' FROM [aspnet_users] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UserName' THEN '[aspnet_users].[UserName]'
                        WHEN 'UserName DESC' THEN '[aspnet_users].[UserName] DESC'
                        WHEN 'UserFullName' THEN '[aspnet_users].[UserFullName]'
                        WHEN 'UserFullName DESC' THEN '[aspnet_users].[UserFullName] DESC'
                        WHEN 'LocationID' THEN '[aspnet_users].[LocationID]'
                        WHEN 'LocationID DESC' THEN '[aspnet_users].[LocationID] DESC'
                        WHEN 'ExtnNo' THEN '[aspnet_users].[ExtnNo]'
                        WHEN 'ExtnNo DESC' THEN '[aspnet_users].[ExtnNo] DESC'
                        WHEN 'MobileNo' THEN '[aspnet_users].[MobileNo]'
                        WHEN 'MobileNo DESC' THEN '[aspnet_users].[MobileNo] DESC'
                        WHEN 'EMailID' THEN '[aspnet_users].[EMailID]'
                        WHEN 'EMailID DESC' THEN '[aspnet_users].[EMailID] DESC'
                        WHEN 'C_DateOfJoining' THEN '[aspnet_users].[C_DateOfJoining]'
                        WHEN 'C_DateOfJoining DESC' THEN '[aspnet_users].[C_DateOfJoining] DESC'
                        WHEN 'C_CompanyID' THEN '[aspnet_users].[C_CompanyID]'
                        WHEN 'C_CompanyID DESC' THEN '[aspnet_users].[C_CompanyID] DESC'
                        WHEN 'C_DivisionID' THEN '[aspnet_users].[C_DivisionID]'
                        WHEN 'C_DivisionID DESC' THEN '[aspnet_users].[C_DivisionID] DESC'
                        WHEN 'C_OfficeID' THEN '[aspnet_users].[C_OfficeID]'
                        WHEN 'C_OfficeID DESC' THEN '[aspnet_users].[C_OfficeID] DESC'
                        WHEN 'C_DepartmentID' THEN '[aspnet_users].[C_DepartmentID]'
                        WHEN 'C_DepartmentID DESC' THEN '[aspnet_users].[C_DepartmentID] DESC'
                        WHEN 'C_ProjectSiteID' THEN '[aspnet_users].[C_ProjectSiteID]'
                        WHEN 'C_ProjectSiteID DESC' THEN '[aspnet_users].[C_ProjectSiteID] DESC'
                        WHEN 'C_DesignationID' THEN '[aspnet_users].[C_DesignationID]'
                        WHEN 'C_DesignationID DESC' THEN '[aspnet_users].[C_DesignationID] DESC'
                        WHEN 'ActiveState' THEN '[aspnet_users].[ActiveState]'
                        WHEN 'ActiveState DESC' THEN '[aspnet_users].[ActiveState] DESC'
                        ELSE '[aspnet_users].[UserName]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[aspnet_users].[UserName],
		[aspnet_users].[UserFullName],
		[aspnet_users].[LocationID],
		[aspnet_users].[ExtnNo],
		[aspnet_users].[MobileNo],
		[aspnet_users].[EMailID],
		[aspnet_users].[C_DateOfJoining],
		[aspnet_users].[C_CompanyID],
		[aspnet_users].[C_DivisionID],
		[aspnet_users].[C_OfficeID],
		[aspnet_users].[C_DepartmentID],
		[aspnet_users].[C_ProjectSiteID],
		[aspnet_users].[C_DesignationID],
		[aspnet_users].[ActiveState] 
  FROM [aspnet_users] 
    	INNER JOIN #PageIndex
          ON [aspnet_users].[UserName] = #PageIndex.UserName
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
