USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmDivisionsSelectListSearch]
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
  DivisionID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (DivisionID)
  SELECT [HRM_Divisions].[DivisionID] FROM [HRM_Divisions]
 WHERE  
   ( 
         LOWER(ISNULL([HRM_Divisions].[DivisionID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Divisions].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'DivisionID' THEN [HRM_Divisions].[DivisionID] END,
     CASE @orderBy WHEN 'DivisionID DESC' THEN [HRM_Divisions].[DivisionID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_Divisions].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_Divisions].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_Divisions].[DivisionID],
		[HRM_Divisions].[Description] 
  FROM [HRM_Divisions] 
    	INNER JOIN #PageIndex
          ON [HRM_Divisions].[DivisionID] = #PageIndex.DivisionID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
