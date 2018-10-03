USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppsfSupplierSelectByID]
  @LoginID NVarChar(8),
  @SupplierID NVarChar(9) 
  AS
  SELECT
    [PSF_Supplier].*  
  FROM [PSF_Supplier] 
  WHERE
  [PSF_Supplier].[SupplierID] = @SupplierID
GO
