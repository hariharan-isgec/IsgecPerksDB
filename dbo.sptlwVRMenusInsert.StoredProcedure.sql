USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRMenusInsert]
  @VRMenuName NVarChar(50),
  @ParentVRMenuID Int,
  @ToolTip NVarChar(100),
  @VRMenuType NChar(1),
  @CSSClass NVarChar(20),
  @Sequence Int,
  @ApplicationID Int,
  @Return_VRMenuID Int = null OUTPUT 
  AS
  INSERT [SYS_VRMenus]
  (
   [VRMenuName]
  ,[ParentVRMenuID]
  ,[ToolTip]
  ,[VRMenuType]
  ,[CSSClass]
  ,[Sequence]
  ,[ApplicationID]
  )
  VALUES
  (
   @VRMenuName
  ,@ParentVRMenuID
  ,@ToolTip
  ,@VRMenuType
  ,@CSSClass
  ,@Sequence
  ,@ApplicationID
  )
  SET @Return_VRMenuID = Scope_Identity()
GO
