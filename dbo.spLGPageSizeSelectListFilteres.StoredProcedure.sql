USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGPageSizeSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  PageID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (PageID) ' + 
               'SELECT [SYS_LGPageSize].[PageID] FROM [SYS_LGPageSize] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_Applications] AS [SYS_Applications1]'
  SET @LGSQL = @LGSQL + '    ON [SYS_LGPageSize].[ApplicationID] = [SYS_Applications1].[ApplicationID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'PageID' THEN '[SYS_LGPageSize].[PageID]'
                        WHEN 'PageID DESC' THEN '[SYS_LGPageSize].[PageID] DESC'
                        WHEN 'LoginID' THEN '[SYS_LGPageSize].[LoginID]'
                        WHEN 'LoginID DESC' THEN '[SYS_LGPageSize].[LoginID] DESC'
                        WHEN 'PageName' THEN '[SYS_LGPageSize].[PageName]'
                        WHEN 'PageName DESC' THEN '[SYS_LGPageSize].[PageName] DESC'
                        WHEN 'PageSize' THEN '[SYS_LGPageSize].[PageSize]'
                        WHEN 'PageSize DESC' THEN '[SYS_LGPageSize].[PageSize] DESC'
                        WHEN 'PageNo' THEN '[SYS_LGPageSize].[PageNo]'
                        WHEN 'PageNo DESC' THEN '[SYS_LGPageSize].[PageNo] DESC'
                        WHEN 'ApplicationID' THEN '[SYS_LGPageSize].[ApplicationID]'
                        WHEN 'ApplicationID DESC' THEN '[SYS_LGPageSize].[ApplicationID] DESC'
                        WHEN 'SYS_Applications1_ApplicationID' THEN '[SYS_Applications1].[ApplicationID]'
                        WHEN 'SYS_Applications1_ApplicationID DESC' THEN '[SYS_Applications1].[ApplicationID] DESC'
                        WHEN 'SYS_Applications1_Description' THEN '[SYS_Applications1].[Description]'
                        WHEN 'SYS_Applications1_Description DESC' THEN '[SYS_Applications1].[Description] DESC'
                        WHEN 'SYS_Applications1_WebPath' THEN '[SYS_Applications1].[WebPath]'
                        WHEN 'SYS_Applications1_WebPath DESC' THEN '[SYS_Applications1].[WebPath] DESC'
                        WHEN 'SYS_Applications1_GenerateDefaults' THEN '[SYS_Applications1].[GenerateDefaults]'
                        WHEN 'SYS_Applications1_GenerateDefaults DESC' THEN '[SYS_Applications1].[GenerateDefaults] DESC'
                        ELSE '[SYS_LGPageSize].[PageID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[SYS_LGPageSize].[PageID],
		[SYS_LGPageSize].[LoginID],
		[SYS_LGPageSize].[PageName],
		[SYS_LGPageSize].[PageSize],
		[SYS_LGPageSize].[PageNo],
		[SYS_LGPageSize].[ApplicationID],
		[SYS_Applications1].[ApplicationID] AS SYS_Applications1_ApplicationID,
		[SYS_Applications1].[Description] AS SYS_Applications1_Description,
		[SYS_Applications1].[WebPath] AS SYS_Applications1_WebPath,
		[SYS_Applications1].[GenerateDefaults] AS SYS_Applications1_GenerateDefaults 
  FROM [SYS_LGPageSize] 
    	INNER JOIN #PageIndex
          ON [SYS_LGPageSize].[PageID] = #PageIndex.PageID
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_LGPageSize].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
