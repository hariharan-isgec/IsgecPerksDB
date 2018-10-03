USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGApplicationsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  ApplicationID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (ApplicationID) ' + 
               'SELECT [SYS_Applications].[ApplicationID] FROM [SYS_Applications] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
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
		[SYS_Applications].[ApplicationID],
		[SYS_Applications].[Description],
		[SYS_Applications].[WebPath],
		[SYS_Applications].[GenerateDefaults] 
  FROM [SYS_Applications] 
    	INNER JOIN #PageIndex
          ON [SYS_Applications].[ApplicationID] = #PageIndex.ApplicationID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
