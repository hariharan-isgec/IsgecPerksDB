USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOTPTasksInsert]
  @ProjectID NVarChar(6),
  @Description NVarChar(300),
  @stdtDefined DateTime,
  @endtDefined DateTime,
  @wuDefined Int,
  @ElementID NVarChar(8),
  @FunctionalAreaID NVarChar(6),
  @TaskTypeID NVarChar(2),
  @AssignedTo NVarChar(8),
  @ParentTaskID Int,
  @Active Bit,
  @Sequence Int,
  @stdtActual DateTime,
  @endtActual DateTime,
  @wuEntered Int,
  @wuBalance Int,
  @Predecessors NVarChar(500),
  @Successors NVarChar(500),
  @wuNoteID Int,
  @IsParent Bit,
  @Return_ProjectID NVarChar(6) = null OUTPUT, 
  @Return_TaskID Int = null OUTPUT 
  AS
  INSERT [TOS_Tasks]
  (
   [ProjectID]
  ,[Description]
  ,[stdtDefined]
  ,[endtDefined]
  ,[wuDefined]
  ,[ElementID]
  ,[FunctionalAreaID]
  ,[TaskTypeID]
  ,[AssignedTo]
  ,[ParentTaskID]
  ,[Active]
  ,[Sequence]
  ,[stdtActual]
  ,[endtActual]
  ,[wuEntered]
  ,[wuBalance]
  ,[Predecessors]
  ,[Successors]
  ,[wuNoteID]
  ,[IsParent]
  )
  VALUES
  (
   UPPER(@ProjectID)
  ,@Description
  ,@stdtDefined
  ,@endtDefined
  ,@wuDefined
  ,@ElementID
  ,@FunctionalAreaID
  ,@TaskTypeID
  ,@AssignedTo
  ,@ParentTaskID
  ,@Active
  ,@Sequence
  ,@stdtActual
  ,@endtActual
  ,@wuEntered
  ,@wuBalance
  ,@Predecessors
  ,@Successors
  ,@wuNoteID
  ,@IsParent
  )
  SET @Return_ProjectID = @ProjectID
  SET @Return_TaskID = Scope_Identity()
GO
