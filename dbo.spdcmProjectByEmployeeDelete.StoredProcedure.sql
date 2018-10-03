USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmProjectByEmployeeDelete]
  @Original_RecordID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [DCM_ProjectByEmployee]
  WHERE
  [DCM_ProjectByEmployee].[RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
