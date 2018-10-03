USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaBillStatesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_BillStates].[BillStatusID] ,
		[TA_BillStates].[Description]  
  FROM [TA_BillStates] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'BillStatusID' THEN [TA_BillStates].[BillStatusID] END,
     CASE @OrderBy WHEN 'BillStatusID DESC' THEN [TA_BillStates].[BillStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TA_BillStates].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TA_BillStates].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
