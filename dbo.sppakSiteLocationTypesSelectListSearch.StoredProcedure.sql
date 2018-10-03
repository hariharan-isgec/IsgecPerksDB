USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteLocationTypesSelectListSearch]
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
 ,LocationTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (LocationTypeID)
  SELECT [PAK_SiteLocationTypes].[LocationTypeID] FROM [PAK_SiteLocationTypes]
 WHERE  
   ( 
         STR(ISNULL([PAK_SiteLocationTypes].[LocationTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_SiteLocationTypes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'LocationTypeID' THEN [PAK_SiteLocationTypes].[LocationTypeID] END,
     CASE @OrderBy WHEN 'LocationTypeID DESC' THEN [PAK_SiteLocationTypes].[LocationTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_SiteLocationTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_SiteLocationTypes].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PAK_SiteLocationTypes].*  
  FROM [PAK_SiteLocationTypes] 
      INNER JOIN #PageIndex
          ON [PAK_SiteLocationTypes].[LocationTypeID] = #PageIndex.LocationTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
