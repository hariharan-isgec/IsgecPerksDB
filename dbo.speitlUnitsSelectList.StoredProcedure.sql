USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlUnitsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[EITL_Units].[UnitID] ,
		[EITL_Units].[Description]  
  FROM [EITL_Units] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'UnitID' THEN [EITL_Units].[UnitID] END,
     CASE @OrderBy WHEN 'UnitID DESC' THEN [EITL_Units].[UnitID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [EITL_Units].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [EITL_Units].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
