USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRMenusUpdate]
  @Original_VRMenuID Int, 
  @VRMenuName NVarChar(50),
  @ParentVRMenuID Int,
  @ToolTip NVarChar(100),
  @VRMenuType NChar(1),
  @CSSClass NVarChar(20),
  @Sequence Int,
  @ApplicationID Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [SYS_VRMenus] SET 
   [VRMenuName] = @VRMenuName
  ,[ParentVRMenuID] = @ParentVRMenuID
  ,[ToolTip] = @ToolTip
  ,[VRMenuType] = @VRMenuType
  ,[CSSClass] = @CSSClass
  ,[Sequence] = @Sequence
  ,[ApplicationID] = @ApplicationID
  WHERE
  [VRMenuID] = @Original_VRMenuID
  SET @RowCount = @@RowCount
GO
