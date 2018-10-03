USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spctUserDepartmentSelectByID]
  @LoginID NVarChar(8),
  @UserID NVarChar(8),
  @DepartmentID NVarChar(6) 
  AS
  SELECT
    [CT_UserDepartment].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [HRM_Departments2].[Description] AS HRM_Departments2_Description 
  FROM [CT_UserDepartment] 
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [CT_UserDepartment].[UserID] = [aspnet_users1].[LoginID]
  INNER JOIN [HRM_Departments] AS [HRM_Departments2]
    ON [CT_UserDepartment].[DepartmentID] = [HRM_Departments2].[DepartmentID]
  WHERE
  [CT_UserDepartment].[UserID] = @UserID
  AND [CT_UserDepartment].[DepartmentID] = @DepartmentID
GO
