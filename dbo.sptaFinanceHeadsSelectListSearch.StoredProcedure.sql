USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaFinanceHeadsSelectListSearch]
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
 ,FinanceHeadID Int NOT NULL
  )
  INSERT INTO #PageIndex (FinanceHeadID)
  SELECT [TA_FinanceHeads].[FinanceHeadID] FROM [TA_FinanceHeads]
 WHERE  
   ( 
         STR(ISNULL([TA_FinanceHeads].[FinanceHeadID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_FinanceHeads].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'FinanceHeadID' THEN [TA_FinanceHeads].[FinanceHeadID] END,
     CASE @OrderBy WHEN 'FinanceHeadID DESC' THEN [TA_FinanceHeads].[FinanceHeadID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TA_FinanceHeads].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TA_FinanceHeads].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_FinanceHeads].[FinanceHeadID] ,
		[TA_FinanceHeads].[Description]  
  FROM [TA_FinanceHeads] 
      INNER JOIN #PageIndex
          ON [TA_FinanceHeads].[FinanceHeadID] = #PageIndex.FinanceHeadID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
