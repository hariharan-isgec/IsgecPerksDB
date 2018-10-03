USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwLGPageSizeSelectListSearch]
  @LoginID NVarChar(8),
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
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,PageID Int NOT NULL
  )
  INSERT INTO #PageIndex (PageID)
  SELECT [SYS_LGPageSize].[PageID] FROM [SYS_LGPageSize]
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_LGPageSize].[ApplicationID] = [SYS_Applications1].[ApplicationID]
 WHERE  
      [SYS_LGPageSize].[ApplicationID] = (@ApplicationID)
   AND ( 
         STR(ISNULL([SYS_LGPageSize].[PageID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_LGPageSize].[LoginID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_LGPageSize].[PageName],'')) LIKE @KeyWord1
     OR STR(ISNULL([SYS_LGPageSize].[ApplicationID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_LGPageSize].[PageSize], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_LGPageSize].[PageNo], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'PageID' THEN [SYS_LGPageSize].[PageID] END,
     CASE @OrderBy WHEN 'PageID DESC' THEN [SYS_LGPageSize].[PageID] END DESC,
     CASE @OrderBy WHEN 'LoginID' THEN [SYS_LGPageSize].[LoginID] END,
     CASE @OrderBy WHEN 'LoginID DESC' THEN [SYS_LGPageSize].[LoginID] END DESC,
     CASE @OrderBy WHEN 'PageName' THEN [SYS_LGPageSize].[PageName] END,
     CASE @OrderBy WHEN 'PageName DESC' THEN [SYS_LGPageSize].[PageName] END DESC,
     CASE @OrderBy WHEN 'ApplicationID' THEN [SYS_LGPageSize].[ApplicationID] END,
     CASE @OrderBy WHEN 'ApplicationID DESC' THEN [SYS_LGPageSize].[ApplicationID] END DESC,
     CASE @OrderBy WHEN 'PageSize' THEN [SYS_LGPageSize].[PageSize] END,
     CASE @OrderBy WHEN 'PageSize DESC' THEN [SYS_LGPageSize].[PageSize] END DESC,
     CASE @OrderBy WHEN 'PageNo' THEN [SYS_LGPageSize].[PageNo] END,
     CASE @OrderBy WHEN 'PageNo DESC' THEN [SYS_LGPageSize].[PageNo] END DESC,
     CASE @OrderBy WHEN 'SYS_Applications1_Description' THEN [SYS_Applications1].[Description] END,
     CASE @OrderBy WHEN 'SYS_Applications1_Description DESC' THEN [SYS_Applications1].[Description] END DESC 

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
