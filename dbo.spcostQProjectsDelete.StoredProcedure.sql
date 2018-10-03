USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostQProjectsDelete]
  @Original_ProjectID NVarChar(6),
  @Original_FinYear Int,
  @Original_Quarter Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [COST_Projects]
  WHERE
  [COST_Projects].[ProjectID] = @Original_ProjectID
  AND [COST_Projects].[FinYear] = @Original_FinYear
  AND [COST_Projects].[Quarter] = @Original_Quarter
  SET @RowCount = @@RowCount
GO
