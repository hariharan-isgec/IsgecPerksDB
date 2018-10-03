USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmProjectsDelete]
  @Original_ProjectCode NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [DCM_Projects]
  WHERE
  [DCM_Projects].[ProjectCode] = @Original_ProjectCode
  SET @RowCount = @@RowCount
GO
