USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosUserTasksUpdate]
  @Original_UserID NVarChar(8), 
  @Original_TaskID Int, 
  @UserID NVarChar(8),
  @TaskID Int,
  @TaskTypeID NVarChar(2),
  @EntryEnabled Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TOS_UserTasks] SET 
   [UserID] = @UserID
  ,[TaskID] = @TaskID
  ,[TaskTypeID] = @TaskTypeID
  ,[EntryEnabled] = @EntryEnabled
  WHERE
  [UserID] = @Original_UserID
  AND [TaskID] = @Original_TaskID
  SET @RowCount = @@RowCount
GO
