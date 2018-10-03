USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostFinYearProjectsDelete]
  @Original_FinYear Int,
  @Original_Quarter Int,
  @Original_ProjectID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [COST_FinYearProjects]
  WHERE
  [COST_FinYearProjects].[FinYear] = @Original_FinYear
  AND [COST_FinYearProjects].[Quarter] = @Original_Quarter
  AND [COST_FinYearProjects].[ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO
