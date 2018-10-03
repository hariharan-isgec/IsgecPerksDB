USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastRAMsSelectListPaged]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  RamID Int NOT NULL
  )
  INSERT INTO #PageIndex (RamID)
  SELECT [AST_Rams].[RamID] FROM [AST_Rams]
  ORDER BY
     CASE @orderBy WHEN 'RamID' THEN [AST_Rams].[RamID] END,
     CASE @orderBy WHEN 'RamID DESC' THEN [AST_Rams].[RamID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [AST_Rams].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [AST_Rams].[Description] END DESC 

  SET @RecordCount = @@RowCount

  SELECT
		[AST_Rams].[RamID],
		[AST_Rams].[Description] 
  FROM [AST_Rams] 
    	INNER JOIN #PageIndex
          ON [AST_Rams].[RamID] = #PageIndex.RamID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
GO
