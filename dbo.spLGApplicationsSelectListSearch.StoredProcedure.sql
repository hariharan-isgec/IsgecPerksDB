USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGApplicationsSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  ApplicationID Int NOT NULL
  )
  INSERT INTO #PageIndex (ApplicationID)
  SELECT [SYS_Applications].[ApplicationID] FROM [SYS_Applications]
 WHERE  
   ( 
         STR(ISNULL([SYS_Applications].[ApplicationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_Applications].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_Applications].[WebPath],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'ApplicationID' THEN [SYS_Applications].[ApplicationID] END,
     CASE @orderBy WHEN 'ApplicationID DESC' THEN [SYS_Applications].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [SYS_Applications].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [SYS_Applications].[Description] END DESC,
     CASE @orderBy WHEN 'WebPath' THEN [SYS_Applications].[WebPath] END,
     CASE @orderBy WHEN 'WebPath DESC' THEN [SYS_Applications].[WebPath] END DESC,
     CASE @orderBy WHEN 'GenerateDefaults' THEN [SYS_Applications].[GenerateDefaults] END,
     CASE @orderBy WHEN 'GenerateDefaults DESC' THEN [SYS_Applications].[GenerateDefaults] END DESC 

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
