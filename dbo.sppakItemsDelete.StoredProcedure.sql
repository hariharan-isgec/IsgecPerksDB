USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakItemsDelete]
  @Original_ItemNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_Items]
  WHERE
  [PAK_Items].[ItemNo] = @Original_ItemNo
  SET @RowCount = @@RowCount
GO
