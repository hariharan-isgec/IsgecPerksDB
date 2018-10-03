USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostGLGroupGLsDelete]
  @Original_GLGroupID Int,
  @Original_GLCode NVarChar(10),
  @RowCount int = null OUTPUT
  AS
  DELETE [COST_GLGroupGLs]
  WHERE
  [COST_GLGroupGLs].[GLGroupID] = @Original_GLGroupID
  AND [COST_GLGroupGLs].[GLCode] = @Original_GLCode
  SET @RowCount = @@RowCount
GO
