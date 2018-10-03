USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmSuppliersInsert]
  @Description NVarChar(50),
  @Return_SupplierID Int = null OUTPUT
  AS
  INSERT [ASM_Suppliers]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_SupplierID = Scope_Identity()
GO
