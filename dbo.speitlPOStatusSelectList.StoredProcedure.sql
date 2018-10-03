USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPOStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[EITL_POStatus].[StatusID] ,
		[EITL_POStatus].[Description]  
  FROM [EITL_POStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [EITL_POStatus].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [EITL_POStatus].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [EITL_POStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [EITL_POStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
