USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaTravelTypesSelectListSearch]
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
 ,TravelTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (TravelTypeID)
  SELECT [TA_TravelTypes].[TravelTypeID] FROM [TA_TravelTypes]
 WHERE  
   ( 
         STR(ISNULL([TA_TravelTypes].[TravelTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_TravelTypes].[TravelTypeDescription],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'TravelTypeID' THEN [TA_TravelTypes].[TravelTypeID] END,
     CASE @OrderBy WHEN 'TravelTypeID DESC' THEN [TA_TravelTypes].[TravelTypeID] END DESC,
     CASE @OrderBy WHEN 'TravelTypeDescription' THEN [TA_TravelTypes].[TravelTypeDescription] END,
     CASE @OrderBy WHEN 'TravelTypeDescription DESC' THEN [TA_TravelTypes].[TravelTypeDescription] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_TravelTypes].[TravelTypeID] ,
		[TA_TravelTypes].[TravelTypeDescription]  
  FROM [TA_TravelTypes] 
      INNER JOIN #PageIndex
          ON [TA_TravelTypes].[TravelTypeID] = #PageIndex.TravelTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
