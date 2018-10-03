USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PRK_Status].*  
  FROM [PRK_Status] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [PRK_Status].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [PRK_Status].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PRK_Status].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PRK_Status].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
