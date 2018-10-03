USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRSessionByEmployeeUpdate]
  @Original_RecordID Int, 
  @VRSessionID Int,
  @ApplicationID Int,
  @UserName NVarChar(20),
  @MaintainGrid Bit,
  @InsertForm Bit,
  @UpdateForm Bit,
  @DisplayGrid Bit,
  @DisplayForm Bit,
  @DeleteOption Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [SYS_VRSessionByEmployee] SET 
   [VRSessionID] = @VRSessionID
  ,[ApplicationID] = @ApplicationID
  ,[UserName] = @UserName
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
