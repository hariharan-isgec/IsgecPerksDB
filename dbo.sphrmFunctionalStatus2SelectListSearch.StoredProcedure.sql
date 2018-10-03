USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus2SelectListSearch]
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
  FunctionalStatusID2 Int NOT NULL
  )
  INSERT INTO #PageIndex (FunctionalStatusID2)
  SELECT [HRM_FunctionalStatus2].[FunctionalStatusID2] FROM [HRM_FunctionalStatus2]
 WHERE  
   ( 
         STR(ISNULL([HRM_FunctionalStatus2].[FunctionalStatusID2], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_FunctionalStatus2].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'FunctionalStatusID2' THEN [HRM_FunctionalStatus2].[FunctionalStatusID2] END,
     CASE @orderBy WHEN 'FunctionalStatusID2 DESC' THEN [HRM_FunctionalStatus2].[FunctionalStatusID2] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_FunctionalStatus2].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_FunctionalStatus2].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_FunctionalStatus2].[FunctionalStatusID2],
		[HRM_FunctionalStatus2].[Description] 
  FROM [HRM_FunctionalStatus2] 
    	INNER JOIN #PageIndex
          ON [HRM_FunctionalStatus2].[FunctionalStatusID2] = #PageIndex.FunctionalStatusID2
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
