USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGRolesDelete]
  @Original_VRRoleID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SYS_VRRoles]
  WHERE
  [SYS_VRRoles].[VRRoleID] = @Original_VRRoleID
  SET @RowCount = @@RowCount
GO
