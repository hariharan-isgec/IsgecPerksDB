USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosUserTasksDelete]
  @Original_UserID NVarChar(8),
  @Original_TaskID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TOS_UserTasks]
  WHERE
  [TOS_UserTasks].[UserID] = @Original_UserID
  AND [TOS_UserTasks].[TaskID] = @Original_TaskID
  SET @RowCount = @@RowCount
GO
