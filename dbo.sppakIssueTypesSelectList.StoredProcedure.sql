USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakIssueTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_IssueTypes].*  
  FROM [PAK_IssueTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'IssueTypeID' THEN [PAK_IssueTypes].[IssueTypeID] END,
     CASE @OrderBy WHEN 'IssueTypeID DESC' THEN [PAK_IssueTypes].[IssueTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_IssueTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_IssueTypes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
