USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spasm_LG_SuppliersSelectByDescription]
  @Description NVarChar(50)  
  AS
  SELECT
		[ASM_Suppliers].[SupplierID],
		[ASM_Suppliers].[Description] 
  FROM [ASM_Suppliers] 
  WHERE
  [ASM_Suppliers].[Description] = @Description
GO
