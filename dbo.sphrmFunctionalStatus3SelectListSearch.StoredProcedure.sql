USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus3SelectListSearch]
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
  FunctionalStatusID3 Int NOT NULL
  )
  INSERT INTO #PageIndex (FunctionalStatusID3)
  SELECT [HRM_FunctionalStatus3].[FunctionalStatusID3] FROM [HRM_FunctionalStatus3]
 WHERE  
   ( 
         STR(ISNULL([HRM_FunctionalStatus3].[FunctionalStatusID3], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_FunctionalStatus3].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'FunctionalStatusID3' THEN [HRM_FunctionalStatus3].[FunctionalStatusID3] END,
     CASE @orderBy WHEN 'FunctionalStatusID3 DESC' THEN [HRM_FunctionalStatus3].[FunctionalStatusID3] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_FunctionalStatus3].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_FunctionalStatus3].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_FunctionalStatus3].[FunctionalStatusID3],
		[HRM_FunctionalStatus3].[Description] 
  FROM [HRM_FunctionalStatus3] 
    	INNER JOIN #PageIndex
          ON [HRM_FunctionalStatus3].[FunctionalStatusID3] = #PageIndex.FunctionalStatusID3
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
