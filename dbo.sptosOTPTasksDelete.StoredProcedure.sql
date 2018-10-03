USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOTPTasksDelete]
  @Original_ProjectID NVarChar(6),
  @Original_TaskID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TOS_Tasks]
  WHERE
  [TOS_Tasks].[ProjectID] = @Original_ProjectID
  AND [TOS_Tasks].[TaskID] = @Original_TaskID
  SET @RowCount = @@RowCount
GO
