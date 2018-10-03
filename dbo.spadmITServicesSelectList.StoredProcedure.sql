USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITServicesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ADM_ITServices].[ITServiceID],
		[ADM_ITServices].[Description],
		[ADM_ITServices].[AlertAfterDays],
		[ADM_ITServices].[EMailGroup],
		[HRM_EMailGroups1].[EMailGroup] AS HRM_EMailGroups1_EMailGroup,
		[HRM_EMailGroups1].[Description] AS HRM_EMailGroups1_Description 
  FROM [ADM_ITServices] 
  LEFT OUTER JOIN [HRM_EMailGroups] AS [HRM_EMailGroups1]
    ON [ADM_ITServices].[EMailGroup] = [HRM_EMailGroups1].[EMailGroup]
  ORDER BY
     CASE @orderBy WHEN 'ITServiceID' THEN [ADM_ITServices].[ITServiceID] END,
     CASE @orderBy WHEN 'ITServiceID DESC' THEN [ADM_ITServices].[ITServiceID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ADM_ITServices].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ADM_ITServices].[Description] END DESC,
     CASE @orderBy WHEN 'AlertAfterDays' THEN [ADM_ITServices].[AlertAfterDays] END,
     CASE @orderBy WHEN 'AlertAfterDays DESC' THEN [ADM_ITServices].[AlertAfterDays] END DESC,
     CASE @orderBy WHEN 'EMailGroup' THEN [ADM_ITServices].[EMailGroup] END,
     CASE @orderBy WHEN 'EMailGroup DESC' THEN [ADM_ITServices].[EMailGroup] END DESC,
     CASE @orderBy WHEN 'HRM_EMailGroups1_EMailGroup' THEN [HRM_EMailGroups1].[EMailGroup] END,
     CASE @orderBy WHEN 'HRM_EMailGroups1_EMailGroup DESC' THEN [HRM_EMailGroups1].[EMailGroup] END DESC,
     CASE @orderBy WHEN 'HRM_EMailGroups1_Description' THEN [HRM_EMailGroups1].[Description] END,
     CASE @orderBy WHEN 'HRM_EMailGroups1_Description DESC' THEN [HRM_EMailGroups1].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
