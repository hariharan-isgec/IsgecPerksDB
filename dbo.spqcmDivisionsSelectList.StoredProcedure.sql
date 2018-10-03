USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmDivisionsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_Divisions].[DivisionID] ,
		[HRM_Divisions].[Description]  
  FROM [HRM_Divisions] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'DivisionID' THEN [HRM_Divisions].[DivisionID] END,
     CASE @OrderBy WHEN 'DivisionID DESC' THEN [HRM_Divisions].[DivisionID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [HRM_Divisions].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [HRM_Divisions].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
