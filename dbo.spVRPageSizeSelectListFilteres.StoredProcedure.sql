USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRPageSizeSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @ApplicationID Int,
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
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [SYS_LGPageSize].[ApplicationID] = ' + STR(@ApplicationID)
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
		[SYS_LGPageSize].[ApplicationID] 
  FROM [SYS_LGPageSize] 
    	INNER JOIN #PageIndex
          ON [SYS_LGPageSize].[PageID] = #PageIndex.PageID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
