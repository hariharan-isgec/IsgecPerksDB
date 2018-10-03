USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRMenusUpdate]
  @VRMenuName NVarChar(50),
  @ToolTip NVarChar(100),
  @ParentVRMenuID Int,
  @VRMenuType NChar(1),
  @CSSClass NVarChar(20),
  @Sequence Int,
  @ApplicationID Int,
  @Original_VRMenuID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [SYS_VRMenus] SET 
   [VRMenuName] = @VRMenuName
  ,[ToolTip] = @ToolTip
  ,[ParentVRMenuID] = @ParentVRMenuID
  ,[VRMenuType] = @VRMenuType
  ,[CSSClass] = @CSSClass
  ,[Sequence] = @Sequence
  ,[ApplicationID] = @ApplicationID
  WHERE
  [VRMenuID] = @Original_VRMenuID
  SET @RowCount = @@RowCount
GO
