USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmActivitiesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,ActivityID NVarChar(20) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ActivityID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ASM_Activities].[ActivityID]'  SET @LGSQL = @LGSQL + ' FROM [ASM_Activities] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ActivityID' THEN '[ASM_Activities].[ActivityID]'
                        WHEN 'ActivityID DESC' THEN '[ASM_Activities].[ActivityID] DESC'
                        WHEN 'Description' THEN '[ASM_Activities].[Description]'
                        WHEN 'Description DESC' THEN '[ASM_Activities].[Description] DESC'
                        ELSE '[ASM_Activities].[ActivityID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ASM_Activities].[ActivityID],
		[ASM_Activities].[Description] 
  FROM [ASM_Activities] 
    	INNER JOIN #PageIndex
          ON [ASM_Activities].[ActivityID] = #PageIndex.ActivityID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
