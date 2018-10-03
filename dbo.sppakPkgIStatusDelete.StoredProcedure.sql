USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPkgIStatusDelete]
  @Original_StatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_PkgIStatus]
  WHERE
  [PAK_PkgIStatus].[StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
