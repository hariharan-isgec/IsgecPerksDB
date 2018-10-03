USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastBrandsInsert]
  @Description NVarChar(50),
  @BrandID Int = null OUTPUT
  AS
  INSERT [AST_Brands]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @BrandID = Scope_Identity()
GO
