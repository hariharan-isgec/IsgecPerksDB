USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectGroupsDelete]
  @Original_ProjectGroupID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [COST_ProjectGroups]
  WHERE
  [COST_ProjectGroups].[ProjectGroupID] = @Original_ProjectGroupID
  SET @RowCount = @@RowCount
GO
