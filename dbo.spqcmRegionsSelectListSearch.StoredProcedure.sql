USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRegionsSelectListSearch]
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
 ,RegionID Int NOT NULL
  )
  INSERT INTO #PageIndex (RegionID)
  SELECT [QCM_Regions].[RegionID] FROM [QCM_Regions]
 WHERE  
   ( 
         STR(ISNULL([QCM_Regions].[RegionID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_Regions].[RegionName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'RegionID' THEN [QCM_Regions].[RegionID] END,
     CASE @OrderBy WHEN 'RegionID DESC' THEN [QCM_Regions].[RegionID] END DESC,
     CASE @OrderBy WHEN 'RegionName' THEN [QCM_Regions].[RegionName] END,
     CASE @OrderBy WHEN 'RegionName DESC' THEN [QCM_Regions].[RegionName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[QCM_Regions].[RegionID] ,
		[QCM_Regions].[RegionName]  
  FROM [QCM_Regions] 
    	INNER JOIN #PageIndex
          ON [QCM_Regions].[RegionID] = #PageIndex.RegionID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
