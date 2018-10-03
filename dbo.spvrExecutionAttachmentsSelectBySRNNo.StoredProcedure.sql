USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrExecutionAttachmentsSelectBySRNNo]
  @SRNNo Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[VR_ExecutionAttachments].[SRNNo] ,
		[VR_ExecutionAttachments].[SerialNo] ,
		[VR_ExecutionAttachments].[Description] ,
		[VR_ExecutionAttachments].[FileName] ,
		[VR_ExecutionAttachments].[DiskFile] ,
		[VR_RequestExecution1].[ExecutionDescription] AS VR_RequestExecution1_ExecutionDescription 
  FROM [VR_ExecutionAttachments] 
  INNER JOIN [VR_RequestExecution] AS [VR_RequestExecution1]
    ON [VR_ExecutionAttachments].[SRNNo] = [VR_RequestExecution1].[SRNNo]
  WHERE
  [VR_ExecutionAttachments].[SRNNo] = @SRNNo
  ORDER BY
     CASE @OrderBy WHEN 'SRNNo' THEN [VR_ExecutionAttachments].[SRNNo] END,
     CASE @OrderBy WHEN 'SRNNo DESC' THEN [VR_ExecutionAttachments].[SRNNo] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [VR_ExecutionAttachments].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [VR_ExecutionAttachments].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [VR_ExecutionAttachments].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [VR_ExecutionAttachments].[Description] END DESC,
     CASE @OrderBy WHEN 'FileName' THEN [VR_ExecutionAttachments].[FileName] END,
     CASE @OrderBy WHEN 'FileName DESC' THEN [VR_ExecutionAttachments].[FileName] END DESC,
     CASE @OrderBy WHEN 'DiskFile' THEN [VR_ExecutionAttachments].[DiskFile] END,
     CASE @OrderBy WHEN 'DiskFile DESC' THEN [VR_ExecutionAttachments].[DiskFile] END DESC,
     CASE @OrderBy WHEN 'VR_RequestExecution1_ExecutionDescription' THEN [VR_RequestExecution1].[ExecutionDescription] END,
     CASE @OrderBy WHEN 'VR_RequestExecution1_ExecutionDescription DESC' THEN [VR_RequestExecution1].[ExecutionDescription] END DESC 
  SET @RecordCount = @@RowCount
GO
