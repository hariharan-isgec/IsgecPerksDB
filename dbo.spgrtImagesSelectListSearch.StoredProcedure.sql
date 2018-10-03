USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtImagesSelectListSearch]
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
 ,ImageID Int NOT NULL
  )
  INSERT INTO #PageIndex (ImageID)
  SELECT [GRT_Images].[ImageID] FROM [GRT_Images]
 WHERE  
   ( 
         STR(ISNULL([GRT_Images].[ImageID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([GRT_Images].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([GRT_Images].[ImageFileName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([GRT_Images].[DiskFileName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ImageID' THEN [GRT_Images].[ImageID] END,
     CASE @OrderBy WHEN 'ImageID DESC' THEN [GRT_Images].[ImageID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [GRT_Images].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [GRT_Images].[Description] END DESC,
     CASE @OrderBy WHEN 'ImageFileName' THEN [GRT_Images].[ImageFileName] END,
     CASE @OrderBy WHEN 'ImageFileName DESC' THEN [GRT_Images].[ImageFileName] END DESC,
     CASE @OrderBy WHEN 'DiskFileName' THEN [GRT_Images].[DiskFileName] END,
     CASE @OrderBy WHEN 'DiskFileName DESC' THEN [GRT_Images].[DiskFileName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[GRT_Images].[ImageID] ,
		[GRT_Images].[Description] ,
		[GRT_Images].[ImageFileName] ,
		[GRT_Images].[DiskFileName]  
  FROM [GRT_Images] 
    	INNER JOIN #PageIndex
          ON [GRT_Images].[ImageID] = #PageIndex.ImageID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
