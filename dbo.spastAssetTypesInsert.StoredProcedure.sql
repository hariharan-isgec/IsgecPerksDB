USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetTypesInsert]
  @Description NVarChar(30),
  @AssetTypeID Int = null OUTPUT
  AS
  INSERT [AST_AssetTypes]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @AssetTypeID = Scope_Identity()
GO
