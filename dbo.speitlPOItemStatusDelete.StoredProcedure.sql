USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPOItemStatusDelete]
  @Original_StatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [EITL_POItemStatus]
  WHERE
  [EITL_POItemStatus].[StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
