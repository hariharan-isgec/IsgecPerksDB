USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogDetentionBillStatusSelectListSearch]
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
  SELECT [ELOG_DetentionBillStatus].[StatusID] FROM [ELOG_DetentionBillStatus]
 WHERE  
   ( 
         STR(ISNULL([ELOG_DetentionBillStatus].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_DetentionBillStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [ELOG_DetentionBillStatus].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [ELOG_DetentionBillStatus].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_DetentionBillStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_DetentionBillStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [ELOG_DetentionBillStatus].*  
  FROM [ELOG_DetentionBillStatus] 
      INNER JOIN #PageIndex
          ON [ELOG_DetentionBillStatus].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
