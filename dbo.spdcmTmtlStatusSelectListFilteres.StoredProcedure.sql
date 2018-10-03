USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmTmtlStatusSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,StatusID NVarChar(1) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'StatusID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[DCM_TmtlStatus].[StatusID]'  SET @LGSQL = @LGSQL + ' FROM [DCM_TmtlStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'StatusID' THEN '[DCM_TmtlStatus].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[DCM_TmtlStatus].[StatusID] DESC'
                        WHEN 'Description' THEN '[DCM_TmtlStatus].[Description]'
                        WHEN 'Description DESC' THEN '[DCM_TmtlStatus].[Description] DESC'
                        ELSE '[DCM_TmtlStatus].[StatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[DCM_TmtlStatus].[StatusID],
		[DCM_TmtlStatus].[Description] 
  FROM [DCM_TmtlStatus] 
    	INNER JOIN #PageIndex
          ON [DCM_TmtlStatus].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
