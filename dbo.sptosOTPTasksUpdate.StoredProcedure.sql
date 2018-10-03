USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOTPTasksUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_TaskID Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [TOS_Tasks] SET 
   [ProjectID] = @ProjectID
  ,[Description] = @Description
  ,[stdtDefined] = @stdtDefined
  ,[endtDefined] = @endtDefined
  ,[wuDefined] = @wuDefined
  ,[ElementID] = @ElementID
  ,[FunctionalAreaID] = @FunctionalAreaID
  ,[TaskTypeID] = @TaskTypeID
  ,[AssignedTo] = @AssignedTo
  ,[ParentTaskID] = @ParentTaskID
  ,[Active] = @Active
  ,[Sequence] = @Sequence
  ,[stdtActual] = @stdtActual
  ,[endtActual] = @endtActual
  ,[wuEntered] = @wuEntered
  ,[wuBalance] = @wuBalance
  ,[Predecessors] = @Predecessors
  ,[Successors] = @Successors
  ,[wuNoteID] = @wuNoteID
  ,[IsParent] = @IsParent
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [TaskID] = @Original_TaskID
  SET @RowCount = @@RowCount
GO
