USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDetailViewTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [WF_DetailViewTypes].*  
  FROM [WF_DetailViewTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'DVTypeID' THEN [WF_DetailViewTypes].[DVTypeID] END,
     CASE @OrderBy WHEN 'DVTypeID DESC' THEN [WF_DetailViewTypes].[DVTypeID] END DESC,
     CASE @OrderBy WHEN 'DVTypeDescription' THEN [WF_DetailViewTypes].[DVTypeDescription] END,
     CASE @OrderBy WHEN 'DVTypeDescription DESC' THEN [WF_DetailViewTypes].[DVTypeDescription] END DESC 
  SET @RecordCount = @@RowCount
GO
