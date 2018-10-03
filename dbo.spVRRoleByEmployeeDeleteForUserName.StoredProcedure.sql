USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spVRRoleByEmployeeDeleteForUserName]
  @UserName NVarChar(20),
  @RowCount int = null OUTPUT
  AS
  DELETE [SYS_VRRoleByEmployee]
  WHERE
  [SYS_VRRoleByEmployee].[UserName] = @UserName
  SET @RowCount = @@RowCount
GO
