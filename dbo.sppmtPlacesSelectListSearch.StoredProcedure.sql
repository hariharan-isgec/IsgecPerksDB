USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtPlacesSelectListSearch]
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
 ,PlaceID NVarChar(30) NOT NULL
  )
  INSERT INTO #PageIndex (PlaceID)
  SELECT [PMT_Places].[PlaceID] FROM [PMT_Places]
 WHERE  
   ( 
         LOWER(ISNULL([PMT_Places].[PlaceID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_Places].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'PlaceID' THEN [PMT_Places].[PlaceID] END,
     CASE @orderBy WHEN 'PlaceID DESC' THEN [PMT_Places].[PlaceID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [PMT_Places].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [PMT_Places].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[PMT_Places].[PlaceID],
		[PMT_Places].[Description] 
  FROM [PMT_Places] 
    	INNER JOIN #PageIndex
          ON [PMT_Places].[PlaceID] = #PageIndex.PlaceID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
