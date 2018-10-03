USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmVendorsSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,VendorID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (VendorID)
  SELECT [IDM_Vendors].[VendorID] FROM [IDM_Vendors]
 WHERE  
   ( 
         LOWER(ISNULL([IDM_Vendors].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Vendors].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Vendors].[ContactPerson],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Vendors].[EmailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Vendors].[ContactNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Vendors].[Address1],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Vendors].[Address2],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Vendors].[Address3],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Vendors].[Address4],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Vendors].[ToEMailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Vendors].[CCEmailID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'VendorID' THEN [IDM_Vendors].[VendorID] END,
     CASE @orderBy WHEN 'VendorID DESC' THEN [IDM_Vendors].[VendorID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_Vendors].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_Vendors].[Description] END DESC,
     CASE @orderBy WHEN 'ContactPerson' THEN [IDM_Vendors].[ContactPerson] END,
     CASE @orderBy WHEN 'ContactPerson DESC' THEN [IDM_Vendors].[ContactPerson] END DESC,
     CASE @orderBy WHEN 'EmailID' THEN [IDM_Vendors].[EmailID] END,
     CASE @orderBy WHEN 'EmailID DESC' THEN [IDM_Vendors].[EmailID] END DESC,
     CASE @orderBy WHEN 'ContactNo' THEN [IDM_Vendors].[ContactNo] END,
     CASE @orderBy WHEN 'ContactNo DESC' THEN [IDM_Vendors].[ContactNo] END DESC,
     CASE @orderBy WHEN 'Address1' THEN [IDM_Vendors].[Address1] END,
     CASE @orderBy WHEN 'Address1 DESC' THEN [IDM_Vendors].[Address1] END DESC,
     CASE @orderBy WHEN 'Address2' THEN [IDM_Vendors].[Address2] END,
     CASE @orderBy WHEN 'Address2 DESC' THEN [IDM_Vendors].[Address2] END DESC,
     CASE @orderBy WHEN 'Address3' THEN [IDM_Vendors].[Address3] END,
     CASE @orderBy WHEN 'Address3 DESC' THEN [IDM_Vendors].[Address3] END DESC,
     CASE @orderBy WHEN 'Address4' THEN [IDM_Vendors].[Address4] END,
     CASE @orderBy WHEN 'Address4 DESC' THEN [IDM_Vendors].[Address4] END DESC,
     CASE @orderBy WHEN 'ToEMailID' THEN [IDM_Vendors].[ToEMailID] END,
     CASE @orderBy WHEN 'ToEMailID DESC' THEN [IDM_Vendors].[ToEMailID] END DESC,
     CASE @orderBy WHEN 'CCEmailID' THEN [IDM_Vendors].[CCEmailID] END,
     CASE @orderBy WHEN 'CCEmailID DESC' THEN [IDM_Vendors].[CCEmailID] END DESC 

    SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [IDM_Vendors].[VendorID] = #PageIndex.VendorID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
