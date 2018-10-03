USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCStatesSelectListSearch]
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
  SELECT [SPMT_DCStates].[StatusID] FROM [SPMT_DCStates]
 WHERE  
   ( 
         STR(ISNULL([SPMT_DCStates].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCStates].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [SPMT_DCStates].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [SPMT_DCStates].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_DCStates].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_DCStates].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [SPMT_DCStates].*  
  FROM [SPMT_DCStates] 
      INNER JOIN #PageIndex
          ON [SPMT_DCStates].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
