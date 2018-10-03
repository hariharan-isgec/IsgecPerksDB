USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtForexTypesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[SPMT_ForexTypes].[FOREXTypeID] ,
		[SPMT_ForexTypes].[Description]  
  FROM [SPMT_ForexTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'FOREXTypeID' THEN [SPMT_ForexTypes].[FOREXTypeID] END,
     CASE @orderBy WHEN 'FOREXTypeID DESC' THEN [SPMT_ForexTypes].[FOREXTypeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [SPMT_ForexTypes].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [SPMT_ForexTypes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
