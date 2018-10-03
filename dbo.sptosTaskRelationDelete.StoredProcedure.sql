USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosTaskRelationDelete]
  @Original_TaskID Int,
  @Original_ChildID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TOS_TaskRelation]
  WHERE
  [TOS_TaskRelation].[TaskID] = @Original_TaskID
  AND [TOS_TaskRelation].[ChildID] = @Original_ChildID
  SET @RowCount = @@RowCount
GO
