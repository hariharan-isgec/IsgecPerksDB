USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtVendorSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[PMT_Vendor].[VendorID],
		[PMT_Vendor].[Description],
		[PMT_Vendor].[Active] 
  FROM [PMT_Vendor] 
  ORDER BY
     CASE @orderBy WHEN 'VendorID' THEN [PMT_Vendor].[VendorID] END,
     CASE @orderBy WHEN 'VendorID DESC' THEN [PMT_Vendor].[VendorID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [PMT_Vendor].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [PMT_Vendor].[Description] END DESC,
     CASE @orderBy WHEN 'Active' THEN [PMT_Vendor].[Active] END,
     CASE @orderBy WHEN 'Active DESC' THEN [PMT_Vendor].[Active] END DESC 
  SET @RecordCount = @@RowCount
GO
