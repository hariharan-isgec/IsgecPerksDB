USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spctUserDepartmentSelectListSearch]
  @LoginID NVarChar(8),
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
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,UserID NVarChar(8) NOT NULL
 ,DepartmentID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (UserID, DepartmentID)
  SELECT [CT_UserDepartment].[UserID], [CT_UserDepartment].[DepartmentID] FROM [CT_UserDepartment]
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [CT_UserDepartment].[UserID] = [aspnet_users1].[LoginID]
  INNER JOIN [HRM_Departments] AS [HRM_Departments2]
    ON [CT_UserDepartment].[DepartmentID] = [HRM_Departments2].[DepartmentID]
 WHERE  
   ( 
         LOWER(ISNULL([CT_UserDepartment].[UserID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([CT_UserDepartment].[DepartmentID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'UserID' THEN [CT_UserDepartment].[UserID] END,
     CASE @OrderBy WHEN 'UserID DESC' THEN [CT_UserDepartment].[UserID] END DESC,
     CASE @OrderBy WHEN 'DepartmentID' THEN [CT_UserDepartment].[DepartmentID] END,
     CASE @OrderBy WHEN 'DepartmentID DESC' THEN [CT_UserDepartment].[DepartmentID] END DESC,
     CASE @OrderBy WHEN 'IsActive' THEN [CT_UserDepartment].[IsActive] END,
     CASE @OrderBy WHEN 'IsActive DESC' THEN [CT_UserDepartment].[IsActive] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Departments2_Description' THEN [HRM_Departments2].[Description] END,
     CASE @OrderBy WHEN 'HRM_Departments2_Description DESC' THEN [HRM_Departments2].[Description] END DESC 

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
