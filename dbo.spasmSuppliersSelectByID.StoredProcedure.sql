USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmSuppliersSelectByID]
  @SupplierID Int 
  AS
  SELECT
		[ASM_Suppliers].[SupplierID],
		[ASM_Suppliers].[Description] 
  FROM [ASM_Suppliers] 
  WHERE
  [ASM_Suppliers].[SupplierID] = @SupplierID
GO
