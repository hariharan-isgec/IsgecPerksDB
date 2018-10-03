USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLocationsSelectListSearch]
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
 ,LocationID NVarChar(20) NOT NULL
  )
  INSERT INTO #PageIndex (LocationID)
  SELECT [ASM_AstLocations].[LocationID] FROM [ASM_AstLocations]
 WHERE  
   ( 
         LOWER(ISNULL([ASM_AstLocations].[LocationID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstLocations].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'LocationID' THEN [ASM_AstLocations].[LocationID] END,
     CASE @orderBy WHEN 'LocationID DESC' THEN [ASM_AstLocations].[LocationID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ASM_AstLocations].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ASM_AstLocations].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ASM_AstLocations].[LocationID],
		[ASM_AstLocations].[Description] 
  FROM [ASM_AstLocations] 
    	INNER JOIN #PageIndex
          ON [ASM_AstLocations].[LocationID] = #PageIndex.LocationID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
