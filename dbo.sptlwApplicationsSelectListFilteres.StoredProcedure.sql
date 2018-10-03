USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwApplicationsSelectListFilteres]
  @Filter_ApplicationID Int,
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
 ,ApplicationID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ApplicationID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SYS_Applications].[ApplicationID]'
  SET @LGSQL = @LGSQL + ' FROM [SYS_Applications] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ApplicationID > 0) 
    SET @LGSQL = @LGSQL + ' AND [SYS_Applications].[ApplicationID] = ' + STR(@Filter_ApplicationID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ApplicationID' THEN '[SYS_Applications].[ApplicationID]'
                        WHEN 'ApplicationID DESC' THEN '[SYS_Applications].[ApplicationID] DESC'
                        WHEN 'Description' THEN '[SYS_Applications].[Description]'
                        WHEN 'Description DESC' THEN '[SYS_Applications].[Description] DESC'
                        WHEN 'WebPath' THEN '[SYS_Applications].[WebPath]'
                        WHEN 'WebPath DESC' THEN '[SYS_Applications].[WebPath] DESC'
                        WHEN 'GenerateDefaults' THEN '[SYS_Applications].[GenerateDefaults]'
                        WHEN 'GenerateDefaults DESC' THEN '[SYS_Applications].[GenerateDefaults] DESC'
                        ELSE '[SYS_Applications].[ApplicationID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SYS_Applications].*  
  FROM [SYS_Applications] 
      INNER JOIN #PageIndex
          ON [SYS_Applications].[ApplicationID] = #PageIndex.ApplicationID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
