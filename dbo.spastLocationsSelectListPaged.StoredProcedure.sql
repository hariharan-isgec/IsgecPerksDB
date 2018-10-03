USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastLocationsSelectListPaged]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  LocationID Int NOT NULL
  )
  INSERT INTO #PageIndex (LocationID)
  SELECT [AST_Locations].[LocationID] FROM [AST_Locations]
  ORDER BY
     CASE @orderBy WHEN 'LocationID' THEN [AST_Locations].[LocationID] END,
     CASE @orderBy WHEN 'LocationID DESC' THEN [AST_Locations].[LocationID] END DESC,
     CASE @orderBy WHEN 'Descriptions' THEN [AST_Locations].[Descriptions] END,
     CASE @orderBy WHEN 'Descriptions DESC' THEN [AST_Locations].[Descriptions] END DESC 

  SET @RecordCount = @@RowCount

  SELECT
		[AST_Locations].[LocationID],
		[AST_Locations].[Descriptions] 
  FROM [AST_Locations] 
    	INNER JOIN #PageIndex
          ON [AST_Locations].[LocationID] = #PageIndex.LocationID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
GO
