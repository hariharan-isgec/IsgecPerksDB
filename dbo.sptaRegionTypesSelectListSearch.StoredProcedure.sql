USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaRegionTypesSelectListSearch]
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
 ,RegionTypeID NVarChar(10) NOT NULL
  )
  INSERT INTO #PageIndex (RegionTypeID)
  SELECT [TA_RegionTypes].[RegionTypeID] FROM [TA_RegionTypes]
 WHERE  
   ( 
         LOWER(ISNULL([TA_RegionTypes].[RegionTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_RegionTypes].[RegionTypeName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'RegionTypeID' THEN [TA_RegionTypes].[RegionTypeID] END,
     CASE @OrderBy WHEN 'RegionTypeID DESC' THEN [TA_RegionTypes].[RegionTypeID] END DESC,
     CASE @OrderBy WHEN 'RegionTypeName' THEN [TA_RegionTypes].[RegionTypeName] END,
     CASE @OrderBy WHEN 'RegionTypeName DESC' THEN [TA_RegionTypes].[RegionTypeName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_RegionTypes].[RegionTypeID] ,
		[TA_RegionTypes].[RegionTypeName]  
  FROM [TA_RegionTypes] 
      INNER JOIN #PageIndex
          ON [TA_RegionTypes].[RegionTypeID] = #PageIndex.RegionTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
