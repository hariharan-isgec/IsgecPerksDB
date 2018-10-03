USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfGraphTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [WF_GraphTypes].*  
  FROM [WF_GraphTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'GraphTypeID' THEN [WF_GraphTypes].[GraphTypeID] END,
     CASE @OrderBy WHEN 'GraphTypeID DESC' THEN [WF_GraphTypes].[GraphTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [WF_GraphTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [WF_GraphTypes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
