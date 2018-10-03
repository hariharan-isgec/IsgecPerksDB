USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptarTravelRequestStatusSelectListSearch]
  @LoginID NVarChar(8),
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
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,StatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (StatusID)
  SELECT [TA_TravelRequestStatus].[StatusID] FROM [TA_TravelRequestStatus]
 WHERE  
   ( 
         STR(ISNULL([TA_TravelRequestStatus].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelRequestStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [TA_TravelRequestStatus].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [TA_TravelRequestStatus].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TA_TravelRequestStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TA_TravelRequestStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [TA_TravelRequestStatus].*  
  FROM [TA_TravelRequestStatus] 
      INNER JOIN #PageIndex
          ON [TA_TravelRequestStatus].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
