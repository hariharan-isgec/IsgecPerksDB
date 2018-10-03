USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosElementsSelectList]
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
     CASE @OrderBy WHEN 'WBSID' THEN [IDM_WBS].[WBSID] END,
     CASE @OrderBy WHEN 'WBSID DESC' THEN [IDM_WBS].[WBSID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [IDM_WBS].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [IDM_WBS].[Description] END DESC,
     CASE @OrderBy WHEN 'WBSLevel' THEN [IDM_WBS].[WBSLevel] END,
     CASE @OrderBy WHEN 'WBSLevel DESC' THEN [IDM_WBS].[WBSLevel] END DESC 
  SET @RecordCount = @@RowCount
GO
