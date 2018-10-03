USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogPortsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [ELOG_Ports].*  
  FROM [ELOG_Ports] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'PortID' THEN [ELOG_Ports].[PortID] END,
     CASE @OrderBy WHEN 'PortID DESC' THEN [ELOG_Ports].[PortID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_Ports].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_Ports].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
