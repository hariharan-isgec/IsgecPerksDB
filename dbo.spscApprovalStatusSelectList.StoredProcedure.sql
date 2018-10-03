USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscApprovalStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SC_ApprovalStatus].*  
  FROM [SC_ApprovalStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [SC_ApprovalStatus].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [SC_ApprovalStatus].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SC_ApprovalStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SC_ApprovalStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
