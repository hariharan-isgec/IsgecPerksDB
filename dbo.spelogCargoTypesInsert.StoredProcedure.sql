USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogCargoTypesInsert]
  @Description NVarChar(50),
  @Return_CargoTypeID Int = null OUTPUT 
  AS
  INSERT [ELOG_CargoTypes]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_CargoTypeID = Scope_Identity()
GO
