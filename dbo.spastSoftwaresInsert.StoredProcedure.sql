USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastSoftwaresInsert]
  @Description NVarChar(100),
  @SoftwareID Int = null OUTPUT
  AS
  INSERT [AST_Softwares]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @SoftwareID = Scope_Identity()
GO
