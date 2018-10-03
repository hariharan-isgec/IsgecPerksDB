USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogChargeTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [ELOG_ChargeTypes].*  
  FROM [ELOG_ChargeTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ChargeTypeID' THEN [ELOG_ChargeTypes].[ChargeTypeID] END,
     CASE @OrderBy WHEN 'ChargeTypeID DESC' THEN [ELOG_ChargeTypes].[ChargeTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_ChargeTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_ChargeTypes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
