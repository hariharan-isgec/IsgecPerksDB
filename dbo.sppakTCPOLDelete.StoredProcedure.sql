USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakTCPOLDelete]
  @Original_SerialNo Int,
  @Original_ItemNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_POLine]
  WHERE
  [PAK_POLine].[SerialNo] = @Original_SerialNo
  AND [PAK_POLine].[ItemNo] = @Original_ItemNo
  SET @RowCount = @@RowCount
GO
