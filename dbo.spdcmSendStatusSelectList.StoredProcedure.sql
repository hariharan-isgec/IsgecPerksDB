USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmSendStatusSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[DCM_SendStatus].[SendStatusID],
		[DCM_SendStatus].[Description] 
  FROM [DCM_SendStatus] 
  ORDER BY
     CASE @orderBy WHEN 'SendStatusID' THEN [DCM_SendStatus].[SendStatusID] END,
     CASE @orderBy WHEN 'SendStatusID DESC' THEN [DCM_SendStatus].[SendStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [DCM_SendStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [DCM_SendStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
