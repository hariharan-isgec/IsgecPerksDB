USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrUserRolesSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int 
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
  [VR_UserRoles].[SerialNo] = @SerialNo
GO
