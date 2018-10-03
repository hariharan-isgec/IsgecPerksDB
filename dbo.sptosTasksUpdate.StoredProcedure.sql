USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosTasksUpdate]
  @Original_TaskID Int, 
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
  @ISParent Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TOS_Tasks] SET 
   [Description] = @Description
  ,[wuDefined] = @wuDefined
  ,[stdtDefined] = @stdtDefined
  ,[endtDefined] = @endtDefined
  ,[stdtActual] = @stdtActual
  ,[Sequence] = @Sequence
  ,[endtActual] = @endtActual
  ,[ProjectID] = @ProjectID
  ,[ElementID] = @ElementID
  ,[FunctionalAreaID] = @FunctionalAreaID
  ,[TaskTypeID] = @TaskTypeID
  ,[Active] = @Active
  ,[wuEntered] = @wuEntered
  ,[wuBalance] = @wuBalance
  ,[wuNoteID] = @wuNoteID
  ,[AssignedTo] = @AssignedTo
  ,[Predecessors] = @Predecessors
  ,[Successors] = @Successors
  ,[ParentTaskID] = @ParentTaskID
  ,[IsParent] = @IsParent
  WHERE
  [TaskID] = @Original_TaskID
  SET @RowCount = @@RowCount
GO
