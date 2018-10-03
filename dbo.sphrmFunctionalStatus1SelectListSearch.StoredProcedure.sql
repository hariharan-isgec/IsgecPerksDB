USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus1SelectListSearch]
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
  FunctionalStatusID1 Int NOT NULL
  )
  INSERT INTO #PageIndex (FunctionalStatusID1)
  SELECT [HRM_FunctionalStatus1].[FunctionalStatusID1] FROM [HRM_FunctionalStatus1]
 WHERE  
   ( 
         STR(ISNULL([HRM_FunctionalStatus1].[FunctionalStatusID1], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_FunctionalStatus1].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'FunctionalStatusID1' THEN [HRM_FunctionalStatus1].[FunctionalStatusID1] END,
     CASE @orderBy WHEN 'FunctionalStatusID1 DESC' THEN [HRM_FunctionalStatus1].[FunctionalStatusID1] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_FunctionalStatus1].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_FunctionalStatus1].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_FunctionalStatus1].[FunctionalStatusID1],
		[HRM_FunctionalStatus1].[Description] 
  FROM [HRM_FunctionalStatus1] 
    	INNER JOIN #PageIndex
          ON [HRM_FunctionalStatus1].[FunctionalStatusID1] = #PageIndex.FunctionalStatusID1
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
