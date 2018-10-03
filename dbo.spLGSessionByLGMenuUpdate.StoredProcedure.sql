USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGSessionByLGMenuUpdate]
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
  @Original_RecordID Int, 
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
