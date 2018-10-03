USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPkgListHDelete]
  @Original_SerialNo Int,
  @Original_PkgNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_PkgListH]
  WHERE
  [PAK_PkgListH].[SerialNo] = @Original_SerialNo
  AND [PAK_PkgListH].[PkgNo] = @Original_PkgNo
  SET @RowCount = @@RowCount
GO
