USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwLGPageSizeSelectListFilteres]
  @Filter_LoginID NVarChar(20),
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @ApplicationID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,PageID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'PageID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SYS_LGPageSize].[PageID]'
  SET @LGSQL = @LGSQL + ' FROM [SYS_LGPageSize] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_Applications] AS [SYS_Applications1]'
  SET @LGSQL = @LGSQL + '    ON [SYS_LGPageSize].[ApplicationID] = [SYS_Applications1].[ApplicationID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [SYS_LGPageSize].[ApplicationID] = ''' + STR(@ApplicationID) + '''' 
  IF (@Filter_LoginID > '') 
    SET @LGSQL = @LGSQL + ' AND [SYS_LGPageSize].[LoginID] = ''' + @Filter_LoginID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'PageID' THEN '[SYS_LGPageSize].[PageID]'
                        WHEN 'PageID DESC' THEN '[SYS_LGPageSize].[PageID] DESC'
                        WHEN 'LoginID' THEN '[SYS_LGPageSize].[LoginID]'
                        WHEN 'LoginID DESC' THEN '[SYS_LGPageSize].[LoginID] DESC'
                        WHEN 'PageName' THEN '[SYS_LGPageSize].[PageName]'
                        WHEN 'PageName DESC' THEN '[SYS_LGPageSize].[PageName] DESC'
                        WHEN 'ApplicationID' THEN '[SYS_LGPageSize].[ApplicationID]'
                        WHEN 'ApplicationID DESC' THEN '[SYS_LGPageSize].[ApplicationID] DESC'
                        WHEN 'PageSize' THEN '[SYS_LGPageSize].[PageSize]'
                        WHEN 'PageSize DESC' THEN '[SYS_LGPageSize].[PageSize] DESC'
                        WHEN 'PageNo' THEN '[SYS_LGPageSize].[PageNo]'
                        WHEN 'PageNo DESC' THEN '[SYS_LGPageSize].[PageNo] DESC'
                        WHEN 'SYS_Applications1_Description' THEN '[SYS_Applications1].[Description]'
                        WHEN 'SYS_Applications1_Description DESC' THEN '[SYS_Applications1].[Description] DESC'
                        ELSE '[SYS_LGPageSize].[PageID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SYS_LGPageSize].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description 
  FROM [SYS_LGPageSize] 
      INNER JOIN #PageIndex
          ON [SYS_LGPageSize].[PageID] = #PageIndex.PageID
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_LGPageSize].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
