USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtVendorSelectByID]
  @VendorID NVarChar(9) 
  AS
  SELECT
		[PMT_Vendor].[VendorID],
		[PMT_Vendor].[Description],
		[PMT_Vendor].[Active] 
  FROM [PMT_Vendor] 
  WHERE
  [PMT_Vendor].[VendorID] = @VendorID
GO
