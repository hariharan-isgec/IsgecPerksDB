USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosTaskRelationUpdate]
  @Original_TaskID Int, 
  @Original_ChildID Int, 
  @TaskID Int,
  @ChildID Int,
  @Sequence Int,
  @Active Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TOS_TaskRelation] SET 
   [TaskID] = @TaskID
  ,[ChildID] = @ChildID
  ,[Sequence] = @Sequence
  ,[Active] = @Active
  WHERE
  [TaskID] = @Original_TaskID
  AND [ChildID] = @Original_ChildID
  SET @RowCount = @@RowCount
GO
