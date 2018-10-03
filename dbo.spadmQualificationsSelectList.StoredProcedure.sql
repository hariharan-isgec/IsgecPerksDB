USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmQualificationsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_Qualifications].[QualificationID],
		[HRM_Qualifications].[Description] 
  FROM [HRM_Qualifications] 
  ORDER BY
     CASE @orderBy WHEN 'QualificationID' THEN [HRM_Qualifications].[QualificationID] END,
     CASE @orderBy WHEN 'QualificationID DESC' THEN [HRM_Qualifications].[QualificationID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_Qualifications].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_Qualifications].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
