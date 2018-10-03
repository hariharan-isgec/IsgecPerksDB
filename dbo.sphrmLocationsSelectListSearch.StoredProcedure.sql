USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmLocationsSelectListSearch]
  @LoginID NVarChar(8),
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
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,LocationID Int NOT NULL
  )
  INSERT INTO #PageIndex (LocationID)
  SELECT [HRM_Locations].[LocationID] FROM [HRM_Locations]
 WHERE  
   ( 
         STR(ISNULL([HRM_Locations].[LocationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Locations].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'LocationID' THEN [HRM_Locations].[LocationID] END,
     CASE @OrderBy WHEN 'LocationID DESC' THEN [HRM_Locations].[LocationID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [HRM_Locations].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [HRM_Locations].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [HRM_Locations].*  
  FROM [HRM_Locations] 
      INNER JOIN #PageIndex
          ON [HRM_Locations].[LocationID] = #PageIndex.LocationID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
