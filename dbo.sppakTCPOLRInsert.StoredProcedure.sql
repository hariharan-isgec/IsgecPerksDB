USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakTCPOLRInsert]
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
  @Return_SerialNo Int = null OUTPUT, 
  @Return_ItemNo Int = null OUTPUT, 
  @Return_UploadNo Int = null OUTPUT 
  AS
  INSERT [PAK_POLineRec]
  (
   [DocumentCategoryID]
  ,[CreatedOn]
  ,[ReceiptNo]
  ,[RevisionNo]
  ,[UploadStatusID]
  ,[SerialNo]
  ,[ItemNo]
  ,[UploadRemarks]
  ,[CreatedBy]
  ,[SDocSerialNo]
  ,[ERPTransmittalNo]
  )
  VALUES
  (
   @DocumentCategoryID
  ,@CreatedOn
  ,@ReceiptNo
  ,@RevisionNo
  ,@UploadStatusID
  ,@SerialNo
  ,@ItemNo
  ,@UploadRemarks
  ,@CreatedBy
  ,@SDocSerialNo
  ,@ERPTransmittalNo
  )
  SET @Return_SerialNo = @SerialNo
  SET @Return_ItemNo = @ItemNo
  SET @Return_UploadNo = Scope_Identity()
GO
