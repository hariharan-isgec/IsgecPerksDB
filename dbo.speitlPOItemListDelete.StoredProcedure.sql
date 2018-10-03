USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPOItemListDelete]
  @Original_SerialNo Int,
  @Original_ItemLineNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [EITL_POItemList]
  WHERE
  [EITL_POItemList].[SerialNo] = @Original_SerialNo
  AND [EITL_POItemList].[ItemLineNo] = @Original_ItemLineNo
  SET @RowCount = @@RowCount
GO
