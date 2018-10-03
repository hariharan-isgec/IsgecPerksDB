USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchastRAMs]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  RamID Int NOT NULL
  )
  INSERT INTO #PageIndex (RamID)
  SELECT [AST_Rams].[RamID] FROM [AST_Rams]
  WHERE STR(ISNULL([AST_Rams].[RamID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Rams].[Description],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [AST_Rams].[RamID] AS SearchCode, 
  ISNULL([AST_Rams].[Description],'') 
  AS SearchDescription 
  FROM [AST_Rams] 
    	INNER JOIN #PageIndex
          ON [AST_Rams].[RamID] = #PageIndex.RamID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
