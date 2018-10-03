USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmIssuedViaSelectListSearch]
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
 ,IssuedViaID Int NOT NULL
  )
  INSERT INTO #PageIndex (IssuedViaID)
  SELECT [IDM_IssuedVia].[IssuedViaID] FROM [IDM_IssuedVia]
 WHERE  
   ( 
         STR(ISNULL([IDM_IssuedVia].[IssuedViaID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_IssuedVia].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'IssuedViaID' THEN [IDM_IssuedVia].[IssuedViaID] END,
     CASE @orderBy WHEN 'IssuedViaID DESC' THEN [IDM_IssuedVia].[IssuedViaID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_IssuedVia].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_IssuedVia].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[IDM_IssuedVia].[IssuedViaID] ,
		[IDM_IssuedVia].[Description]  
  FROM [IDM_IssuedVia] 
    	INNER JOIN #PageIndex
          ON [IDM_IssuedVia].[IssuedViaID] = #PageIndex.IssuedViaID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
