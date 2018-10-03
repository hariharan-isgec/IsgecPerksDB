USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus4SelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_FunctionalStatus4].[FunctionalStatusID4],
		[HRM_FunctionalStatus4].[Description] 
  FROM [HRM_FunctionalStatus4] 
  ORDER BY
     CASE @orderBy WHEN 'FunctionalStatusID4' THEN [HRM_FunctionalStatus4].[FunctionalStatusID4] END,
     CASE @orderBy WHEN 'FunctionalStatusID4 DESC' THEN [HRM_FunctionalStatus4].[FunctionalStatusID4] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_FunctionalStatus4].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_FunctionalStatus4].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
