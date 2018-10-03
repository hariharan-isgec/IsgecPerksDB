USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmOfficeLocationSelectListSearch]
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
 ,OfficeID Int NOT NULL
  )
  INSERT INTO #PageIndex (LocationID, OfficeID)
  SELECT [HRM_OfficeLocation].[LocationID], [HRM_OfficeLocation].[OfficeID] FROM [HRM_OfficeLocation]
  INNER JOIN [HRM_Locations] AS [HRM_Locations1]
    ON [HRM_OfficeLocation].[LocationID] = [HRM_Locations1].[LocationID]
  INNER JOIN [HRM_Offices] AS [HRM_Offices2]
    ON [HRM_OfficeLocation].[OfficeID] = [HRM_Offices2].[OfficeID]
 WHERE  
   ( 
         STR(ISNULL([HRM_OfficeLocation].[LocationID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([HRM_OfficeLocation].[OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_OfficeLocation].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'LocationID' THEN [HRM_OfficeLocation].[LocationID] END,
     CASE @OrderBy WHEN 'LocationID DESC' THEN [HRM_OfficeLocation].[LocationID] END DESC,
     CASE @OrderBy WHEN 'OfficeID' THEN [HRM_OfficeLocation].[OfficeID] END,
     CASE @OrderBy WHEN 'OfficeID DESC' THEN [HRM_OfficeLocation].[OfficeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [HRM_OfficeLocation].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [HRM_OfficeLocation].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Locations1_Description' THEN [HRM_Locations1].[Description] END,
     CASE @OrderBy WHEN 'HRM_Locations1_Description DESC' THEN [HRM_Locations1].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Offices2_Description' THEN [HRM_Offices2].[Description] END,
     CASE @OrderBy WHEN 'HRM_Offices2_Description DESC' THEN [HRM_Offices2].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [HRM_OfficeLocation].* ,
    [HRM_Locations1].[Description] AS HRM_Locations1_Description,
    [HRM_Offices2].[Description] AS HRM_Offices2_Description 
  FROM [HRM_OfficeLocation] 
      INNER JOIN #PageIndex
          ON [HRM_OfficeLocation].[LocationID] = #PageIndex.LocationID
          AND [HRM_OfficeLocation].[OfficeID] = #PageIndex.OfficeID
  INNER JOIN [HRM_Locations] AS [HRM_Locations1]
    ON [HRM_OfficeLocation].[LocationID] = [HRM_Locations1].[LocationID]
  INNER JOIN [HRM_Offices] AS [HRM_Offices2]
    ON [HRM_OfficeLocation].[OfficeID] = [HRM_Offices2].[OfficeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
