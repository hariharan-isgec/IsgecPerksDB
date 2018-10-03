USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkStatusSelectListSearch]
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
  SELECT [PRK_Status].[StatusID] FROM [PRK_Status]
 WHERE  
   ( 
         STR(ISNULL([PRK_Status].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Status].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [PRK_Status].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [PRK_Status].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PRK_Status].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PRK_Status].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PRK_Status].*  
  FROM [PRK_Status] 
      INNER JOIN #PageIndex
          ON [PRK_Status].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
