USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus1SelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_FunctionalStatus1].[FunctionalStatusID1],
		[HRM_FunctionalStatus1].[Description] 
  FROM [HRM_FunctionalStatus1] 
  ORDER BY
     CASE @orderBy WHEN 'FunctionalStatusID1' THEN [HRM_FunctionalStatus1].[FunctionalStatusID1] END,
     CASE @orderBy WHEN 'FunctionalStatusID1 DESC' THEN [HRM_FunctionalStatus1].[FunctionalStatusID1] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_FunctionalStatus1].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_FunctionalStatus1].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
