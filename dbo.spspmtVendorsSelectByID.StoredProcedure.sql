USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtVendorsSelectByID]
  @VendorID NVarChar(9) 
  AS
  SELECT
		[SPMT_Vendors].[VendorID] ,
		[SPMT_Vendors].[Description]  
  FROM [SPMT_Vendors] 
  WHERE
  [SPMT_Vendors].[VendorID] = @VendorID
GO
