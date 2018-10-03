USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtVehicleSelectListSearch]
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
 ,VehicleID NVarChar(30) NOT NULL
  )
  INSERT INTO #PageIndex (VehicleID)
  SELECT [PMT_Vehicle].[VehicleID] FROM [PMT_Vehicle]
 WHERE  
   ( 
         LOWER(ISNULL([PMT_Vehicle].[VehicleID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_Vehicle].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'VehicleID' THEN [PMT_Vehicle].[VehicleID] END,
     CASE @orderBy WHEN 'VehicleID DESC' THEN [PMT_Vehicle].[VehicleID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [PMT_Vehicle].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [PMT_Vehicle].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[PMT_Vehicle].[VehicleID],
		[PMT_Vehicle].[Description] 
  FROM [PMT_Vehicle] 
    	INNER JOIN #PageIndex
          ON [PMT_Vehicle].[VehicleID] = #PageIndex.VehicleID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
