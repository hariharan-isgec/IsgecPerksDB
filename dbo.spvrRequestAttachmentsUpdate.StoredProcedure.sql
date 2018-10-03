USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestAttachmentsUpdate]
  @Original_RequestNo Int, 
  @Original_SerialNo Int, 
  @RequestNo Int,
  @Description NVarChar(50),
  @FileName NVarChar(250),
  @DiskFile NVarChar(250),
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_RequestAttachments] SET 
   [RequestNo] = @RequestNo
  ,[Description] = @Description
  ,[FileName] = @FileName
  ,[DiskFile] = @DiskFile
  WHERE
  [RequestNo] = @Original_RequestNo
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
