USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakTCPOLRUpdate]
  @Original_SerialNo Int, 
  @Original_ItemNo Int, 
  @Original_UploadNo Int, 
  @DocumentCategoryID Int,
  @CreatedOn DateTime,
  @ReceiptNo NVarChar(9),
  @RevisionNo NVarChar(20),
  @UploadStatusID Int,
  @SerialNo Int,
  @ItemNo Int,
  @UploadRemarks NVarChar(500),
  @CreatedBy NVarChar(8),
  @SDocSerialNo Int = 0,
  @ERPTransmittalNo NVarChar(9) = null,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_POLineRec] SET 
   [DocumentCategoryID] = @DocumentCategoryID
  ,[CreatedOn] = @CreatedOn
  ,[ReceiptNo] = @ReceiptNo
  ,[RevisionNo] = @RevisionNo
  ,[UploadStatusID] = @UploadStatusID
  ,[SerialNo] = @SerialNo
  ,[ItemNo] = @ItemNo
  ,[UploadRemarks] = @UploadRemarks
  ,[CreatedBy] = @CreatedBy
  ,[SDocSerialNo] = @SDocSerialNo
  ,[ERPTransmittalNo] = @ERPTransmittalNo 
  WHERE
  [SerialNo] = @Original_SerialNo
  AND [ItemNo] = @Original_ItemNo
  AND [UploadNo] = @Original_UploadNo
  SET @RowCount = @@RowCount
GO
