USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfGraphTypesInsert]
  @Description NVarChar(50),
  @Return_GraphTypeID Int = null OUTPUT 
  AS
  INSERT [WF_GraphTypes]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_GraphTypeID = Scope_Identity()
GO
