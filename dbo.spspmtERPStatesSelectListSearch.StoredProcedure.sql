USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtERPStatesSelectListSearch]
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
 ,StateID NVarChar(2) NOT NULL
  )
  INSERT INTO #PageIndex (StateID)
  SELECT [SPMT_ERPStates].[StateID] FROM [SPMT_ERPStates]
 WHERE  
   ( 
         LOWER(ISNULL([SPMT_ERPStates].[StateID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_ERPStates].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StateID' THEN [SPMT_ERPStates].[StateID] END,
     CASE @OrderBy WHEN 'StateID DESC' THEN [SPMT_ERPStates].[StateID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_ERPStates].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_ERPStates].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [SPMT_ERPStates].*  
  FROM [SPMT_ERPStates] 
      INNER JOIN #PageIndex
          ON [SPMT_ERPStates].[StateID] = #PageIndex.StateID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
