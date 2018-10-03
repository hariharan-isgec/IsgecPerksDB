USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogStuffingTypesInsert]
  @Description NVarChar(50),
  @Return_StuffingTypeID Int = null OUTPUT 
  AS
  INSERT [ELOG_StuffingTypes]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_StuffingTypeID = Scope_Identity()
GO
