USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectInputFilesDelete]
  @Original_ProjectGroupID Int,
  @Original_FinYear Int,
  @Original_Quarter Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [COST_ProjectInputFiles]
  WHERE
  [COST_ProjectInputFiles].[ProjectGroupID] = @Original_ProjectGroupID
  AND [COST_ProjectInputFiles].[FinYear] = @Original_FinYear
  AND [COST_ProjectInputFiles].[Quarter] = @Original_Quarter
  AND [COST_ProjectInputFiles].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
