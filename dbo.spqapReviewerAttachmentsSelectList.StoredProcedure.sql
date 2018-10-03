USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapReviewerAttachmentsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'RequestNo' THEN [QAP_Attachments].[RequestNo] END,
     CASE @OrderBy WHEN 'RequestNo DESC' THEN [QAP_Attachments].[RequestNo] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [QAP_Attachments].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [QAP_Attachments].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [QAP_Attachments].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [QAP_Attachments].[Description] END DESC,
     CASE @OrderBy WHEN 'FileName' THEN [QAP_Attachments].[FileName] END,
     CASE @OrderBy WHEN 'FileName DESC' THEN [QAP_Attachments].[FileName] END DESC,
     CASE @OrderBy WHEN 'DiskFile' THEN [QAP_Attachments].[DiskFile] END,
     CASE @OrderBy WHEN 'DiskFile DESC' THEN [QAP_Attachments].[DiskFile] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [QAP_Attachments].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [QAP_Attachments].[StatusID] END DESC,
     CASE @OrderBy WHEN 'QAP_AttachmentStates1_Description' THEN [QAP_AttachmentStates1].[Description] END,
     CASE @OrderBy WHEN 'QAP_AttachmentStates1_Description DESC' THEN [QAP_AttachmentStates1].[Description] END DESC,
     CASE @OrderBy WHEN 'QAP_Requests1_QAPNo' THEN [QAP_Requests1].[QAPNo] END,
     CASE @OrderBy WHEN 'QAP_Requests1_QAPNo DESC' THEN [QAP_Requests1].[QAPNo] END DESC 
  SET @RecordCount = @@RowCount
GO
