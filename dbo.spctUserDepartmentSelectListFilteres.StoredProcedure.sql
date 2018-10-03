USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spctUserDepartmentSelectListFilteres]
  @Filter_UserID NVarChar(8),
  @Filter_DepartmentID NVarChar(6),
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,UserID NVarChar(8) NOT NULL
 ,DepartmentID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'UserID'
  SET @LGSQL = @LGSQL + ', DepartmentID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[CT_UserDepartment].[UserID]'
  SET @LGSQL = @LGSQL + ', [CT_UserDepartment].[DepartmentID]'
  SET @LGSQL = @LGSQL + ' FROM [CT_UserDepartment] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [CT_UserDepartment].[UserID] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Departments] AS [HRM_Departments2]'
  SET @LGSQL = @LGSQL + '    ON [CT_UserDepartment].[DepartmentID] = [HRM_Departments2].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_UserID > '') 
    SET @LGSQL = @LGSQL + ' AND [CT_UserDepartment].[UserID] = ''' + @Filter_UserID + ''''
  IF (@Filter_DepartmentID > '') 
    SET @LGSQL = @LGSQL + ' AND [CT_UserDepartment].[DepartmentID] = ''' + @Filter_DepartmentID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UserID' THEN '[CT_UserDepartment].[UserID]'
                        WHEN 'UserID DESC' THEN '[CT_UserDepartment].[UserID] DESC'
                        WHEN 'DepartmentID' THEN '[CT_UserDepartment].[DepartmentID]'
                        WHEN 'DepartmentID DESC' THEN '[CT_UserDepartment].[DepartmentID] DESC'
                        WHEN 'IsActive' THEN '[CT_UserDepartment].[IsActive]'
                        WHEN 'IsActive DESC' THEN '[CT_UserDepartment].[IsActive] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'HRM_Departments2_Description' THEN '[HRM_Departments2].[Description]'
                        WHEN 'HRM_Departments2_Description DESC' THEN '[HRM_Departments2].[Description] DESC'
                        ELSE '[CT_UserDepartment].[UserID],[CT_UserDepartment].[DepartmentID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [CT_UserDepartment].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [HRM_Departments2].[Description] AS HRM_Departments2_Description 
  FROM [CT_UserDepartment] 
      INNER JOIN #PageIndex
          ON [CT_UserDepartment].[UserID] = #PageIndex.UserID
          AND [CT_UserDepartment].[DepartmentID] = #PageIndex.DepartmentID
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [CT_UserDepartment].[UserID] = [aspnet_users1].[LoginID]
  INNER JOIN [HRM_Departments] AS [HRM_Departments2]
    ON [CT_UserDepartment].[DepartmentID] = [HRM_Departments2].[DepartmentID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
