USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakIssueStatusSelectListSearch]
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
 ,IssueStatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (IssueStatusID)
  SELECT [PAK_IssueStatus].[IssueStatusID] FROM [PAK_IssueStatus]
 WHERE  
   ( 
         STR(ISNULL([PAK_IssueStatus].[IssueStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_IssueStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'IssueStatusID' THEN [PAK_IssueStatus].[IssueStatusID] END,
     CASE @OrderBy WHEN 'IssueStatusID DESC' THEN [PAK_IssueStatus].[IssueStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_IssueStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_IssueStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PAK_IssueStatus].*  
  FROM [PAK_IssueStatus] 
      INNER JOIN #PageIndex
          ON [PAK_IssueStatus].[IssueStatusID] = #PageIndex.IssueStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
