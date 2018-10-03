USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlMaterialStateInsert]
  @Description NVarChar(50),
  @Return_StateID Int = null OUTPUT 
  AS
  INSERT [EITL_MaterialState]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_StateID = Scope_Identity()
GO
