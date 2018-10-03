USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapAttachmentStatesSelectByID]
  @LoginID NVarChar(8),
  @StatusID Int 
  AS
  SELECT
		[QAP_AttachmentStates].[StatusID] ,
		[QAP_AttachmentStates].[Description]  
  FROM [QAP_AttachmentStates] 
  WHERE
  [QAP_AttachmentStates].[StatusID] = @StatusID
GO
