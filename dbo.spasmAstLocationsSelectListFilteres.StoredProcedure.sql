USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLocationsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,LocationID NVarChar(20) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'LocationID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ASM_AstLocations].[LocationID]'  SET @LGSQL = @LGSQL + ' FROM [ASM_AstLocations] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'LocationID' THEN '[ASM_AstLocations].[LocationID]'
                        WHEN 'LocationID DESC' THEN '[ASM_AstLocations].[LocationID] DESC'
                        WHEN 'Description' THEN '[ASM_AstLocations].[Description]'
                        WHEN 'Description DESC' THEN '[ASM_AstLocations].[Description] DESC'
                        ELSE '[ASM_AstLocations].[LocationID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ASM_AstLocations].[LocationID],
		[ASM_AstLocations].[Description] 
  FROM [ASM_AstLocations] 
    	INNER JOIN #PageIndex
          ON [ASM_AstLocations].[LocationID] = #PageIndex.LocationID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
