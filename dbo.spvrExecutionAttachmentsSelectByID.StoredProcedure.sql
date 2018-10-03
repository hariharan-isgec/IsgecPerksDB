USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrExecutionAttachmentsSelectByID]
  @LoginID NVarChar(8),
  @SRNNo Int,
  @SerialNo Int 
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
  AND [VR_ExecutionAttachments].[SerialNo] = @SerialNo
GO
