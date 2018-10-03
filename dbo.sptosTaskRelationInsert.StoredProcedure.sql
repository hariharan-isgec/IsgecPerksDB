USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosTaskRelationInsert]
  @TaskID Int,
  @ChildID Int,
  @Sequence Int,
  @Active Bit,
  @Return_TaskID Int = null OUTPUT, 
  @Return_ChildID Int = null OUTPUT 
  AS
  INSERT [TOS_TaskRelation]
  (
   [TaskID]
  ,[ChildID]
  ,[Sequence]
  ,[Active]
  )
  VALUES
  (
   @TaskID
  ,@ChildID
  ,@Sequence
  ,@Active
  )
  SET @Return_TaskID = @TaskID
  SET @Return_ChildID = @ChildID
GO
