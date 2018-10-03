USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus3SelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_FunctionalStatus3].[FunctionalStatusID3],
		[HRM_FunctionalStatus3].[Description] 
  FROM [HRM_FunctionalStatus3] 
  ORDER BY
     CASE @orderBy WHEN 'FunctionalStatusID3' THEN [HRM_FunctionalStatus3].[FunctionalStatusID3] END,
     CASE @orderBy WHEN 'FunctionalStatusID3 DESC' THEN [HRM_FunctionalStatus3].[FunctionalStatusID3] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_FunctionalStatus3].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_FunctionalStatus3].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
