USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastRAMsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[AST_Rams].[RamID],
		[AST_Rams].[Description] 
  FROM [AST_Rams] 
  ORDER BY
     CASE @orderBy WHEN 'RamID' THEN [AST_Rams].[RamID] END,
     CASE @orderBy WHEN 'RamID DESC' THEN [AST_Rams].[RamID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [AST_Rams].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [AST_Rams].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
