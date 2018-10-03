USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscApprovalStatusSelectListSearch]
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
  SELECT [SC_ApprovalStatus].[StatusID] FROM [SC_ApprovalStatus]
 WHERE  
   ( 
         LOWER(ISNULL([SC_ApprovalStatus].[StatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SC_ApprovalStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [SC_ApprovalStatus].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [SC_ApprovalStatus].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SC_ApprovalStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SC_ApprovalStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [SC_ApprovalStatus].*  
  FROM [SC_ApprovalStatus] 
      INNER JOIN #PageIndex
          ON [SC_ApprovalStatus].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
