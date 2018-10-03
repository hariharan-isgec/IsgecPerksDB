USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOTPParentTasksSelectByID]
  @ProjectID NVarChar(6),
  @TaskID Int 
  AS
  SELECT
		[TOSv_Parent].[ProjectID] ,
		[TOSv_Parent].[TaskID] ,
		[TOSv_Parent].[Description] ,
		[TOSv_Parent].[Active] ,
		[TOSv_Parent].[ParentTaskID] ,
		[TOSv_Parent].[IsParent]  
  FROM [TOSv_Parent] 
  WHERE
  [TOSv_Parent].[ProjectID] = @ProjectID
  AND [TOSv_Parent].[TaskID] = @TaskID
GO
