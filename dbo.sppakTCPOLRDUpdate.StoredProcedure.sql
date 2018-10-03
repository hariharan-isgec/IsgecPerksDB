USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakTCPOLRDUpdate]
  @Original_SerialNo Int, 
  @Original_ItemNo Int, 
  @Original_UploadNo Int, 
  @Original_DocSerialNo Int, 
  @SerialNo Int,
  @ItemNo Int,
  @UploadNo Int,
  @DocumentID NVarChar(32),
  @DocumentRev NVarChar(20),
  @DocumentDescription NVarChar(100),
  @ReceiptNo NVarChar(9),
  @RevisionNo NVarChar(20),
  @FileName NVarChar(100),
  @DiskFileName NVarChar(250),
  @ERPDocSerialNo Int, 
  @AutoGenerated Bit = 0,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_POLineRecDoc] SET 
   [SerialNo] = @SerialNo
  ,[ItemNo] = @ItemNo
  ,[UploadNo] = @UploadNo
  ,[DocumentID] = @DocumentID
  ,[DocumentRev] = @DocumentRev
  ,[DocumentDescription] = @DocumentDescription
  ,[ReceiptNo] = @ReceiptNo
  ,[RevisionNo] = @RevisionNo
  ,[FileName] = @FileName
  ,[DiskFileName] = @DiskFileName
  ,[ERPDocSerialNo] = @ERPDocSerialNo 
  ,[AutoGenerated] = @AutoGenerated 
  WHERE
  [SerialNo] = @Original_SerialNo
  AND [ItemNo] = @Original_ItemNo
  AND [UploadNo] = @Original_UploadNo
  AND [DocSerialNo] = @Original_DocSerialNo
  SET @RowCount = @@RowCount
GO
