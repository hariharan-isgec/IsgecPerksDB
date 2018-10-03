USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmIssuedViaSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[IDM_IssuedVia].[IssuedViaID] ,
		[IDM_IssuedVia].[Description]  
  FROM [IDM_IssuedVia] 
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'IssuedViaID' THEN [IDM_IssuedVia].[IssuedViaID] END,
     CASE @orderBy WHEN 'IssuedViaID DESC' THEN [IDM_IssuedVia].[IssuedViaID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_IssuedVia].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_IssuedVia].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
