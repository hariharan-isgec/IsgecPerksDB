USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmVendorsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[IDM_Vendors].[VendorID] ,
		[IDM_Vendors].[Description] ,
		[IDM_Vendors].[ContactPerson] ,
		[IDM_Vendors].[EmailID] ,
		[IDM_Vendors].[ContactNo] ,
		[IDM_Vendors].[Address1] ,
		[IDM_Vendors].[Address2] ,
		[IDM_Vendors].[Address3] ,
		[IDM_Vendors].[Address4] ,
		[IDM_Vendors].[ToEMailID] ,
		[IDM_Vendors].[CCEmailID]  
  FROM [IDM_Vendors] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'VendorID' THEN [IDM_Vendors].[VendorID] END,
     CASE @OrderBy WHEN 'VendorID DESC' THEN [IDM_Vendors].[VendorID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [IDM_Vendors].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [IDM_Vendors].[Description] END DESC,
     CASE @OrderBy WHEN 'ContactPerson' THEN [IDM_Vendors].[ContactPerson] END,
     CASE @OrderBy WHEN 'ContactPerson DESC' THEN [IDM_Vendors].[ContactPerson] END DESC,
     CASE @OrderBy WHEN 'EmailID' THEN [IDM_Vendors].[EmailID] END,
     CASE @OrderBy WHEN 'EmailID DESC' THEN [IDM_Vendors].[EmailID] END DESC,
     CASE @OrderBy WHEN 'ContactNo' THEN [IDM_Vendors].[ContactNo] END,
     CASE @OrderBy WHEN 'ContactNo DESC' THEN [IDM_Vendors].[ContactNo] END DESC,
     CASE @OrderBy WHEN 'Address1' THEN [IDM_Vendors].[Address1] END,
     CASE @OrderBy WHEN 'Address1 DESC' THEN [IDM_Vendors].[Address1] END DESC,
     CASE @OrderBy WHEN 'Address2' THEN [IDM_Vendors].[Address2] END,
     CASE @OrderBy WHEN 'Address2 DESC' THEN [IDM_Vendors].[Address2] END DESC,
     CASE @OrderBy WHEN 'Address3' THEN [IDM_Vendors].[Address3] END,
     CASE @OrderBy WHEN 'Address3 DESC' THEN [IDM_Vendors].[Address3] END DESC,
     CASE @OrderBy WHEN 'Address4' THEN [IDM_Vendors].[Address4] END,
     CASE @OrderBy WHEN 'Address4 DESC' THEN [IDM_Vendors].[Address4] END DESC,
     CASE @OrderBy WHEN 'ToEMailID' THEN [IDM_Vendors].[ToEMailID] END,
     CASE @OrderBy WHEN 'ToEMailID DESC' THEN [IDM_Vendors].[ToEMailID] END DESC,
     CASE @OrderBy WHEN 'CCEmailID' THEN [IDM_Vendors].[CCEmailID] END,
     CASE @OrderBy WHEN 'CCEmailID DESC' THEN [IDM_Vendors].[CCEmailID] END DESC 
  SET @RecordCount = @@RowCount
GO
