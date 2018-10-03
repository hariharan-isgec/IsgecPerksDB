USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomElementsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[IDM_WBS].[WBSID] ,
		[IDM_WBS].[Description] ,
		[IDM_WBS].[WBSLevel]  
  FROM [IDM_WBS] 
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'WBSID' THEN [IDM_WBS].[WBSID] END,
     CASE @orderBy WHEN 'WBSID DESC' THEN [IDM_WBS].[WBSID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_WBS].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_WBS].[Description] END DESC,
     CASE @orderBy WHEN 'WBSLevel' THEN [IDM_WBS].[WBSLevel] END,
     CASE @orderBy WHEN 'WBSLevel DESC' THEN [IDM_WBS].[WBSLevel] END DESC 
  SET @RecordCount = @@RowCount
GO
