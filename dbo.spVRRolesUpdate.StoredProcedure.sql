USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRRolesUpdate]
  @Description NVarChar(50),
  @VRRoleType NVarChar(1),
  @ApplicationID Int,
  @Original_VRRoleID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [SYS_VRRoles] SET 
   [Description] = @Description
  ,[VRRoleType] = @VRRoleType
  ,[ApplicationID] = @ApplicationID
  WHERE
  [VRRoleID] = @Original_VRRoleID
  SET @RowCount = @@RowCount
GO
