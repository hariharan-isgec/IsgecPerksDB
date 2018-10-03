USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestAttachmentsUpdate]
  @Original_ApplID Int, 
  @Original_RequestID Int, 
  @Original_SerialNo Int, 
  @ApplID Int,
  @RequestID Int,
  @Description NVarChar(100),
  @FileName NVarChar(250),
  @DiskFile NVarChar(250),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ERP_RequestAttachments] SET 
   [ApplID] = @ApplID
  ,[RequestID] = @RequestID
  ,[Description] = @Description
  ,[FileName] = @FileName
  ,[DiskFile] = @DiskFile
  WHERE
  [ApplID] = @Original_ApplID
  AND [RequestID] = @Original_RequestID
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
