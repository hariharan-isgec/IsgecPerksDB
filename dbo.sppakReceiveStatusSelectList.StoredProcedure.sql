USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakReceiveStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_ReceiveStatus].*  
  FROM [PAK_ReceiveStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ReceiveStatusID' THEN [PAK_ReceiveStatus].[ReceiveStatusID] END,
     CASE @OrderBy WHEN 'ReceiveStatusID DESC' THEN [PAK_ReceiveStatus].[ReceiveStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_ReceiveStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_ReceiveStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
