USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SC_Status].*  
  FROM [SC_Status] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [SC_Status].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [SC_Status].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SC_Status].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SC_Status].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
