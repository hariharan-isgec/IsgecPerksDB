USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrExecutionAttachmentsUpdate]
  @Original_SRNNo Int, 
  @Original_SerialNo Int, 
  @SRNNo Int,
  @Description NVarChar(50),
  @FileName NVarChar(250),
  @DiskFile NVarChar(250),
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_ExecutionAttachments] SET 
   [SRNNo] = @SRNNo
  ,[Description] = @Description
  ,[FileName] = @FileName
  ,[DiskFile] = @DiskFile
  WHERE
  [SRNNo] = @Original_SRNNo
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
