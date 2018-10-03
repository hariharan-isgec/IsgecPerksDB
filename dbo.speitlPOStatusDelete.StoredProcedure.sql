USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPOStatusDelete]
  @Original_StatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [EITL_POStatus]
  WHERE
  [EITL_POStatus].[StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
