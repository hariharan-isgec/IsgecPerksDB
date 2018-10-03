USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaOOEReasonsSelectListSearch]
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
 ,ReasonID Int NOT NULL
  )
  INSERT INTO #PageIndex (ReasonID)
  SELECT [TA_OOEReasons].[ReasonID] FROM [TA_OOEReasons]
 WHERE  
   ( 
         STR(ISNULL([TA_OOEReasons].[ReasonID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_OOEReasons].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ReasonID' THEN [TA_OOEReasons].[ReasonID] END,
     CASE @OrderBy WHEN 'ReasonID DESC' THEN [TA_OOEReasons].[ReasonID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TA_OOEReasons].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TA_OOEReasons].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_OOEReasons].[ReasonID] ,
		[TA_OOEReasons].[Description]  
  FROM [TA_OOEReasons] 
      INNER JOIN #PageIndex
          ON [TA_OOEReasons].[ReasonID] = #PageIndex.ReasonID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
