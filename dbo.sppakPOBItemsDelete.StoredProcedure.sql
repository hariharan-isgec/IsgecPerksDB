USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOBItemsDelete]
  @Original_SerialNo Int,
  @Original_BOMNo Int,
  @Original_ItemNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_POBItems]
  WHERE
  [PAK_POBItems].[SerialNo] = @Original_SerialNo
  AND [PAK_POBItems].[BOMNo] = @Original_BOMNo
  AND [PAK_POBItems].[ItemNo] = @Original_ItemNo
  SET @RowCount = @@RowCount
GO
