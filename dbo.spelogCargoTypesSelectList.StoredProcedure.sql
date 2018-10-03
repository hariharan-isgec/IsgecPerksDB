USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogCargoTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [ELOG_CargoTypes].*  
  FROM [ELOG_CargoTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'CargoTypeID' THEN [ELOG_CargoTypes].[CargoTypeID] END,
     CASE @OrderBy WHEN 'CargoTypeID DESC' THEN [ELOG_CargoTypes].[CargoTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_CargoTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_CargoTypes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
