USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestAttachmentsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ERP_RequestAttachments].[ApplID] ,
		[ERP_RequestAttachments].[RequestID] ,
		[ERP_RequestAttachments].[SerialNo] ,
		[ERP_RequestAttachments].[Description] ,
		[ERP_RequestAttachments].[FileName] ,
		[ERP_RequestAttachments].[DiskFile] ,
		[ERP_Applications1].[ApplName] AS ERP_Applications1_ApplName,
		[ERP_ChaneRequest2].[ChangeSubject] AS ERP_ChaneRequest2_ChangeSubject 
  FROM [ERP_RequestAttachments] 
  INNER JOIN [ERP_Applications] AS [ERP_Applications1]
    ON [ERP_RequestAttachments].[ApplID] = [ERP_Applications1].[ApplID]
  INNER JOIN [ERP_ChaneRequest] AS [ERP_ChaneRequest2]
    ON [ERP_RequestAttachments].[ApplID] = [ERP_ChaneRequest2].[ApplID]
    AND [ERP_RequestAttachments].[RequestID] = [ERP_ChaneRequest2].[RequestID]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ApplID' THEN [ERP_RequestAttachments].[ApplID] END,
     CASE @OrderBy WHEN 'ApplID DESC' THEN [ERP_RequestAttachments].[ApplID] END DESC,
     CASE @OrderBy WHEN 'RequestID' THEN [ERP_RequestAttachments].[RequestID] END,
     CASE @OrderBy WHEN 'RequestID DESC' THEN [ERP_RequestAttachments].[RequestID] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [ERP_RequestAttachments].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [ERP_RequestAttachments].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ERP_RequestAttachments].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ERP_RequestAttachments].[Description] END DESC,
     CASE @OrderBy WHEN 'FileName' THEN [ERP_RequestAttachments].[FileName] END,
     CASE @OrderBy WHEN 'FileName DESC' THEN [ERP_RequestAttachments].[FileName] END DESC,
     CASE @OrderBy WHEN 'DiskFile' THEN [ERP_RequestAttachments].[DiskFile] END,
     CASE @OrderBy WHEN 'DiskFile DESC' THEN [ERP_RequestAttachments].[DiskFile] END DESC,
     CASE @OrderBy WHEN 'ERP_Applications1_ApplName' THEN [ERP_Applications1].[ApplName] END,
     CASE @OrderBy WHEN 'ERP_Applications1_ApplName DESC' THEN [ERP_Applications1].[ApplName] END DESC,
     CASE @OrderBy WHEN 'ERP_ChaneRequest2_ChangeSubject' THEN [ERP_ChaneRequest2].[ChangeSubject] END,
     CASE @OrderBy WHEN 'ERP_ChaneRequest2_ChangeSubject DESC' THEN [ERP_ChaneRequest2].[ChangeSubject] END DESC 
  SET @RecordCount = @@RowCount
GO
