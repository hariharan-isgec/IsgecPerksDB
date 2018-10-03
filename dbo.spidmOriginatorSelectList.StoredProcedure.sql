USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmOriginatorSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[IDM_Originator].[OriginatorID] ,
		[IDM_Originator].[Description]  
  FROM [IDM_Originator] 
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'OriginatorID' THEN [IDM_Originator].[OriginatorID] END,
     CASE @orderBy WHEN 'OriginatorID DESC' THEN [IDM_Originator].[OriginatorID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_Originator].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_Originator].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
