USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmDivisionsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  DivisionID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (DivisionID) ' + 
               'SELECT [HRM_Divisions].[DivisionID] FROM [HRM_Divisions] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DivisionID' THEN '[HRM_Divisions].[DivisionID]'
                        WHEN 'DivisionID DESC' THEN '[HRM_Divisions].[DivisionID] DESC'
                        WHEN 'Description' THEN '[HRM_Divisions].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_Divisions].[Description] DESC'
                        ELSE '[HRM_Divisions].[DivisionID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_Divisions].[DivisionID],
		[HRM_Divisions].[Description] 
  FROM [HRM_Divisions] 
    	INNER JOIN #PageIndex
          ON [HRM_Divisions].[DivisionID] = #PageIndex.DivisionID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
