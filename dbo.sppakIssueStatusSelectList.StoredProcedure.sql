USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakIssueStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_IssueStatus].*  
  FROM [PAK_IssueStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'IssueStatusID' THEN [PAK_IssueStatus].[IssueStatusID] END,
     CASE @OrderBy WHEN 'IssueStatusID DESC' THEN [PAK_IssueStatus].[IssueStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_IssueStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_IssueStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
