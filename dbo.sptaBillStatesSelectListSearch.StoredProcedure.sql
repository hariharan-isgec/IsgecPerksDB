USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaBillStatesSelectListSearch]
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
 ,BillStatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (BillStatusID)
  SELECT [TA_BillStates].[BillStatusID] FROM [TA_BillStates]
 WHERE  
   ( 
         STR(ISNULL([TA_BillStates].[BillStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_BillStates].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'BillStatusID' THEN [TA_BillStates].[BillStatusID] END,
     CASE @OrderBy WHEN 'BillStatusID DESC' THEN [TA_BillStates].[BillStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TA_BillStates].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TA_BillStates].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TA_BillStates].[BillStatusID] ,
		[TA_BillStates].[Description]  
  FROM [TA_BillStates] 
      INNER JOIN #PageIndex
          ON [TA_BillStates].[BillStatusID] = #PageIndex.BillStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
