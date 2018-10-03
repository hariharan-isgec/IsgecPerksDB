USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastRAMsSelectListPagedByFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  RamID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (RamID) ' + 
               'SELECT [AST_Rams].[RamID] FROM [AST_Rams] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RamID' THEN '[AST_Rams].[RamID]'
                        WHEN 'RamID DESC' THEN '[AST_Rams].[RamID] DESC'
                        WHEN 'Description' THEN '[AST_Rams].[Description]'
                        WHEN 'Description DESC' THEN '[AST_Rams].[Description] DESC'
                        ELSE '[AST_Rams].[RamID]'
                    END
  EXEC (@LGSQL)

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
  END
GO
