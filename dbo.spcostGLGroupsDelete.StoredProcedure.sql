USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostGLGroupsDelete]
  @Original_GLGroupID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [COST_GLGroups]
  WHERE
  [COST_GLGroups].[GLGroupID] = @Original_GLGroupID
  SET @RowCount = @@RowCount
GO
