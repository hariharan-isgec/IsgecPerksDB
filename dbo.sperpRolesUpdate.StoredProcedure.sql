USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRolesUpdate]
  @Original_RoleID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ERP_Roles] SET 
   [Description] = @Description
  WHERE
  [RoleID] = @Original_RoleID
  SET @RowCount = @@RowCount
GO
