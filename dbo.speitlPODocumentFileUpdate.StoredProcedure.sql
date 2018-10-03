USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPODocumentFileUpdate]
  @Original_SerialNo Int, 
  @Original_DocumentLineNo Int, 
  @Original_FileNo Int, 
  @SerialNo Int,
  @DocumentLineNo Int,
  @Description NVarChar(50),
  @FileName NVarChar(250),
  @DiskFile NVarChar(250),
  @RowCount int = null OUTPUT
  AS
  UPDATE [EITL_PODocumentFile] SET 
   [SerialNo] = @SerialNo
  ,[DocumentLineNo] = @DocumentLineNo
  ,[Description] = @Description
  ,[FileName] = @FileName
  ,[DiskFile] = @DiskFile
  WHERE
  [SerialNo] = @Original_SerialNo
  AND [DocumentLineNo] = @Original_DocumentLineNo
  AND [FileNo] = @Original_FileNo
  SET @RowCount = @@RowCount
GO
