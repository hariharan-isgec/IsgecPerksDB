USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCLastNumberSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SPMT_DCLastNumber].*  
  FROM [SPMT_DCLastNumber] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'NumberID' THEN [SPMT_DCLastNumber].[NumberID] END,
     CASE @OrderBy WHEN 'NumberID DESC' THEN [SPMT_DCLastNumber].[NumberID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_DCLastNumber].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_DCLastNumber].[Description] END DESC,
     CASE @OrderBy WHEN 'LastNumber' THEN [SPMT_DCLastNumber].[LastNumber] END,
     CASE @OrderBy WHEN 'LastNumber DESC' THEN [SPMT_DCLastNumber].[LastNumber] END DESC,
     CASE @OrderBy WHEN 'Year' THEN [SPMT_DCLastNumber].[Year] END,
     CASE @OrderBy WHEN 'Year DESC' THEN [SPMT_DCLastNumber].[Year] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [SPMT_DCLastNumber].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [SPMT_DCLastNumber].[Active] END DESC 
  SET @RecordCount = @@RowCount
GO
