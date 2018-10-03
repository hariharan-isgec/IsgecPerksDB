USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmRatingsSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  RatingID NVarChar(3) NOT NULL
  )
  INSERT INTO #PageIndex (RatingID)
  SELECT [HRM_Ratings].[RatingID] FROM [HRM_Ratings]
 WHERE  
   ( 
         LOWER(ISNULL([HRM_Ratings].[RatingID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Ratings].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Ratings].[sequence], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'RatingID' THEN [HRM_Ratings].[RatingID] END,
     CASE @orderBy WHEN 'RatingID DESC' THEN [HRM_Ratings].[RatingID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_Ratings].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_Ratings].[Description] END DESC,
     CASE @orderBy WHEN 'sequence' THEN [HRM_Ratings].[sequence] END,
     CASE @orderBy WHEN 'sequence DESC' THEN [HRM_Ratings].[sequence] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_Ratings].[RatingID],
		[HRM_Ratings].[Description],
		[HRM_Ratings].[sequence] 
  FROM [HRM_Ratings] 
    	INNER JOIN #PageIndex
          ON [HRM_Ratings].[RatingID] = #PageIndex.RatingID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
