USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtPlacesSelectListSearch]
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
  SELECT [SPMT_Places].[PlaceID] FROM [SPMT_Places]
 WHERE  
   ( 
         LOWER(ISNULL([SPMT_Places].[PlaceID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_Places].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'PlaceID' THEN [SPMT_Places].[PlaceID] END,
     CASE @orderBy WHEN 'PlaceID DESC' THEN [SPMT_Places].[PlaceID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [SPMT_Places].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [SPMT_Places].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[SPMT_Places].[PlaceID] ,
		[SPMT_Places].[Description]  
  FROM [SPMT_Places] 
    	INNER JOIN #PageIndex
          ON [SPMT_Places].[PlaceID] = #PageIndex.PlaceID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
