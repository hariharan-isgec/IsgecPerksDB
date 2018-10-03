USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmTmtlStatusDelete]
  @Original_StatusID NVarChar(1),
  @RowCount int = null OUTPUT
  AS
  DELETE [DCM_TmtlStatus]
  WHERE
  [DCM_TmtlStatus].[StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
