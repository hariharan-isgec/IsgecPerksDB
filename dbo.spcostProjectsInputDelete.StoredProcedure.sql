USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectsInputDelete]
  @Original_ProjectGroupID Int,
  @Original_FinYear Int,
  @Original_Quarter Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [COST_ProjectsInput]
  WHERE
  [COST_ProjectsInput].[ProjectGroupID] = @Original_ProjectGroupID
  AND [COST_ProjectsInput].[FinYear] = @Original_FinYear
  AND [COST_ProjectsInput].[Quarter] = @Original_Quarter
  SET @RowCount = @@RowCount
GO
