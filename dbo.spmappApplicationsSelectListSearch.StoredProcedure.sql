USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmappApplicationsSelectListSearch]
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
 ,AppID Int NOT NULL
  )
  INSERT INTO #PageIndex (AppID)
  SELECT [MAPP_Applications].[AppID] FROM [MAPP_Applications]
  LEFT OUTER JOIN [WF_DBIcons] AS [WF_DBIcons1]
    ON [MAPP_Applications].[AppIconID] = [WF_DBIcons1].[DBIconID]
 WHERE  
   ( 
         STR(ISNULL([MAPP_Applications].[AppID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([MAPP_Applications].[ApplicationName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MAPP_Applications].[ApplicationDescription],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MAPP_Applications].[MainPageURL],'')) LIKE @KeyWord1
     OR STR(ISNULL([MAPP_Applications].[AppIconID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([MAPP_Applications].[AppIconStyle],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'AppID' THEN [MAPP_Applications].[AppID] END,
     CASE @OrderBy WHEN 'AppID DESC' THEN [MAPP_Applications].[AppID] END DESC,
     CASE @OrderBy WHEN 'ApplicationName' THEN [MAPP_Applications].[ApplicationName] END,
     CASE @OrderBy WHEN 'ApplicationName DESC' THEN [MAPP_Applications].[ApplicationName] END DESC,
     CASE @OrderBy WHEN 'ApplicationDescription' THEN [MAPP_Applications].[ApplicationDescription] END,
     CASE @OrderBy WHEN 'ApplicationDescription DESC' THEN [MAPP_Applications].[ApplicationDescription] END DESC,
     CASE @OrderBy WHEN 'IsActive' THEN [MAPP_Applications].[IsActive] END,
     CASE @OrderBy WHEN 'IsActive DESC' THEN [MAPP_Applications].[IsActive] END DESC,
     CASE @OrderBy WHEN 'MainPageURL' THEN [MAPP_Applications].[MainPageURL] END,
     CASE @OrderBy WHEN 'MainPageURL DESC' THEN [MAPP_Applications].[MainPageURL] END DESC,
     CASE @OrderBy WHEN 'AppIconID' THEN [MAPP_Applications].[AppIconID] END,
     CASE @OrderBy WHEN 'AppIconID DESC' THEN [MAPP_Applications].[AppIconID] END DESC,
     CASE @OrderBy WHEN 'AppIconStyle' THEN [MAPP_Applications].[AppIconStyle] END,
     CASE @OrderBy WHEN 'AppIconStyle DESC' THEN [MAPP_Applications].[AppIconStyle] END DESC,
     CASE @OrderBy WHEN 'WF_DBIcons1_IconName' THEN [WF_DBIcons1].[IconName] END,
     CASE @OrderBy WHEN 'WF_DBIcons1_IconName DESC' THEN [WF_DBIcons1].[IconName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [MAPP_Applications].* ,
    [WF_DBIcons1].[IconName] AS WF_DBIcons1_IconName 
  FROM [MAPP_Applications] 
      INNER JOIN #PageIndex
          ON [MAPP_Applications].[AppID] = #PageIndex.AppID
  LEFT OUTER JOIN [WF_DBIcons] AS [WF_DBIcons1]
    ON [MAPP_Applications].[AppIconID] = [WF_DBIcons1].[DBIconID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
