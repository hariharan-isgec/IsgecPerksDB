USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstSoftwaresSelectListSearch]
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
 ,SoftwareID NVarChar(15) NOT NULL
  )
  INSERT INTO #PageIndex (SoftwareID)
  SELECT [ASM_AstSoftwares].[SoftwareID] FROM [ASM_AstSoftwares]
 WHERE  
   ( 
         LOWER(ISNULL([ASM_AstSoftwares].[SoftwareID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstSoftwares].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'SoftwareID' THEN [ASM_AstSoftwares].[SoftwareID] END,
     CASE @orderBy WHEN 'SoftwareID DESC' THEN [ASM_AstSoftwares].[SoftwareID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ASM_AstSoftwares].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ASM_AstSoftwares].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ASM_AstSoftwares].[SoftwareID],
		[ASM_AstSoftwares].[Description] 
  FROM [ASM_AstSoftwares] 
    	INNER JOIN #PageIndex
          ON [ASM_AstSoftwares].[SoftwareID] = #PageIndex.SoftwareID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
