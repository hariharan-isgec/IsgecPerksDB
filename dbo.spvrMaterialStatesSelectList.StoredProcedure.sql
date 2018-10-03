USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrMaterialStatesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[VR_MaterialStates].[MaterialStateID] ,
		[VR_MaterialStates].[Description]  
  FROM [VR_MaterialStates] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'MaterialStateID' THEN [VR_MaterialStates].[MaterialStateID] END,
     CASE @OrderBy WHEN 'MaterialStateID DESC' THEN [VR_MaterialStates].[MaterialStateID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [VR_MaterialStates].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [VR_MaterialStates].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
