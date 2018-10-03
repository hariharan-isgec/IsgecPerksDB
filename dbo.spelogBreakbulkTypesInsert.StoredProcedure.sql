USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBreakbulkTypesInsert]
  @Description NVarChar(50),
  @Return_BreakbulkTypeID Int = null OUTPUT 
  AS
  INSERT [ELOG_BreakbulkTypes]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_BreakbulkTypeID = Scope_Identity()
GO
