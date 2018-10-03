USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtForexTypesSelectListSearch]
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
 ,FOREXTypeID NVarChar(20) NOT NULL
  )
  INSERT INTO #PageIndex (FOREXTypeID)
  SELECT [SPMT_ForexTypes].[FOREXTypeID] FROM [SPMT_ForexTypes]
 WHERE  
   ( 
         LOWER(ISNULL([SPMT_ForexTypes].[FOREXTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_ForexTypes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'FOREXTypeID' THEN [SPMT_ForexTypes].[FOREXTypeID] END,
     CASE @orderBy WHEN 'FOREXTypeID DESC' THEN [SPMT_ForexTypes].[FOREXTypeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [SPMT_ForexTypes].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [SPMT_ForexTypes].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[SPMT_ForexTypes].[FOREXTypeID] ,
		[SPMT_ForexTypes].[Description]  
  FROM [SPMT_ForexTypes] 
    	INNER JOIN #PageIndex
          ON [SPMT_ForexTypes].[FOREXTypeID] = #PageIndex.FOREXTypeID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
