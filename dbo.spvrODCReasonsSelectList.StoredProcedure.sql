USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spvrODCReasonsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[VR_ODCReasons].[ReasonID] ,
		[VR_ODCReasons].[Description]  
  FROM [VR_ODCReasons] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ReasonID' THEN [VR_ODCReasons].[ReasonID] END,
     CASE @OrderBy WHEN 'ReasonID DESC' THEN [VR_ODCReasons].[ReasonID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [VR_ODCReasons].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [VR_ODCReasons].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
