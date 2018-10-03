USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmCustomersSelectListSearch]
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
 ,CustomerID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (CustomerID)
  SELECT [IDM_Customers].[CustomerID] FROM [IDM_Customers]
 WHERE  
   ( 
         LOWER(ISNULL([IDM_Customers].[CustomerID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Customers].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Customers].[ContactPerson],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Customers].[EmailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Customers].[ContactNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Customers].[Address1],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Customers].[Address2],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Customers].[Address3],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Customers].[Address4],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Customers].[ToEMailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Customers].[CCEmailID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CustomerID' THEN [IDM_Customers].[CustomerID] END,
     CASE @orderBy WHEN 'CustomerID DESC' THEN [IDM_Customers].[CustomerID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_Customers].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_Customers].[Description] END DESC,
     CASE @orderBy WHEN 'ContactPerson' THEN [IDM_Customers].[ContactPerson] END,
     CASE @orderBy WHEN 'ContactPerson DESC' THEN [IDM_Customers].[ContactPerson] END DESC,
     CASE @orderBy WHEN 'EmailID' THEN [IDM_Customers].[EmailID] END,
     CASE @orderBy WHEN 'EmailID DESC' THEN [IDM_Customers].[EmailID] END DESC,
     CASE @orderBy WHEN 'ContactNo' THEN [IDM_Customers].[ContactNo] END,
     CASE @orderBy WHEN 'ContactNo DESC' THEN [IDM_Customers].[ContactNo] END DESC,
     CASE @orderBy WHEN 'Address1' THEN [IDM_Customers].[Address1] END,
     CASE @orderBy WHEN 'Address1 DESC' THEN [IDM_Customers].[Address1] END DESC,
     CASE @orderBy WHEN 'Address2' THEN [IDM_Customers].[Address2] END,
     CASE @orderBy WHEN 'Address2 DESC' THEN [IDM_Customers].[Address2] END DESC,
     CASE @orderBy WHEN 'Address3' THEN [IDM_Customers].[Address3] END,
     CASE @orderBy WHEN 'Address3 DESC' THEN [IDM_Customers].[Address3] END DESC,
     CASE @orderBy WHEN 'Address4' THEN [IDM_Customers].[Address4] END,
     CASE @orderBy WHEN 'Address4 DESC' THEN [IDM_Customers].[Address4] END DESC,
     CASE @orderBy WHEN 'ToEMailID' THEN [IDM_Customers].[ToEMailID] END,
     CASE @orderBy WHEN 'ToEMailID DESC' THEN [IDM_Customers].[ToEMailID] END DESC,
     CASE @orderBy WHEN 'CCEmailID' THEN [IDM_Customers].[CCEmailID] END,
     CASE @orderBy WHEN 'CCEmailID DESC' THEN [IDM_Customers].[CCEmailID] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[IDM_Customers].[CustomerID] ,
		[IDM_Customers].[Description] ,
		[IDM_Customers].[ContactPerson] ,
		[IDM_Customers].[EmailID] ,
		[IDM_Customers].[ContactNo] ,
		[IDM_Customers].[Address1] ,
		[IDM_Customers].[Address2] ,
		[IDM_Customers].[Address3] ,
		[IDM_Customers].[Address4] ,
		[IDM_Customers].[ToEMailID] ,
		[IDM_Customers].[CCEmailID]  
  FROM [IDM_Customers] 
    	INNER JOIN #PageIndex
          ON [IDM_Customers].[CustomerID] = #PageIndex.CustomerID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
