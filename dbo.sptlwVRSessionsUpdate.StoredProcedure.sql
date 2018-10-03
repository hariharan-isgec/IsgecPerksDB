USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRSessionsUpdate]
  @Original_VRSessionID Int, 
  @FileName NVarChar(50),
  @Description NVarChar(500),
  @FolderLocation NVarChar(250),
  @VRMenuName NVarChar(50),
  @ToolTip NVarChar(100),
  @VRSessionType NChar(1),
  @CSSClass NVarChar(30),
  @ApplicationID Int,
  @MaintainGrid Bit,
  @InsertForm Bit,
  @UpdateForm Bit,
  @DisplayGrid Bit,
  @DisplayForm Bit,
  @DeleteOption Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [SYS_VRSessions] SET 
   [FileName] = @FileName
  ,[Description] = @Description
  ,[FolderLocation] = @FolderLocation
  ,[VRMenuName] = @VRMenuName
  ,[ToolTip] = @ToolTip
  ,[VRSessionType] = @VRSessionType
  ,[CSSClass] = @CSSClass
  ,[ApplicationID] = @ApplicationID
  ,[MaintainGrid] = @MaintainGrid
  ,[InsertForm] = @InsertForm
  ,[UpdateForm] = @UpdateForm
  ,[DisplayGrid] = @DisplayGrid
  ,[DisplayForm] = @DisplayForm
  ,[DeleteOption] = @DeleteOption
  WHERE
  [VRSessionID] = @Original_VRSessionID
  SET @RowCount = @@RowCount
GO
