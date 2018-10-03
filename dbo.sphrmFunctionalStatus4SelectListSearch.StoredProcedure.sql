USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus4SelectListSearch]
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
  FunctionalStatusID4 Int NOT NULL
  )
  INSERT INTO #PageIndex (FunctionalStatusID4)
  SELECT [HRM_FunctionalStatus4].[FunctionalStatusID4] FROM [HRM_FunctionalStatus4]
 WHERE  
   ( 
         STR(ISNULL([HRM_FunctionalStatus4].[FunctionalStatusID4], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_FunctionalStatus4].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'FunctionalStatusID4' THEN [HRM_FunctionalStatus4].[FunctionalStatusID4] END,
     CASE @orderBy WHEN 'FunctionalStatusID4 DESC' THEN [HRM_FunctionalStatus4].[FunctionalStatusID4] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_FunctionalStatus4].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_FunctionalStatus4].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_FunctionalStatus4].[FunctionalStatusID4],
		[HRM_FunctionalStatus4].[Description] 
  FROM [HRM_FunctionalStatus4] 
    	INNER JOIN #PageIndex
          ON [HRM_FunctionalStatus4].[FunctionalStatusID4] = #PageIndex.FunctionalStatusID4
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
