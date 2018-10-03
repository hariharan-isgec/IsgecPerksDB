USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakTCPOLRDInsert]
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
  @Return_SerialNo Int = null OUTPUT, 
  @Return_ItemNo Int = null OUTPUT, 
  @Return_UploadNo Int = null OUTPUT, 
  @Return_DocSerialNo Int = null OUTPUT 
  AS
  INSERT [PAK_POLineRecDoc]
  (
   [SerialNo]
  ,[ItemNo]
  ,[UploadNo]
  ,[DocumentID]
  ,[DocumentRev]
  ,[DocumentDescription]
  ,[ReceiptNo]
  ,[RevisionNo]
  ,[FileName]
  ,[DiskFileName]
  ,[ERPDocSerialNo]
  ,[AutoGenerated] 
  )
  VALUES
  (
   @SerialNo
  ,@ItemNo
  ,@UploadNo
  ,@DocumentID
  ,@DocumentRev
  ,@DocumentDescription
  ,@ReceiptNo
  ,@RevisionNo
  ,@FileName
  ,@DiskFileName
  ,@ERPDocSerialNo
  ,@Autogenerated 
  )
  SET @Return_SerialNo = @SerialNo
  SET @Return_ItemNo = @ItemNo
  SET @Return_UploadNo = @UploadNo
  SET @Return_DocSerialNo = Scope_Identity()
GO
