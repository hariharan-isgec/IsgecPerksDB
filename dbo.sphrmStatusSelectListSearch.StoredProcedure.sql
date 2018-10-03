USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmStatusSelectListSearch]
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
  StatusID NVarChar(2) NOT NULL
  )
  INSERT INTO #PageIndex (StatusID)
  SELECT [HRM_Status].[StatusID] FROM [HRM_Status]
 WHERE  
   ( 
         LOWER(ISNULL([HRM_Status].[StatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Status].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Status].[Sequence], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'StatusID' THEN [HRM_Status].[StatusID] END,
     CASE @orderBy WHEN 'StatusID DESC' THEN [HRM_Status].[StatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_Status].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_Status].[Description] END DESC,
     CASE @orderBy WHEN 'Sequence' THEN [HRM_Status].[Sequence] END,
     CASE @orderBy WHEN 'Sequence DESC' THEN [HRM_Status].[Sequence] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_Status].[StatusID],
		[HRM_Status].[Description],
		[HRM_Status].[Sequence] 
  FROM [HRM_Status] 
    	INNER JOIN #PageIndex
          ON [HRM_Status].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
