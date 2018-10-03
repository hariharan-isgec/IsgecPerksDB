USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapAttachmentsSelectByID]
  @LoginID NVarChar(8),
  @RequestNo Int,
  @SerialNo Int 
  AS
  SELECT
		[QAP_Attachments].[RequestNo] ,
		[QAP_Attachments].[SerialNo] ,
		[QAP_Attachments].[Description] ,
		[QAP_Attachments].[FileName] ,
		[QAP_Attachments].[DiskFile] ,
		[QAP_Attachments].[StatusID] ,
		[QAP_AttachmentStates1].[Description] AS QAP_AttachmentStates1_Description,
		[QAP_Requests1].[QAPNo] AS QAP_Requests1_QAPNo 
  FROM [QAP_Attachments] 
  LEFT OUTER JOIN [QAP_AttachmentStates] AS [QAP_AttachmentStates1]
    ON [QAP_Attachments].[StatusID] = [QAP_AttachmentStates1].[StatusID]
  INNER JOIN [QAP_Requests] AS [QAP_Requests1]
    ON [QAP_Attachments].[RequestNo] = [QAP_Requests1].[RequestNo]
  WHERE
  [QAP_Attachments].[RequestNo] = @RequestNo
  AND [QAP_Attachments].[SerialNo] = @SerialNo
GO
