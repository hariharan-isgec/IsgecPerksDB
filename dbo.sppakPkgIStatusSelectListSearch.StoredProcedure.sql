USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPkgIStatusSelectListSearch]
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
  SELECT [PAK_PkgIStatus].[StatusID] FROM [PAK_PkgIStatus]
 WHERE  
   ( 
         STR(ISNULL([PAK_PkgIStatus].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PkgIStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [PAK_PkgIStatus].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [PAK_PkgIStatus].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_PkgIStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_PkgIStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PAK_PkgIStatus].*  
  FROM [PAK_PkgIStatus] 
      INNER JOIN #PageIndex
          ON [PAK_PkgIStatus].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
