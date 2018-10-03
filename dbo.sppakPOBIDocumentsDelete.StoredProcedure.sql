USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOBIDocumentsDelete]
  @Original_SerialNo Int,
  @Original_BOMNo Int,
  @Original_ItemNo Int,
  @Original_DocNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_POBIDocuments]
  WHERE
  [PAK_POBIDocuments].[SerialNo] = @Original_SerialNo
  AND [PAK_POBIDocuments].[BOMNo] = @Original_BOMNo
  AND [PAK_POBIDocuments].[ItemNo] = @Original_ItemNo
  AND [PAK_POBIDocuments].[DocNo] = @Original_DocNo
  SET @RowCount = @@RowCount
GO
