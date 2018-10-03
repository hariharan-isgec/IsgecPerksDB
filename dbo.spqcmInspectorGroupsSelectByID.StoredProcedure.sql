USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectorGroupsSelectByID]
  @LoginID NVarChar(8),
  @GroupID Int 
  AS
  SELECT
		[QCM_InspectorGroups].[GroupID] ,
		[QCM_InspectorGroups].[Description]  
  FROM [QCM_InspectorGroups] 
  WHERE
  [QCM_InspectorGroups].[GroupID] = @GroupID
GO
