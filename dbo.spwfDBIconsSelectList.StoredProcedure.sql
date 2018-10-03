USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBIconsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [WF_DBIcons].*  
  FROM [WF_DBIcons] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'DBIconID' THEN [WF_DBIcons].[DBIconID] END,
     CASE @OrderBy WHEN 'DBIconID DESC' THEN [WF_DBIcons].[DBIconID] END DESC,
     CASE @OrderBy WHEN 'IconName' THEN [WF_DBIcons].[IconName] END,
     CASE @OrderBy WHEN 'IconName DESC' THEN [WF_DBIcons].[IconName] END DESC,
     CASE @OrderBy WHEN 'IconStyle' THEN [WF_DBIcons].[IconStyle] END,
     CASE @OrderBy WHEN 'IconStyle DESC' THEN [WF_DBIcons].[IconStyle] END DESC 
  SET @RecordCount = @@RowCount
GO
