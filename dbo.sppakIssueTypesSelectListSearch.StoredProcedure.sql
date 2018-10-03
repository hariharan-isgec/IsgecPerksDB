USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakIssueTypesSelectListSearch]
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
 ,IssueTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (IssueTypeID)
  SELECT [PAK_IssueTypes].[IssueTypeID] FROM [PAK_IssueTypes]
 WHERE  
   ( 
         STR(ISNULL([PAK_IssueTypes].[IssueTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_IssueTypes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'IssueTypeID' THEN [PAK_IssueTypes].[IssueTypeID] END,
     CASE @OrderBy WHEN 'IssueTypeID DESC' THEN [PAK_IssueTypes].[IssueTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_IssueTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_IssueTypes].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PAK_IssueTypes].*  
  FROM [PAK_IssueTypes] 
      INNER JOIN #PageIndex
          ON [PAK_IssueTypes].[IssueTypeID] = #PageIndex.IssueTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
