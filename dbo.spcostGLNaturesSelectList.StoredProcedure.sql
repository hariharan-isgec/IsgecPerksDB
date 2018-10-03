USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostGLNaturesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [COST_GLNatures].*  
  FROM [COST_GLNatures] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'GLNatureID' THEN [COST_GLNatures].[GLNatureID] END,
     CASE @OrderBy WHEN 'GLNatureID DESC' THEN [COST_GLNatures].[GLNatureID] END DESC,
     CASE @OrderBy WHEN 'GLNatureDescription' THEN [COST_GLNatures].[GLNatureDescription] END,
     CASE @OrderBy WHEN 'GLNatureDescription DESC' THEN [COST_GLNatures].[GLNatureDescription] END DESC 
  SET @RecordCount = @@RowCount
GO
