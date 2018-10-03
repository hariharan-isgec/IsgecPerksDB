USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmVendorContactsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[IDM_VendorContacts].[VendorID] ,
		[IDM_VendorContacts].[SerialNo] ,
		[IDM_VendorContacts].[ContactPerson] ,
		[IDM_VendorContacts].[EmailID] ,
		[IDM_VendorContacts].[ContactNo] ,
		[IDM_VendorContacts].[Address1] ,
		[IDM_VendorContacts].[Address2] ,
		[IDM_VendorContacts].[Address3] ,
		[IDM_VendorContacts].[Address4] ,
		[IDM_VendorContacts].[Remarks] ,
		[IDM_VendorContacts].[CCEmailID] ,
		[IDM_Vendors1].[Description] AS IDM_Vendors1_Description 
  FROM [IDM_VendorContacts] 
  INNER JOIN [IDM_Vendors] AS [IDM_Vendors1]
    ON [IDM_VendorContacts].[VendorID] = [IDM_Vendors1].[VendorID]
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'VendorID' THEN [IDM_VendorContacts].[VendorID] END,
     CASE @orderBy WHEN 'VendorID DESC' THEN [IDM_VendorContacts].[VendorID] END DESC,
     CASE @orderBy WHEN 'SerialNo' THEN [IDM_VendorContacts].[SerialNo] END,
     CASE @orderBy WHEN 'SerialNo DESC' THEN [IDM_VendorContacts].[SerialNo] END DESC,
     CASE @orderBy WHEN 'ContactPerson' THEN [IDM_VendorContacts].[ContactPerson] END,
     CASE @orderBy WHEN 'ContactPerson DESC' THEN [IDM_VendorContacts].[ContactPerson] END DESC,
     CASE @orderBy WHEN 'EmailID' THEN [IDM_VendorContacts].[EmailID] END,
     CASE @orderBy WHEN 'EmailID DESC' THEN [IDM_VendorContacts].[EmailID] END DESC,
     CASE @orderBy WHEN 'ContactNo' THEN [IDM_VendorContacts].[ContactNo] END,
     CASE @orderBy WHEN 'ContactNo DESC' THEN [IDM_VendorContacts].[ContactNo] END DESC,
     CASE @orderBy WHEN 'Address1' THEN [IDM_VendorContacts].[Address1] END,
     CASE @orderBy WHEN 'Address1 DESC' THEN [IDM_VendorContacts].[Address1] END DESC,
     CASE @orderBy WHEN 'Address2' THEN [IDM_VendorContacts].[Address2] END,
     CASE @orderBy WHEN 'Address2 DESC' THEN [IDM_VendorContacts].[Address2] END DESC,
     CASE @orderBy WHEN 'Address3' THEN [IDM_VendorContacts].[Address3] END,
     CASE @orderBy WHEN 'Address3 DESC' THEN [IDM_VendorContacts].[Address3] END DESC,
     CASE @orderBy WHEN 'Address4' THEN [IDM_VendorContacts].[Address4] END,
     CASE @orderBy WHEN 'Address4 DESC' THEN [IDM_VendorContacts].[Address4] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [IDM_VendorContacts].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [IDM_VendorContacts].[Remarks] END DESC,
     CASE @orderBy WHEN 'CCEmailID' THEN [IDM_VendorContacts].[CCEmailID] END,
     CASE @orderBy WHEN 'CCEmailID DESC' THEN [IDM_VendorContacts].[CCEmailID] END DESC,
     CASE @orderBy WHEN 'IDM_Vendors1_Description' THEN [IDM_Vendors1].[Description] END,
     CASE @orderBy WHEN 'IDM_Vendors1_Description DESC' THEN [IDM_Vendors1].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
