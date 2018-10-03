USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCityTypesSelectListSearch]
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
 ,CityTypeID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (CityTypeID)
  SELECT [TA_CityTypes].[CityTypeID] FROM [TA_CityTypes]
 WHERE  
   ( 
         LOWER(ISNULL([TA_CityTypes].[CityTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_CityTypes].[CityTypeName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'CityTypeID' THEN [TA_CityTypes].[CityTypeID] END,
     CASE @OrderBy WHEN 'CityTypeID DESC' THEN [TA_CityTypes].[CityTypeID] END DESC,
     CASE @OrderBy WHEN 'CityTypeName' THEN [TA_CityTypes].[CityTypeName] END,
     CASE @OrderBy WHEN 'CityTypeName DESC' THEN [TA_CityTypes].[CityTypeName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_CityTypes].[CityTypeID] ,
		[TA_CityTypes].[CityTypeName]  
  FROM [TA_CityTypes] 
      INNER JOIN #PageIndex
          ON [TA_CityTypes].[CityTypeID] = #PageIndex.CityTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
