USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakTCPOLRDelete]
  @Original_SerialNo Int,
  @Original_ItemNo Int,
  @Original_UploadNo Int,
  @RowCount int = null OUTPUT
  AS
  BEGIN

  DELETE [PAK_POLineRecDoc]
  WHERE
  [PAK_POLineRecDoc].[SerialNo] = @Original_SerialNo
  AND [PAK_POLineRecDoc].[ItemNo] = @Original_ItemNo
  AND [PAK_POLineRecDoc].[UploadNo] = @Original_UploadNo

  DELETE [PAK_POLineRec]
  WHERE
  [PAK_POLineRec].[SerialNo] = @Original_SerialNo
  AND [PAK_POLineRec].[ItemNo] = @Original_ItemNo
  AND [PAK_POLineRec].[UploadNo] = @Original_UploadNo
  SET @RowCount = @@RowCount

  END
GO
