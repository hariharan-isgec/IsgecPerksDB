USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmProjectsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  ProjectCode NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (ProjectCode) ' + 
               'SELECT [DCM_Projects].[ProjectCode] FROM [DCM_Projects] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectCode' THEN '[DCM_Projects].[ProjectCode]'
                        WHEN 'ProjectCode DESC' THEN '[DCM_Projects].[ProjectCode] DESC'
                        WHEN 'Description' THEN '[DCM_Projects].[Description]'
                        WHEN 'Description DESC' THEN '[DCM_Projects].[Description] DESC'
                        ELSE '[DCM_Projects].[ProjectCode]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[DCM_Projects].[ProjectCode],
		[DCM_Projects].[Description] 
  FROM [DCM_Projects] 
    	INNER JOIN #PageIndex
          ON [DCM_Projects].[ProjectCode] = #PageIndex.ProjectCode
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
