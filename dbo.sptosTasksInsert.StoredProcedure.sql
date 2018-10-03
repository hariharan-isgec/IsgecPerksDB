USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosTasksInsert]
  @Description NVarChar(300),
  @wuDefined Int,
  @stdtDefined DateTime,
  @endtDefined DateTime,
  @stdtActual DateTime,
  @Sequence Int,
  @endtActual DateTime,
  @ProjectID NVarChar(6),
  @ElementID NVarChar(8),
  @FunctionalAreaID NVarChar(6),
  @TaskTypeID NVarChar(2),
  @Active Bit,
  @wuEntered Int,
  @wuBalance Int,
  @wuNoteID Int,
  @AssignedTo NVarChar(8),
  @Predecessors NVarChar(500),
  @Successors NVarChar(500),
  @ParentTaskID Int,
  @Return_TaskID Int = null OUTPUT 
  AS
  INSERT [TOS_Tasks]
  (
   [Description]
  ,[wuDefined]
  ,[stdtDefined]
  ,[endtDefined]
  ,[stdtActual]
  ,[Sequence]
  ,[endtActual]
  ,[ProjectID]
  ,[ElementID]
  ,[FunctionalAreaID]
  ,[TaskTypeID]
  ,[Active]
  ,[wuEntered]
  ,[wuBalance]
  ,[wuNoteID]
  ,[AssignedTo]
  ,[Predecessors]
  ,[Successors]
  ,[ParentTaskID]
  )
  VALUES
  (
   @Description
  ,@wuDefined
  ,@stdtDefined
  ,@endtDefined
  ,@stdtActual
  ,@Sequence
  ,@endtActual
  ,@ProjectID
  ,@ElementID
  ,@FunctionalAreaID
  ,@TaskTypeID
  ,@Active
  ,@wuEntered
  ,@wuBalance
  ,@wuNoteID
  ,@AssignedTo
  ,@Predecessors
  ,@Successors
  ,@ParentTaskID
  )
  SET @Return_TaskID = Scope_Identity()
GO
