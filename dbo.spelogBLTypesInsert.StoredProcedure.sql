USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBLTypesInsert]
  @Description NVarChar(50),
  @Return_BLTypeID Int = null OUTPUT 
  AS
  INSERT [ELOG_BLTypes]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_BLTypeID = Scope_Identity()
GO
