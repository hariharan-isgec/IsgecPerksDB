USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRUsersSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  UserName NVarChar(20) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (UserName) ' + 
               'SELECT [aspnet_Users].[UserName] FROM [aspnet_Users] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UserName' THEN '[aspnet_Users].[UserName]'
                        WHEN 'UserName DESC' THEN '[aspnet_Users].[UserName] DESC'
                        WHEN 'UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'UserFullName DESC' THEN '[aspnet_Users].[UserFullName] DESC'
                        ELSE '[aspnet_Users].[UserName]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[aspnet_Users].[UserName],
		[aspnet_Users].[UserFullName], 
		[aspnet_Users].[C_DateOfJoining],
		[aspnet_Users].[C_CompanyID],    
		[aspnet_Users].[C_DivisionID],   
		[aspnet_Users].[C_OfficeID],     
		[aspnet_Users].[C_DepartmentID], 
		[aspnet_Users].[C_ProjectSiteID],
		[aspnet_Users].[C_DesignationID],
		[aspnet_Users].[ActiveState]    
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
