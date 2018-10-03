USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosTaskRelationSelectByID]
  @TaskID Int,
  @ChildID Int 
  AS
  SELECT
		[TOS_TaskRelation].[TaskID] ,
		[TOS_TaskRelation].[ChildID] ,
		[TOS_TaskRelation].[Sequence] ,
		[TOS_TaskRelation].[Active] ,
		[TOS_Tasks1].[Description] AS TOS_Tasks1_Description,
		[TOS_Tasks2].[Description] AS TOS_Tasks2_Description 
  FROM [TOS_TaskRelation] 
  INNER JOIN [TOS_Tasks] AS [TOS_Tasks1]
    ON [TOS_TaskRelation].[TaskID] = [TOS_Tasks1].[TaskID]
  INNER JOIN [TOS_Tasks] AS [TOS_Tasks2]
    ON [TOS_TaskRelation].[ChildID] = [TOS_Tasks2].[TaskID]
  WHERE
  [TOS_TaskRelation].[TaskID] = @TaskID
  AND [TOS_TaskRelation].[ChildID] = @ChildID
GO
