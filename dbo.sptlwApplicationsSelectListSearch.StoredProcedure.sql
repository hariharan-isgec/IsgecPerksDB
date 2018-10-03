USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwApplicationsSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ApplicationID Int NOT NULL
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
     CASE @OrderBy WHEN 'ApplicationID' THEN [SYS_Applications].[ApplicationID] END,
     CASE @OrderBy WHEN 'ApplicationID DESC' THEN [SYS_Applications].[ApplicationID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SYS_Applications].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SYS_Applications].[Description] END DESC,
     CASE @OrderBy WHEN 'WebPath' THEN [SYS_Applications].[WebPath] END,
     CASE @OrderBy WHEN 'WebPath DESC' THEN [SYS_Applications].[WebPath] END DESC,
     CASE @OrderBy WHEN 'GenerateDefaults' THEN [SYS_Applications].[GenerateDefaults] END,
     CASE @OrderBy WHEN 'GenerateDefaults DESC' THEN [SYS_Applications].[GenerateDefaults] END DESC 

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
