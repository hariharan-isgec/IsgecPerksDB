USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastSuppliersInsert]
  @Description NVarChar(30),
  @SupplierID Int = null OUTPUT
  AS
  INSERT [AST_Suppliers]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @SupplierID = Scope_Identity()
GO
