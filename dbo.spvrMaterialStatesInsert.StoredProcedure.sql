USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrMaterialStatesInsert]
  @Description NVarChar(30),
  @Return_MaterialStateID Int = null OUTPUT 
  AS
  INSERT [VR_MaterialStates]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_MaterialStateID = Scope_Identity()
GO
