USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBLTypesSelectListSearch]
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
 ,BLTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (BLTypeID)
  SELECT [ELOG_BLTypes].[BLTypeID] FROM [ELOG_BLTypes]
 WHERE  
   ( 
         STR(ISNULL([ELOG_BLTypes].[BLTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_BLTypes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'BLTypeID' THEN [ELOG_BLTypes].[BLTypeID] END,
     CASE @OrderBy WHEN 'BLTypeID DESC' THEN [ELOG_BLTypes].[BLTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_BLTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_BLTypes].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [ELOG_BLTypes].*  
  FROM [ELOG_BLTypes] 
      INNER JOIN #PageIndex
          ON [ELOG_BLTypes].[BLTypeID] = #PageIndex.BLTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
