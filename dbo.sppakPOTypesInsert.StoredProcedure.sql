USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOTypesInsert]
  @Description NVarChar(50),
  @Return_POTypeID Int = null OUTPUT 
  AS
  INSERT [PAK_POTypes]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_POTypeID = Scope_Identity()
GO
