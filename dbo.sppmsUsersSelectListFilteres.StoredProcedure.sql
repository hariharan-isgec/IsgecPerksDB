USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsUsersSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @ActiveState Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,LoginID NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'LoginID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[aspnet_Users].[LoginID]'
  SET @LGSQL = @LGSQL + ' FROM [aspnet_Users] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [aspnet_Users].[ActiveState] = ''' + CONVERT(NVarChar(10), @ActiveState) + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'LoginID' THEN '[aspnet_Users].[LoginID]'
                        WHEN 'LoginID DESC' THEN '[aspnet_Users].[LoginID] DESC'
                        WHEN 'UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'UserFullName DESC' THEN '[aspnet_Users].[UserFullName] DESC'
                        WHEN 'UserName' THEN '[aspnet_Users].[UserName]'
                        WHEN 'UserName DESC' THEN '[aspnet_Users].[UserName] DESC'
                        WHEN 'Contractual' THEN '[aspnet_Users].[Contractual]'
                        WHEN 'Contractual DESC' THEN '[aspnet_Users].[Contractual] DESC'
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
                        ELSE '[aspnet_Users].[LoginID]'
                    END
  EXEC (@LGSQL)

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
