USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastRAMsInsert]
  @Description NVarChar(50),
  @RamID Int = null OUTPUT
  AS
  INSERT [AST_Rams]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @RamID = Scope_Identity()
GO
