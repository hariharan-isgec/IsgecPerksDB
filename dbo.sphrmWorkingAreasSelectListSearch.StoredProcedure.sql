USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmWorkingAreasSelectListSearch]
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
  WorkingAreaID Int NOT NULL
  )
  INSERT INTO #PageIndex (WorkingAreaID)
  SELECT [HRM_WorkingAreas].[WorkingAreaID] FROM [HRM_WorkingAreas]
 WHERE  
   ( 
         STR(ISNULL([HRM_WorkingAreas].[WorkingAreaID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_WorkingAreas].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'WorkingAreaID' THEN [HRM_WorkingAreas].[WorkingAreaID] END,
     CASE @orderBy WHEN 'WorkingAreaID DESC' THEN [HRM_WorkingAreas].[WorkingAreaID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_WorkingAreas].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_WorkingAreas].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_WorkingAreas].[WorkingAreaID],
		[HRM_WorkingAreas].[Description] 
  FROM [HRM_WorkingAreas] 
    	INNER JOIN #PageIndex
          ON [HRM_WorkingAreas].[WorkingAreaID] = #PageIndex.WorkingAreaID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
