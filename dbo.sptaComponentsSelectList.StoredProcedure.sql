USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaComponentsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_Components].[ComponentID] ,
		[TA_Components].[Description]  
  FROM [TA_Components] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ComponentID' THEN [TA_Components].[ComponentID] END,
     CASE @OrderBy WHEN 'ComponentID DESC' THEN [TA_Components].[ComponentID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TA_Components].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TA_Components].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
