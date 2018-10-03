USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ERP_RequestStatus].[StatusID] ,
		[ERP_RequestStatus].[Description]  
  FROM [ERP_RequestStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [ERP_RequestStatus].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [ERP_RequestStatus].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ERP_RequestStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ERP_RequestStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
