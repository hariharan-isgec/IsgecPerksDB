USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRolesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ERP_Roles].[RoleID] ,
		[ERP_Roles].[Description]  
  FROM [ERP_Roles] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'RoleID' THEN [ERP_Roles].[RoleID] END,
     CASE @OrderBy WHEN 'RoleID DESC' THEN [ERP_Roles].[RoleID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ERP_Roles].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ERP_Roles].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
