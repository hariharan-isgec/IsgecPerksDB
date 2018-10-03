USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostDivisionsSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,DivisionID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'DivisionID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[COST_Divisions].[DivisionID]'
  SET @LGSQL = @LGSQL + ' FROM [COST_Divisions] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DivisionID' THEN '[COST_Divisions].[DivisionID]'
                        WHEN 'DivisionID DESC' THEN '[COST_Divisions].[DivisionID] DESC'
                        WHEN 'DivisionName' THEN '[COST_Divisions].[DivisionName]'
                        WHEN 'DivisionName DESC' THEN '[COST_Divisions].[DivisionName] DESC'
                        ELSE '[COST_Divisions].[DivisionID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [COST_Divisions].*  
  FROM [COST_Divisions] 
      INNER JOIN #PageIndex
          ON [COST_Divisions].[DivisionID] = #PageIndex.DivisionID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
