USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOBIDocumentsInsert]
  @SerialNo Int,
  @BOMNo Int,
  @ItemNo Int,
  @DocumentID NVarChar(50),
  @DocumentRevision NVarChar(10),
  @DocumentName NVarChar(100),
  @FileName NVarChar(250),
  @DiskFile NVarChar(250),
  @CreatedBySupplier Bit,
  @Return_SerialNo Int = null OUTPUT, 
  @Return_BOMNo Int = null OUTPUT, 
  @Return_ItemNo Int = null OUTPUT, 
  @Return_DocNo Int = null OUTPUT 
  AS
  INSERT [PAK_POBIDocuments]
  (
   [SerialNo]
  ,[BOMNo]
  ,[ItemNo]
  ,[DocumentID]
  ,[DocumentRevision]
  ,[DocumentName]
  ,[FileName]
  ,[DiskFile]
  ,[CreatedBySupplier]
  )
  VALUES
  (
   @SerialNo
  ,@BOMNo
  ,@ItemNo
  ,@DocumentID
  ,@DocumentRevision
  ,@DocumentName
  ,@FileName
  ,@DiskFile
  ,@CreatedBySupplier
  )
  SET @Return_SerialNo = @SerialNo
  SET @Return_BOMNo = @BOMNo
  SET @Return_ItemNo = @ItemNo
  SET @Return_DocNo = Scope_Identity()
GO
