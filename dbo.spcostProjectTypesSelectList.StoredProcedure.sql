USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [COST_ProjectTypes].*  
  FROM [COST_ProjectTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ProjectTypeID' THEN [COST_ProjectTypes].[ProjectTypeID] END,
     CASE @OrderBy WHEN 'ProjectTypeID DESC' THEN [COST_ProjectTypes].[ProjectTypeID] END DESC,
     CASE @OrderBy WHEN 'ProjectTypeDescription' THEN [COST_ProjectTypes].[ProjectTypeDescription] END,
     CASE @OrderBy WHEN 'ProjectTypeDescription DESC' THEN [COST_ProjectTypes].[ProjectTypeDescription] END DESC 
  SET @RecordCount = @@RowCount
GO
