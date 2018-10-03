USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastSoftwaresSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[AST_Softwares].[SoftwareID],
		[AST_Softwares].[Description] 
  FROM [AST_Softwares] 
  ORDER BY
     CASE @orderBy WHEN 'SoftwareID' THEN [AST_Softwares].[SoftwareID] END,
     CASE @orderBy WHEN 'SoftwareID DESC' THEN [AST_Softwares].[SoftwareID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [AST_Softwares].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [AST_Softwares].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
