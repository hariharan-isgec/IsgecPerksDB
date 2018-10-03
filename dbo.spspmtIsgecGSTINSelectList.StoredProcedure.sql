USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtIsgecGSTINSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT 
    [SPMT_IsgecGSTIN].[GSTID],
    [SPMT_IsgecGSTIN].[State] + ' - ' + [SPMT_IsgecGSTIN].[Description] as Description, 
    [SPMT_IsgecGSTIN].[State]
  FROM [SPMT_IsgecGSTIN] 
  WHERE 1 = 1  
  ORDER BY [SPMT_IsgecGSTIN].[State]
     --CASE @OrderBy WHEN 'GSTID' THEN [SPMT_IsgecGSTIN].[GSTID] END,
     --CASE @OrderBy WHEN 'GSTID DESC' THEN [SPMT_IsgecGSTIN].[GSTID] END DESC,
     --CASE @OrderBy WHEN 'Description' THEN [SPMT_IsgecGSTIN].[Description] END,
     --CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_IsgecGSTIN].[Description] END DESC,
     --CASE @OrderBy WHEN 'State' THEN [SPMT_IsgecGSTIN].[State] END,
     --CASE @OrderBy WHEN 'State DESC' THEN [SPMT_IsgecGSTIN].[State] END DESC 
  SET @RecordCount = @@RowCount
GO
