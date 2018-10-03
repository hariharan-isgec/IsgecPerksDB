USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmstLocationsSelectListSearch]
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
 ,LocationID Int NOT NULL
  )
  INSERT INTO #PageIndex (LocationID)
  SELECT [AST_Locations].[LocationID] FROM [AST_Locations]
 WHERE  
   ( 
         STR(ISNULL([AST_Locations].[LocationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Locations].[Descriptions],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'LocationID' THEN [AST_Locations].[LocationID] END,
     CASE @orderBy WHEN 'LocationID DESC' THEN [AST_Locations].[LocationID] END DESC,
     CASE @orderBy WHEN 'Descriptions' THEN [AST_Locations].[Descriptions] END,
     CASE @orderBy WHEN 'Descriptions DESC' THEN [AST_Locations].[Descriptions] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[AST_Locations].[LocationID] ,
		[AST_Locations].[Descriptions]  
  FROM [AST_Locations] 
    	INNER JOIN #PageIndex
          ON [AST_Locations].[LocationID] = #PageIndex.LocationID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
