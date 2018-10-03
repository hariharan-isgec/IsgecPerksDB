USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrUserRolesUpdate]
  @Original_SerialNo Int, 
  @UserID NVarChar(8),
  @DivisionID NVarChar(6),
  @RoleID NVarChar(15),
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_UserRoles] SET 
   [UserID] = @UserID
  ,[DivisionID] = @DivisionID
  ,[RoleID] = @RoleID
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
