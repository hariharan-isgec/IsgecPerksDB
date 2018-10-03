USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBreakbulkTypesSelectListSearch]
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
 ,BreakbulkTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (BreakbulkTypeID)
  SELECT [ELOG_BreakbulkTypes].[BreakbulkTypeID] FROM [ELOG_BreakbulkTypes]
 WHERE  
   ( 
         STR(ISNULL([ELOG_BreakbulkTypes].[BreakbulkTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_BreakbulkTypes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'BreakbulkTypeID' THEN [ELOG_BreakbulkTypes].[BreakbulkTypeID] END,
     CASE @OrderBy WHEN 'BreakbulkTypeID DESC' THEN [ELOG_BreakbulkTypes].[BreakbulkTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_BreakbulkTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_BreakbulkTypes].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [ELOG_BreakbulkTypes].*  
  FROM [ELOG_BreakbulkTypes] 
      INNER JOIN #PageIndex
          ON [ELOG_BreakbulkTypes].[BreakbulkTypeID] = #PageIndex.BreakbulkTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
