USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectGroupProjectsDelete]
  @Original_ProjectGroupID Int,
  @Original_ProjectID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [COST_ProjectGroupProjects]
  WHERE
  [COST_ProjectGroupProjects].[ProjectGroupID] = @Original_ProjectGroupID
  AND [COST_ProjectGroupProjects].[ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO
