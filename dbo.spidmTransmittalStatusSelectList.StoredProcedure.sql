USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTransmittalStatusSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[IDM_TransmittalStatus].[TmtlStatusID] ,
		[IDM_TransmittalStatus].[Description]  
  FROM [IDM_TransmittalStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'TmtlStatusID' THEN [IDM_TransmittalStatus].[TmtlStatusID] END,
     CASE @orderBy WHEN 'TmtlStatusID DESC' THEN [IDM_TransmittalStatus].[TmtlStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_TransmittalStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_TransmittalStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
