USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRMenuByVRRoleUpdate]
  @VRRoleID Int,
  @VRMenuID Int,
  @Sequence Int,
  @ApplicationID Int,
  @Original_RecordID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [SYS_VRMenuByVRRole] SET 
   [VRRoleID] = @VRRoleID
  ,[VRMenuID] = @VRMenuID
  ,[Sequence] = @Sequence
  ,[ApplicationID] = @ApplicationID
  WHERE
  [RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
