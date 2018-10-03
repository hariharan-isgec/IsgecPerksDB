USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostERPGLCodesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [COST_ERPGLCodes].*  
  FROM [COST_ERPGLCodes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'GLCode' THEN [COST_ERPGLCodes].[GLCode] END,
     CASE @OrderBy WHEN 'GLCode DESC' THEN [COST_ERPGLCodes].[GLCode] END DESC,
     CASE @OrderBy WHEN 'GLDescription' THEN [COST_ERPGLCodes].[GLDescription] END,
     CASE @OrderBy WHEN 'GLDescription DESC' THEN [COST_ERPGLCodes].[GLDescription] END DESC 
  SET @RecordCount = @@RowCount
GO
