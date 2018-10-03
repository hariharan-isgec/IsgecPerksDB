USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnSAStatusSelectListSearch]
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
  SELECT [ATN_SAStatus].[StatusID] FROM [ATN_SAStatus]
 WHERE  
   ( 
         STR(ISNULL([ATN_SAStatus].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SAStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [ATN_SAStatus].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [ATN_SAStatus].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ATN_SAStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ATN_SAStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [ATN_SAStatus].*  
  FROM [ATN_SAStatus] 
      INNER JOIN #PageIndex
          ON [ATN_SAStatus].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
