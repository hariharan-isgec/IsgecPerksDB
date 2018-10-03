USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPakTypesSelectListSearch]
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
 ,PackTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (PackTypeID)
  SELECT [PAK_PakTypes].[PackTypeID] FROM [PAK_PakTypes]
 WHERE  
   ( 
         STR(ISNULL([PAK_PakTypes].[PackTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PakTypes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'PackTypeID' THEN [PAK_PakTypes].[PackTypeID] END,
     CASE @OrderBy WHEN 'PackTypeID DESC' THEN [PAK_PakTypes].[PackTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_PakTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_PakTypes].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PAK_PakTypes].*  
  FROM [PAK_PakTypes] 
      INNER JOIN #PageIndex
          ON [PAK_PakTypes].[PackTypeID] = #PageIndex.PackTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
