USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakIssueStatusSelectListFilteres]
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
 ,IssueStatusID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'IssueStatusID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_IssueStatus].[IssueStatusID]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_IssueStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'IssueStatusID' THEN '[PAK_IssueStatus].[IssueStatusID]'
                        WHEN 'IssueStatusID DESC' THEN '[PAK_IssueStatus].[IssueStatusID] DESC'
                        WHEN 'Description' THEN '[PAK_IssueStatus].[Description]'
                        WHEN 'Description DESC' THEN '[PAK_IssueStatus].[Description] DESC'
                        ELSE '[PAK_IssueStatus].[IssueStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_IssueStatus].*  
  FROM [PAK_IssueStatus] 
      INNER JOIN #PageIndex
          ON [PAK_IssueStatus].[IssueStatusID] = #PageIndex.IssueStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
