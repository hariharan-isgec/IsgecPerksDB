USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalLocationsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  LocationID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (LocationID) ' + 
               'SELECT [AST_Locations].[LocationID] FROM [AST_Locations] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'LocationID' THEN '[AST_Locations].[LocationID]'
                        WHEN 'LocationID DESC' THEN '[AST_Locations].[LocationID] DESC'
                        WHEN 'Descriptions' THEN '[AST_Locations].[Descriptions]'
                        WHEN 'Descriptions DESC' THEN '[AST_Locations].[Descriptions] DESC'
                        ELSE '[AST_Locations].[LocationID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[AST_Locations].[LocationID],
		[AST_Locations].[Descriptions] 
  FROM [AST_Locations] 
    	INNER JOIN #PageIndex
          ON [AST_Locations].[LocationID] = #PageIndex.LocationID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
