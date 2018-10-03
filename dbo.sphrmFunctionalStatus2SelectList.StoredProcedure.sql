USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus2SelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_FunctionalStatus2].[FunctionalStatusID2],
		[HRM_FunctionalStatus2].[Description] 
  FROM [HRM_FunctionalStatus2] 
  ORDER BY
     CASE @orderBy WHEN 'FunctionalStatusID2' THEN [HRM_FunctionalStatus2].[FunctionalStatusID2] END,
     CASE @orderBy WHEN 'FunctionalStatusID2 DESC' THEN [HRM_FunctionalStatus2].[FunctionalStatusID2] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_FunctionalStatus2].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_FunctionalStatus2].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
