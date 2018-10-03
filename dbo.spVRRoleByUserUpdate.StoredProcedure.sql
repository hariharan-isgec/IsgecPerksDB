USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRRoleByUserUpdate]
  @VRRoleID Int,
  @ApplicationID Int,
  @UserName NVarChar(20),
  @Original_RecordID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [SYS_VRRoleByEmployee] SET 
   [VRRoleID] = @VRRoleID
  ,[ApplicationID] = @ApplicationID
  ,[UserName] = @UserName
  WHERE
  [RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
