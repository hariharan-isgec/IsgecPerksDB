USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakIssueTypesSelectListFilteres]
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
 ,IssueTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'IssueTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_IssueTypes].[IssueTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_IssueTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'IssueTypeID' THEN '[PAK_IssueTypes].[IssueTypeID]'
                        WHEN 'IssueTypeID DESC' THEN '[PAK_IssueTypes].[IssueTypeID] DESC'
                        WHEN 'Description' THEN '[PAK_IssueTypes].[Description]'
                        WHEN 'Description DESC' THEN '[PAK_IssueTypes].[Description] DESC'
                        ELSE '[PAK_IssueTypes].[IssueTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_IssueTypes].*  
  FROM [PAK_IssueTypes] 
      INNER JOIN #PageIndex
          ON [PAK_IssueTypes].[IssueTypeID] = #PageIndex.IssueTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
