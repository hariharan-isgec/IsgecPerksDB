USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstSoftwaresSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ASM_AstSoftwares].[SoftwareID],
		[ASM_AstSoftwares].[Description] 
  FROM [ASM_AstSoftwares] 
  ORDER BY
     CASE @orderBy WHEN 'SoftwareID' THEN [ASM_AstSoftwares].[SoftwareID] END,
     CASE @orderBy WHEN 'SoftwareID DESC' THEN [ASM_AstSoftwares].[SoftwareID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ASM_AstSoftwares].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ASM_AstSoftwares].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
