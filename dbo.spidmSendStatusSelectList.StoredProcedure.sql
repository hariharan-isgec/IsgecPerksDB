USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmSendStatusSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[IDM_SendStatus].[SendStatusID] ,
		[IDM_SendStatus].[Description] ,
		[IDM_SendStatus].[ReceivedBack] ,
		[IDM_SendStatus].[IsItForApproval]  
  FROM [IDM_SendStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'SendStatusID' THEN [IDM_SendStatus].[SendStatusID] END,
     CASE @orderBy WHEN 'SendStatusID DESC' THEN [IDM_SendStatus].[SendStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_SendStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_SendStatus].[Description] END DESC,
     CASE @orderBy WHEN 'ReceivedBack' THEN [IDM_SendStatus].[ReceivedBack] END,
     CASE @orderBy WHEN 'ReceivedBack DESC' THEN [IDM_SendStatus].[ReceivedBack] END DESC,
     CASE @orderBy WHEN 'IsItForApproval' THEN [IDM_SendStatus].[IsItForApproval] END,
     CASE @orderBy WHEN 'IsItForApproval DESC' THEN [IDM_SendStatus].[IsItForApproval] END DESC 
  SET @RecordCount = @@RowCount
GO
