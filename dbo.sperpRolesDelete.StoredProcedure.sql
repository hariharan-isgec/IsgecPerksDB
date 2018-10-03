USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRolesDelete]
  @Original_RoleID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ERP_Roles]
  WHERE
  [ERP_Roles].[RoleID] = @Original_RoleID
  SET @RowCount = @@RowCount
GO
