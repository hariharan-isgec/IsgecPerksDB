USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtVendorsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[SPMT_Vendors].[VendorID] ,
		[SPMT_Vendors].[Description]  
  FROM [SPMT_Vendors] 
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'VendorID' THEN [SPMT_Vendors].[VendorID] END,
     CASE @orderBy WHEN 'VendorID DESC' THEN [SPMT_Vendors].[VendorID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [SPMT_Vendors].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [SPMT_Vendors].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
