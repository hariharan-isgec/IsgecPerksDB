USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmProjectsDelete]
  @Original_ProjectID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [DCM_Projects]
  WHERE
  [DCM_Projects].[ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO
