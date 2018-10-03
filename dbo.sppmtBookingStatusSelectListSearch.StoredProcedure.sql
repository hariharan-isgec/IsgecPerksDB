USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtBookingStatusSelectListSearch]
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
 ,StatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (StatusID)
  SELECT [PMT_BookingStatus].[StatusID] FROM [PMT_BookingStatus]
 WHERE  
   ( 
         STR(ISNULL([PMT_BookingStatus].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_BookingStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'StatusID' THEN [PMT_BookingStatus].[StatusID] END,
     CASE @orderBy WHEN 'StatusID DESC' THEN [PMT_BookingStatus].[StatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [PMT_BookingStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [PMT_BookingStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[PMT_BookingStatus].[StatusID],
		[PMT_BookingStatus].[Description] 
  FROM [PMT_BookingStatus] 
    	INNER JOIN #PageIndex
          ON [PMT_BookingStatus].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
