USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmBloodGroupsSelectByID]
  @BloodGroupID NVarChar(5)
  AS
  SELECT
		[HRM_BloodGroups].[BloodGroupID],
		[HRM_BloodGroups].[Description] 
  FROM [HRM_BloodGroups] 
  WHERE
  [HRM_BloodGroups].[BloodGroupID] = @BloodGroupID
GO
