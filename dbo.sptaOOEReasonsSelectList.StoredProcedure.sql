USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaOOEReasonsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_OOEReasons].[ReasonID] ,
		[TA_OOEReasons].[Description]  
  FROM [TA_OOEReasons] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ReasonID' THEN [TA_OOEReasons].[ReasonID] END,
     CASE @OrderBy WHEN 'ReasonID DESC' THEN [TA_OOEReasons].[ReasonID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TA_OOEReasons].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TA_OOEReasons].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
