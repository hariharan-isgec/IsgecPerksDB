USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPOItemStatusSelectListSearch]
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
 ,StatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (StatusID)
  SELECT [EITL_POItemStatus].[StatusID] FROM [EITL_POItemStatus]
 WHERE  
   ( 
         STR(ISNULL([EITL_POItemStatus].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_POItemStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [EITL_POItemStatus].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [EITL_POItemStatus].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [EITL_POItemStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [EITL_POItemStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[EITL_POItemStatus].[StatusID] ,
		[EITL_POItemStatus].[Description]  
  FROM [EITL_POItemStatus] 
    	INNER JOIN #PageIndex
          ON [EITL_POItemStatus].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
