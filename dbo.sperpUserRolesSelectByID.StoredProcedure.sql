USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpUserRolesSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int 
  AS
  SELECT
		[ERP_UserRoles].[SerialNo] ,
		[ERP_UserRoles].[RequesterID] ,
		[ERP_UserRoles].[ApproverID] ,
		[ERP_UserRoles].[RoleID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[ERP_Roles3].[Description] AS ERP_Roles3_Description 
  FROM [ERP_UserRoles] 
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [ERP_UserRoles].[RequesterID] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [ERP_UserRoles].[ApproverID] = [aspnet_Users2].[LoginID]
  INNER JOIN [ERP_Roles] AS [ERP_Roles3]
    ON [ERP_UserRoles].[RoleID] = [ERP_Roles3].[RoleID]
  WHERE
  [ERP_UserRoles].[SerialNo] = @SerialNo
GO
