USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmEMailGroupsSelectByID]
  @EMailGroup NVarChar(50) 
  AS
  SELECT
		[HRM_EMailGroups].[EMailGroup],
		[HRM_EMailGroups].[Description] 
  FROM [HRM_EMailGroups] 
  WHERE
  [HRM_EMailGroups].[EMailGroup] = @EMailGroup
GO
