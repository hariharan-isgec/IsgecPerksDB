USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ERP_RequestTypes].[RequestTypeID] ,
		[ERP_RequestTypes].[Description]  
  FROM [ERP_RequestTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'RequestTypeID' THEN [ERP_RequestTypes].[RequestTypeID] END,
     CASE @OrderBy WHEN 'RequestTypeID DESC' THEN [ERP_RequestTypes].[RequestTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ERP_RequestTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ERP_RequestTypes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
