USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPkgStatusDelete]
  @Original_StatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_PkgStatus]
  WHERE
  [PAK_PkgStatus].[StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
