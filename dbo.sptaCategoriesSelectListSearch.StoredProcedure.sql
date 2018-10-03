USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCategoriesSelectListSearch]
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
 ,CategoryID Int NOT NULL
  )
  INSERT INTO #PageIndex (CategoryID)
  SELECT [TA_Categories].[CategoryID] FROM [TA_Categories]
 WHERE  
   ( 
         STR(ISNULL([TA_Categories].[CategoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_Categories].[CategoryCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_Categories].[CategoryDescription],'')) LIKE @KeyWord1
     OR STR(ISNULL([TA_Categories].[CategorySequence], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_Categories].[cmba],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'CategoryID' THEN [TA_Categories].[CategoryID] END,
     CASE @OrderBy WHEN 'CategoryID DESC' THEN [TA_Categories].[CategoryID] END DESC,
     CASE @OrderBy WHEN 'CategoryCode' THEN [TA_Categories].[CategoryCode] END,
     CASE @OrderBy WHEN 'CategoryCode DESC' THEN [TA_Categories].[CategoryCode] END DESC,
     CASE @OrderBy WHEN 'CategoryDescription' THEN [TA_Categories].[CategoryDescription] END,
     CASE @OrderBy WHEN 'CategoryDescription DESC' THEN [TA_Categories].[CategoryDescription] END DESC,
     CASE @OrderBy WHEN 'CategorySequence' THEN [TA_Categories].[CategorySequence] END,
     CASE @OrderBy WHEN 'CategorySequence DESC' THEN [TA_Categories].[CategorySequence] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_Categories].[CategoryID] ,
		[TA_Categories].[CategoryCode] ,
		[TA_Categories].[CategoryDescription] ,
		[TA_Categories].[CategorySequence] ,
		[TA_Categories].[cmba]  
  FROM [TA_Categories] 
      INNER JOIN #PageIndex
          ON [TA_Categories].[CategoryID] = #PageIndex.CategoryID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
