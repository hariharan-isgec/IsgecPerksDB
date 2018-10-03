USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpntProjectsSelectListSearch]
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
 ,ProjectID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (ProjectID)
  SELECT [IDM_Projects].[ProjectID] FROM [IDM_Projects]
 WHERE  
   ( 
         LOWER(ISNULL([IDM_Projects].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[CustomerOrderReference],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[ContactPerson],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[EmailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[ContactNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[Address1],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[Address2],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[Address3],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[Address4],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[ToEMailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects].[CCEmailID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'ProjectID' THEN [IDM_Projects].[ProjectID] END,
     CASE @orderBy WHEN 'ProjectID DESC' THEN [IDM_Projects].[ProjectID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_Projects].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_Projects].[Description] END DESC,
     CASE @orderBy WHEN 'CustomerOrderReference' THEN [IDM_Projects].[CustomerOrderReference] END,
     CASE @orderBy WHEN 'CustomerOrderReference DESC' THEN [IDM_Projects].[CustomerOrderReference] END DESC,
     CASE @orderBy WHEN 'ContactPerson' THEN [IDM_Projects].[ContactPerson] END,
     CASE @orderBy WHEN 'ContactPerson DESC' THEN [IDM_Projects].[ContactPerson] END DESC,
     CASE @orderBy WHEN 'EmailID' THEN [IDM_Projects].[EmailID] END,
     CASE @orderBy WHEN 'EmailID DESC' THEN [IDM_Projects].[EmailID] END DESC,
     CASE @orderBy WHEN 'ContactNo' THEN [IDM_Projects].[ContactNo] END,
     CASE @orderBy WHEN 'ContactNo DESC' THEN [IDM_Projects].[ContactNo] END DESC,
     CASE @orderBy WHEN 'Address1' THEN [IDM_Projects].[Address1] END,
     CASE @orderBy WHEN 'Address1 DESC' THEN [IDM_Projects].[Address1] END DESC,
     CASE @orderBy WHEN 'Address2' THEN [IDM_Projects].[Address2] END,
     CASE @orderBy WHEN 'Address2 DESC' THEN [IDM_Projects].[Address2] END DESC,
     CASE @orderBy WHEN 'Address3' THEN [IDM_Projects].[Address3] END,
     CASE @orderBy WHEN 'Address3 DESC' THEN [IDM_Projects].[Address3] END DESC,
     CASE @orderBy WHEN 'Address4' THEN [IDM_Projects].[Address4] END,
     CASE @orderBy WHEN 'Address4 DESC' THEN [IDM_Projects].[Address4] END DESC,
     CASE @orderBy WHEN 'ToEMailID' THEN [IDM_Projects].[ToEMailID] END,
     CASE @orderBy WHEN 'ToEMailID DESC' THEN [IDM_Projects].[ToEMailID] END DESC,
     CASE @orderBy WHEN 'CCEmailID' THEN [IDM_Projects].[CCEmailID] END,
     CASE @orderBy WHEN 'CCEmailID DESC' THEN [IDM_Projects].[CCEmailID] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[IDM_Projects].[ProjectID] ,
		[IDM_Projects].[Description] ,
		[IDM_Projects].[CustomerOrderReference] ,
		[IDM_Projects].[ContactPerson] ,
		[IDM_Projects].[EmailID] ,
		[IDM_Projects].[ContactNo] ,
		[IDM_Projects].[Address1] ,
		[IDM_Projects].[Address2] ,
		[IDM_Projects].[Address3] ,
		[IDM_Projects].[Address4] ,
		[IDM_Projects].[ToEMailID] ,
		[IDM_Projects].[CCEmailID]  
  FROM [IDM_Projects] 
    	INNER JOIN #PageIndex
          ON [IDM_Projects].[ProjectID] = #PageIndex.ProjectID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
