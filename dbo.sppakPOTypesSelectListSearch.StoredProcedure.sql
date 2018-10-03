USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOTypesSelectListSearch]
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
 ,POTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (POTypeID)
  SELECT [PAK_POTypes].[POTypeID] FROM [PAK_POTypes]
 WHERE  
   ( 
         STR(ISNULL([PAK_POTypes].[POTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_POTypes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'POTypeID' THEN [PAK_POTypes].[POTypeID] END,
     CASE @OrderBy WHEN 'POTypeID DESC' THEN [PAK_POTypes].[POTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_POTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_POTypes].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PAK_POTypes].*  
  FROM [PAK_POTypes] 
      INNER JOIN #PageIndex
          ON [PAK_POTypes].[POTypeID] = #PageIndex.POTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
