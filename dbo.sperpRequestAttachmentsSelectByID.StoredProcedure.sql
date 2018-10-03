USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestAttachmentsSelectByID]
  @LoginID NVarChar(8),
  @ApplID Int,
  @RequestID Int,
  @SerialNo Int 
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
  WHERE
  [ERP_RequestAttachments].[ApplID] = @ApplID
  AND [ERP_RequestAttachments].[RequestID] = @RequestID
  AND [ERP_RequestAttachments].[SerialNo] = @SerialNo
GO
