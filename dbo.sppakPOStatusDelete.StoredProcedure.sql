USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOStatusDelete]
  @Original_StatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_POStatus]
  WHERE
  [PAK_POStatus].[StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
