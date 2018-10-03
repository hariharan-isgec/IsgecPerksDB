USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRolesSelectByID]
  @LoginID NVarChar(8),
  @RoleID Int 
  AS
  SELECT
		[ERP_Roles].[RoleID] ,
		[ERP_Roles].[Description]  
  FROM [ERP_Roles] 
  WHERE
  [ERP_Roles].[RoleID] = @RoleID
GO
