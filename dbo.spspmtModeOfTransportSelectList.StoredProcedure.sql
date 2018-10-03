USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtModeOfTransportSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SPMT_ModeOfTransport].*  
  FROM [SPMT_ModeOfTransport] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ModeID' THEN [SPMT_ModeOfTransport].[ModeID] END,
     CASE @OrderBy WHEN 'ModeID DESC' THEN [SPMT_ModeOfTransport].[ModeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_ModeOfTransport].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_ModeOfTransport].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
