USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRSessionByVRMenuUpdate]
  @Original_RecordID Int, 
  @VRMenuID Int,
  @VRSessionID Int,
  @Sequence Int,
  @ApplicationID Int,
  @MaintainGrid Bit,
  @InsertForm Bit,
  @UpdateForm Bit,
  @DisplayGrid Bit,
  @DisplayForm Bit,
  @DeleteOption Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [SYS_VRSessionByVRMenu] SET 
   [VRMenuID] = @VRMenuID
  ,[VRSessionID] = @VRSessionID
  ,[Sequence] = @Sequence
  ,[ApplicationID] = @ApplicationID
  ,[MaintainGrid] = @MaintainGrid
  ,[InsertForm] = @InsertForm
  ,[UpdateForm] = @UpdateForm
  ,[DisplayGrid] = @DisplayGrid
  ,[DisplayForm] = @DisplayForm
  ,[DeleteOption] = @DeleteOption
  WHERE
  [RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
