USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosParentSelectByID]
  @TaskID Int 
  AS
  SELECT
		[TOSv_Parent].[TaskID] ,
		[TOSv_Parent].[Description] ,
		[TOSv_Parent].[ProjectID] ,
		[TOSv_Parent].[ElementID] ,
		[TOSv_Parent].[FunctionalAreaID] ,
		[TOSv_Parent].[TaskTypeID] ,
		[TOSv_Parent].[Active] ,
		[TOSv_Parent].[AssignedTo]  
  FROM [TOSv_Parent] 
  WHERE
  [TOSv_Parent].[TaskID] = @TaskID
GO
