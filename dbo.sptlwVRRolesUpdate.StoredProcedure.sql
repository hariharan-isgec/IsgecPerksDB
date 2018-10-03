USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRRolesUpdate]
  @Original_VRRoleID Int, 
  @Description NVarChar(50),
  @VRRoleType NVarChar(1),
  @ApplicationID Int,
  @DefaultRole Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [SYS_VRRoles] SET 
   [Description] = @Description
  ,[VRRoleType] = @VRRoleType
  ,[ApplicationID] = @ApplicationID
  ,[DefaultRole] = @DefaultRole
  WHERE
  [VRRoleID] = @Original_VRRoleID
  SET @RowCount = @@RowCount
GO
