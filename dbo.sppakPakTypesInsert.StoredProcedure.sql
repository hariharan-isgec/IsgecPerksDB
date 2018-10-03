USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPakTypesInsert]
  @Description NVarChar(50),
  @Return_PackTypeID Int = null OUTPUT 
  AS
  INSERT [PAK_PakTypes]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_PackTypeID = Scope_Identity()
GO
