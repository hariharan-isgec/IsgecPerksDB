USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakQCListDDelete]
  @Original_SerialNo Int,
  @Original_QCLNo Int,
  @Original_BOMNo Int,
  @Original_ItemNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_QCListD]
  WHERE
  [PAK_QCListD].[SerialNo] = @Original_SerialNo
  AND [PAK_QCListD].[QCLNo] = @Original_QCLNo
  AND [PAK_QCListD].[BOMNo] = @Original_BOMNo
  AND [PAK_QCListD].[ItemNo] = @Original_ItemNo
  SET @RowCount = @@RowCount
GO
