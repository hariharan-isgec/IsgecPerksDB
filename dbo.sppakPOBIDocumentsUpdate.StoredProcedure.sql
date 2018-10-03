USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOBIDocumentsUpdate]
  @Original_SerialNo Int, 
  @Original_BOMNo Int, 
  @Original_ItemNo Int, 
  @Original_DocNo Int, 
  @SerialNo Int,
  @BOMNo Int,
  @ItemNo Int,
  @DocumentID NVarChar(50),
  @DocumentRevision NVarChar(10),
  @DocumentName NVarChar(100),
  @FileName NVarChar(250),
  @DiskFile NVarChar(250),
  @CreatedBySupplier Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_POBIDocuments] SET 
   [SerialNo] = @SerialNo
  ,[BOMNo] = @BOMNo
  ,[ItemNo] = @ItemNo
  ,[DocumentID] = @DocumentID
  ,[DocumentRevision] = @DocumentRevision
  ,[DocumentName] = @DocumentName
  ,[FileName] = @FileName
  ,[DiskFile] = @DiskFile
  ,[CreatedBySupplier] = @CreatedBySupplier
  WHERE
  [SerialNo] = @Original_SerialNo
  AND [BOMNo] = @Original_BOMNo
  AND [ItemNo] = @Original_ItemNo
  AND [DocNo] = @Original_DocNo
  SET @RowCount = @@RowCount
GO
