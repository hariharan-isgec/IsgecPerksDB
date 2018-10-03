USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectInputStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [COST_ProjectInputStatus].*  
  FROM [COST_ProjectInputStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [COST_ProjectInputStatus].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [COST_ProjectInputStatus].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [COST_ProjectInputStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [COST_ProjectInputStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
