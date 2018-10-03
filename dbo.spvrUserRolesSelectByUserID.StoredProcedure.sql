USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrUserRolesSelectByUserID]
  @UserID NVarChar(8),
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[VR_UserRoles].[SerialNo] ,
		[VR_UserRoles].[UserID] ,
		[VR_UserRoles].[DivisionID] ,
		[VR_UserRoles].[RoleID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[HRM_Divisions2].[Description] AS HRM_Divisions2_Description 
  FROM [VR_UserRoles] 
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VR_UserRoles].[UserID] = [aspnet_Users1].[LoginID]
  INNER JOIN [HRM_Divisions] AS [HRM_Divisions2]
    ON [VR_UserRoles].[DivisionID] = [HRM_Divisions2].[DivisionID]
  WHERE
  [VR_UserRoles].[UserID] = @UserID
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [VR_UserRoles].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [VR_UserRoles].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'UserID' THEN [VR_UserRoles].[UserID] END,
     CASE @OrderBy WHEN 'UserID DESC' THEN [VR_UserRoles].[UserID] END DESC,
     CASE @OrderBy WHEN 'DivisionID' THEN [VR_UserRoles].[DivisionID] END,
     CASE @OrderBy WHEN 'DivisionID DESC' THEN [VR_UserRoles].[DivisionID] END DESC,
     CASE @OrderBy WHEN 'RoleID' THEN [VR_UserRoles].[RoleID] END,
     CASE @OrderBy WHEN 'RoleID DESC' THEN [VR_UserRoles].[RoleID] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions2_Description' THEN [HRM_Divisions2].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions2_Description DESC' THEN [HRM_Divisions2].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
