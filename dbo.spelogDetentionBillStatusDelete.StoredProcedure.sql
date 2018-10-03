USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogDetentionBillStatusDelete]
  @Original_StatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ELOG_DetentionBillStatus]
  WHERE
  [ELOG_DetentionBillStatus].[StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
