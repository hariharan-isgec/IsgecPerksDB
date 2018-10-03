USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectInputStatusSelectListSearch]
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
  SELECT [COST_ProjectInputStatus].[StatusID] FROM [COST_ProjectInputStatus]
 WHERE  
   ( 
         STR(ISNULL([COST_ProjectInputStatus].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_ProjectInputStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [COST_ProjectInputStatus].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [COST_ProjectInputStatus].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [COST_ProjectInputStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [COST_ProjectInputStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [COST_ProjectInputStatus].*  
  FROM [COST_ProjectInputStatus] 
      INNER JOIN #PageIndex
          ON [COST_ProjectInputStatus].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
