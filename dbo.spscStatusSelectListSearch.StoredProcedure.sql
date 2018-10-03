USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscStatusSelectListSearch]
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
 ,StatusID NVarChar(2) NOT NULL
  )
  INSERT INTO #PageIndex (StatusID)
  SELECT [SC_Status].[StatusID] FROM [SC_Status]
 WHERE  
   ( 
         LOWER(ISNULL([SC_Status].[StatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SC_Status].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [SC_Status].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [SC_Status].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SC_Status].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SC_Status].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [SC_Status].*  
  FROM [SC_Status] 
      INNER JOIN #PageIndex
          ON [SC_Status].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
