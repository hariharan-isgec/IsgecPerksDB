USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmReceiveStatusSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[IDM_ReceiveStatus].[ReceiveStatusID] ,
		[IDM_ReceiveStatus].[Description]  
  FROM [IDM_ReceiveStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'ReceiveStatusID' THEN [IDM_ReceiveStatus].[ReceiveStatusID] END,
     CASE @orderBy WHEN 'ReceiveStatusID DESC' THEN [IDM_ReceiveStatus].[ReceiveStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_ReceiveStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_ReceiveStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
