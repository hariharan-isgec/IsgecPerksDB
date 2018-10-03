USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmCustomerContactsSelectListSearch]
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
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (CustomerID, SerialNo)
  SELECT [IDM_CustomerContacts].[CustomerID], [IDM_CustomerContacts].[SerialNo] FROM [IDM_CustomerContacts]
  INNER JOIN [IDM_Customers] AS [IDM_Customers1]
    ON [IDM_CustomerContacts].[CustomerID] = [IDM_Customers1].[CustomerID]
 WHERE  
   ( 
         LOWER(ISNULL([IDM_CustomerContacts].[CustomerID],'')) LIKE @KeyWord1
     OR STR(ISNULL([IDM_CustomerContacts].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_CustomerContacts].[ContactPerson],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_CustomerContacts].[EmailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_CustomerContacts].[ContactNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_CustomerContacts].[Address1],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_CustomerContacts].[Address2],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_CustomerContacts].[Address3],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_CustomerContacts].[Address4],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_CustomerContacts].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_CustomerContacts].[CCEmailID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CustomerID' THEN [IDM_CustomerContacts].[CustomerID] END,
     CASE @orderBy WHEN 'CustomerID DESC' THEN [IDM_CustomerContacts].[CustomerID] END DESC,
     CASE @orderBy WHEN 'SerialNo' THEN [IDM_CustomerContacts].[SerialNo] END,
     CASE @orderBy WHEN 'SerialNo DESC' THEN [IDM_CustomerContacts].[SerialNo] END DESC,
     CASE @orderBy WHEN 'ContactPerson' THEN [IDM_CustomerContacts].[ContactPerson] END,
     CASE @orderBy WHEN 'ContactPerson DESC' THEN [IDM_CustomerContacts].[ContactPerson] END DESC,
     CASE @orderBy WHEN 'EmailID' THEN [IDM_CustomerContacts].[EmailID] END,
     CASE @orderBy WHEN 'EmailID DESC' THEN [IDM_CustomerContacts].[EmailID] END DESC,
     CASE @orderBy WHEN 'ContactNo' THEN [IDM_CustomerContacts].[ContactNo] END,
     CASE @orderBy WHEN 'ContactNo DESC' THEN [IDM_CustomerContacts].[ContactNo] END DESC,
     CASE @orderBy WHEN 'Address1' THEN [IDM_CustomerContacts].[Address1] END,
     CASE @orderBy WHEN 'Address1 DESC' THEN [IDM_CustomerContacts].[Address1] END DESC,
     CASE @orderBy WHEN 'Address2' THEN [IDM_CustomerContacts].[Address2] END,
     CASE @orderBy WHEN 'Address2 DESC' THEN [IDM_CustomerContacts].[Address2] END DESC,
     CASE @orderBy WHEN 'Address3' THEN [IDM_CustomerContacts].[Address3] END,
     CASE @orderBy WHEN 'Address3 DESC' THEN [IDM_CustomerContacts].[Address3] END DESC,
     CASE @orderBy WHEN 'Address4' THEN [IDM_CustomerContacts].[Address4] END,
     CASE @orderBy WHEN 'Address4 DESC' THEN [IDM_CustomerContacts].[Address4] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [IDM_CustomerContacts].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [IDM_CustomerContacts].[Remarks] END DESC,
     CASE @orderBy WHEN 'CCEmailID' THEN [IDM_CustomerContacts].[CCEmailID] END,
     CASE @orderBy WHEN 'CCEmailID DESC' THEN [IDM_CustomerContacts].[CCEmailID] END DESC,
     CASE @orderBy WHEN 'IDM_Customers1_Description' THEN [IDM_Customers1].[Description] END,
     CASE @orderBy WHEN 'IDM_Customers1_Description DESC' THEN [IDM_Customers1].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[IDM_CustomerContacts].[CustomerID] ,
		[IDM_CustomerContacts].[SerialNo] ,
		[IDM_CustomerContacts].[ContactPerson] ,
		[IDM_CustomerContacts].[EmailID] ,
		[IDM_CustomerContacts].[ContactNo] ,
		[IDM_CustomerContacts].[Address1] ,
		[IDM_CustomerContacts].[Address2] ,
		[IDM_CustomerContacts].[Address3] ,
		[IDM_CustomerContacts].[Address4] ,
		[IDM_CustomerContacts].[Remarks] ,
		[IDM_CustomerContacts].[CCEmailID] ,
		[IDM_Customers1].[Description] AS IDM_Customers1_Description 
  FROM [IDM_CustomerContacts] 
    	INNER JOIN #PageIndex
          ON [IDM_CustomerContacts].[CustomerID] = #PageIndex.CustomerID
          AND [IDM_CustomerContacts].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [IDM_Customers] AS [IDM_Customers1]
    ON [IDM_CustomerContacts].[CustomerID] = [IDM_Customers1].[CustomerID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
