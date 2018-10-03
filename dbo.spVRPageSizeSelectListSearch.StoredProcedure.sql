USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRPageSizeSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @ApplicationID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  PageID Int NOT NULL
  )
  INSERT INTO #PageIndex (PageID)
  SELECT [SYS_LGPageSize].[PageID] FROM [SYS_LGPageSize]
 WHERE  
      [SYS_LGPageSize].[ApplicationID] = @ApplicationID
   AND ( 
         STR(ISNULL([SYS_LGPageSize].[PageID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_LGPageSize].[LoginID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_LGPageSize].[PageName],'')) LIKE @KeyWord1
     OR STR(ISNULL([SYS_LGPageSize].[PageSize], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_LGPageSize].[PageNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_LGPageSize].[ApplicationID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'PageID' THEN [SYS_LGPageSize].[PageID] END,
     CASE @orderBy WHEN 'PageID DESC' THEN [SYS_LGPageSize].[PageID] END DESC,
     CASE @orderBy WHEN 'LoginID' THEN [SYS_LGPageSize].[LoginID] END,
     CASE @orderBy WHEN 'LoginID DESC' THEN [SYS_LGPageSize].[LoginID] END DESC,
     CASE @orderBy WHEN 'PageName' THEN [SYS_LGPageSize].[PageName] END,
     CASE @orderBy WHEN 'PageName DESC' THEN [SYS_LGPageSize].[PageName] END DESC,
     CASE @orderBy WHEN 'PageSize' THEN [SYS_LGPageSize].[PageSize] END,
     CASE @orderBy WHEN 'PageSize DESC' THEN [SYS_LGPageSize].[PageSize] END DESC,
     CASE @orderBy WHEN 'PageNo' THEN [SYS_LGPageSize].[PageNo] END,
     CASE @orderBy WHEN 'PageNo DESC' THEN [SYS_LGPageSize].[PageNo] END DESC,
     CASE @orderBy WHEN 'ApplicationID' THEN [SYS_LGPageSize].[ApplicationID] END,
     CASE @orderBy WHEN 'ApplicationID DESC' THEN [SYS_LGPageSize].[ApplicationID] END DESC 

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
