USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkClaimStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PRK_ClaimStatus].*  
  FROM [PRK_ClaimStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ClaimStatusID' THEN [PRK_ClaimStatus].[ClaimStatusID] END,
     CASE @OrderBy WHEN 'ClaimStatusID DESC' THEN [PRK_ClaimStatus].[ClaimStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PRK_ClaimStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PRK_ClaimStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
