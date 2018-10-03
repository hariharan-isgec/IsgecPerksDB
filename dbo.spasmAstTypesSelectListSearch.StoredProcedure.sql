USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstTypesSelectListSearch]
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
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,AssetTypeID NVarChar(10) NOT NULL
  )
  INSERT INTO #PageIndex (AssetTypeID)
  SELECT [ASM_AstTypes].[AssetTypeID] FROM [ASM_AstTypes]
 WHERE  
   ( 
         LOWER(ISNULL([ASM_AstTypes].[AssetTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstTypes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'AssetTypeID' THEN [ASM_AstTypes].[AssetTypeID] END,
     CASE @orderBy WHEN 'AssetTypeID DESC' THEN [ASM_AstTypes].[AssetTypeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ASM_AstTypes].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ASM_AstTypes].[Description] END DESC,
     CASE @orderBy WHEN 'IssueToLocation' THEN [ASM_AstTypes].[IssueToLocation] END,
     CASE @orderBy WHEN 'IssueToLocation DESC' THEN [ASM_AstTypes].[IssueToLocation] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ASM_AstTypes].[AssetTypeID],
		[ASM_AstTypes].[Description],
		[ASM_AstTypes].[IssueToLocation] 
  FROM [ASM_AstTypes] 
    	INNER JOIN #PageIndex
          ON [ASM_AstTypes].[AssetTypeID] = #PageIndex.AssetTypeID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
