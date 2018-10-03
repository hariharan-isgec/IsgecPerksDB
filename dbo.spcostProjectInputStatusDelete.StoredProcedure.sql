USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectInputStatusDelete]
  @Original_StatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [COST_ProjectInputStatus]
  WHERE
  [COST_ProjectInputStatus].[StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
