USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRMenusInsert]
  @VRMenuName NVarChar(50),
  @ToolTip NVarChar(100),
  @ParentVRMenuID Int,
  @VRMenuType NChar(1),
  @CSSClass NVarChar(20),
  @Sequence Int,
  @ApplicationID Int,
  @Return_VRMenuID Int = null OUTPUT
  AS
  INSERT [SYS_VRMenus]
  (
   [VRMenuName]
  ,[ToolTip]
  ,[ParentVRMenuID]
  ,[VRMenuType]
  ,[CSSClass]
  ,[Sequence]
  ,[ApplicationID]
  )
  VALUES
  (
   @VRMenuName
  ,@ToolTip
  ,@ParentVRMenuID
  ,@VRMenuType
  ,@CSSClass
  ,@Sequence
  ,@ApplicationID
  )
  SET @Return_VRMenuID = Scope_Identity()
GO
