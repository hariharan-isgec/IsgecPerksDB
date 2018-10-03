USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlMaterialStateSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[EITL_MaterialState].[StateID] ,
		[EITL_MaterialState].[Description]  
  FROM [EITL_MaterialState] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StateID' THEN [EITL_MaterialState].[StateID] END,
     CASE @OrderBy WHEN 'StateID DESC' THEN [EITL_MaterialState].[StateID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [EITL_MaterialState].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [EITL_MaterialState].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
