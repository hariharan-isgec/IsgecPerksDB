USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGSessionsUpdate]
  @Description NVarChar(500),
  @FileName NVarChar(50),
  @ApplicationID Int,
  @FolderLocation NVarChar(250),
  @VRMenuName NVarChar(50),
  @ToolTip NVarChar(100),
  @VRSessionType NChar(1),
  @CSSClass NVarChar(30),
  @MaintainGrid Bit,
  @InsertForm Bit,
  @UpdateForm Bit,
  @DisplayGrid Bit,
  @DisplayForm Bit,
  @DeleteOption Bit,
  @Original_VRSessionID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [SYS_VRSessions] SET 
   [Description] = @Description
  ,[FileName] = @FileName
  ,[ApplicationID] = @ApplicationID
  ,[FolderLocation] = @FolderLocation
  ,[VRMenuName] = @VRMenuName
  ,[ToolTip] = @ToolTip
  ,[VRSessionType] = @VRSessionType
  ,[CSSClass] = @CSSClass
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
