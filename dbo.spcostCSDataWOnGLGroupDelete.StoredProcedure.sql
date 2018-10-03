USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCSDataWOnGLGroupDelete]
  @Original_ProjectGroupID Int,
  @Original_FinYear Int,
  @Original_Quarter Int,
  @Original_Revision Int,
  @Original_WorkOrderTypeID Int,
  @Original_GLGroupID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [COST_CSDataWOnGLGroup]
  WHERE
  [COST_CSDataWOnGLGroup].[ProjectGroupID] = @Original_ProjectGroupID
  AND [COST_CSDataWOnGLGroup].[FinYear] = @Original_FinYear
  AND [COST_CSDataWOnGLGroup].[Quarter] = @Original_Quarter
  AND [COST_CSDataWOnGLGroup].[Revision] = @Original_Revision
  AND [COST_CSDataWOnGLGroup].[WorkOrderTypeID] = @Original_WorkOrderTypeID
  AND [COST_CSDataWOnGLGroup].[GLGroupID] = @Original_GLGroupID
  SET @RowCount = @@RowCount
GO
