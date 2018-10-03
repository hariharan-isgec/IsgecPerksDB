USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBRowTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [WF_DBRowTypes].*  
  FROM [WF_DBRowTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'RowTypeID' THEN [WF_DBRowTypes].[RowTypeID] END,
     CASE @OrderBy WHEN 'RowTypeID DESC' THEN [WF_DBRowTypes].[RowTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [WF_DBRowTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [WF_DBRowTypes].[Description] END DESC,
     CASE @OrderBy WHEN 'cssClass' THEN [WF_DBRowTypes].[cssClass] END,
     CASE @OrderBy WHEN 'cssClass DESC' THEN [WF_DBRowTypes].[cssClass] END DESC 
  SET @RecordCount = @@RowCount
GO
