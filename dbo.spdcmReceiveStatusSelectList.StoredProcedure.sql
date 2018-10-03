USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmReceiveStatusSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[DCM_ReceiveStatus].[ReceiveStatusID],
		[DCM_ReceiveStatus].[Description] 
  FROM [DCM_ReceiveStatus] 
  ORDER BY
     CASE @orderBy WHEN 'ReceiveStatusID' THEN [DCM_ReceiveStatus].[ReceiveStatusID] END,
     CASE @orderBy WHEN 'ReceiveStatusID DESC' THEN [DCM_ReceiveStatus].[ReceiveStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [DCM_ReceiveStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [DCM_ReceiveStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
