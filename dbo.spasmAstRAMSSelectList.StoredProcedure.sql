USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstRAMSSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ASM_AstRAMS].[RAMID],
		[ASM_AstRAMS].[Description] 
  FROM [ASM_AstRAMS] 
  ORDER BY
     CASE @orderBy WHEN 'RAMID' THEN [ASM_AstRAMS].[RAMID] END,
     CASE @orderBy WHEN 'RAMID DESC' THEN [ASM_AstRAMS].[RAMID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ASM_AstRAMS].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ASM_AstRAMS].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
