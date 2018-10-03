USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTransmittalTypesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[IDM_TransmittalTypes].[TmtlTypeID] ,
		[IDM_TransmittalTypes].[Description]  
  FROM [IDM_TransmittalTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'TmtlTypeID' THEN [IDM_TransmittalTypes].[TmtlTypeID] END,
     CASE @orderBy WHEN 'TmtlTypeID DESC' THEN [IDM_TransmittalTypes].[TmtlTypeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_TransmittalTypes].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_TransmittalTypes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
