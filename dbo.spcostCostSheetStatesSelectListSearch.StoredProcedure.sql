USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCostSheetStatesSelectListSearch]
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
  SELECT [COST_CostSheetStates].[StatusID] FROM [COST_CostSheetStates]
 WHERE  
   ( 
         STR(ISNULL([COST_CostSheetStates].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_CostSheetStates].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [COST_CostSheetStates].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [COST_CostSheetStates].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [COST_CostSheetStates].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [COST_CostSheetStates].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [COST_CostSheetStates].*  
  FROM [COST_CostSheetStates] 
      INNER JOIN #PageIndex
          ON [COST_CostSheetStates].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
