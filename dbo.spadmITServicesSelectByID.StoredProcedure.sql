USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITServicesSelectByID]
  @ITServiceID NVarChar(15) 
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
  WHERE
  [ADM_ITServices].[ITServiceID] = @ITServiceID
GO
