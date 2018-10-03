USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBIconsSelectListSearch]
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
 ,DBIconID Int NOT NULL
  )
  INSERT INTO #PageIndex (DBIconID)
  SELECT [WF_DBIcons].[DBIconID] FROM [WF_DBIcons]
 WHERE  
   ( 
         STR(ISNULL([WF_DBIcons].[DBIconID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([WF_DBIcons].[IconName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([WF_DBIcons].[IconStyle],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'DBIconID' THEN [WF_DBIcons].[DBIconID] END,
     CASE @OrderBy WHEN 'DBIconID DESC' THEN [WF_DBIcons].[DBIconID] END DESC,
     CASE @OrderBy WHEN 'IconName' THEN [WF_DBIcons].[IconName] END,
     CASE @OrderBy WHEN 'IconName DESC' THEN [WF_DBIcons].[IconName] END DESC,
     CASE @OrderBy WHEN 'IconStyle' THEN [WF_DBIcons].[IconStyle] END,
     CASE @OrderBy WHEN 'IconStyle DESC' THEN [WF_DBIcons].[IconStyle] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [WF_DBIcons].*  
  FROM [WF_DBIcons] 
      INNER JOIN #PageIndex
          ON [WF_DBIcons].[DBIconID] = #PageIndex.DBIconID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
