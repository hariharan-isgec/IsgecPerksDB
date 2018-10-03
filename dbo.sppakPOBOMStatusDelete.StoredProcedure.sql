USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOBOMStatusDelete]
  @Original_StatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_POBOMStatus]
  WHERE
  [PAK_POBOMStatus].[StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
