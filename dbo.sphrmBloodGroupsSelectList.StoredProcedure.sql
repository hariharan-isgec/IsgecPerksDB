USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmBloodGroupsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_BloodGroups].[BloodGroupID],
		[HRM_BloodGroups].[Description] 
  FROM [HRM_BloodGroups] 
  ORDER BY
     CASE @orderBy WHEN 'BloodGroupID' THEN [HRM_BloodGroups].[BloodGroupID] END,
     CASE @orderBy WHEN 'BloodGroupID DESC' THEN [HRM_BloodGroups].[BloodGroupID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_BloodGroups].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_BloodGroups].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
