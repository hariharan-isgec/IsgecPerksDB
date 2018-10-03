USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPkgListDDelete]
  @Original_SerialNo Int,
  @Original_PkgNo Int,
  @Original_BOMNo Int,
  @Original_ItemNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_PkgListD]
  WHERE
  [PAK_PkgListD].[SerialNo] = @Original_SerialNo
  AND [PAK_PkgListD].[PkgNo] = @Original_PkgNo
  AND [PAK_PkgListD].[BOMNo] = @Original_BOMNo
  AND [PAK_PkgListD].[ItemNo] = @Original_ItemNo
  SET @RowCount = @@RowCount
GO
