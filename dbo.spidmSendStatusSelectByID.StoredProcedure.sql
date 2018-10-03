USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmSendStatusSelectByID]
  @SendStatusID NVarChar(3) 
  AS
  SELECT
		[IDM_SendStatus].[SendStatusID] ,
		[IDM_SendStatus].[Description] ,
		[IDM_SendStatus].[ReceivedBack] ,
		[IDM_SendStatus].[IsItForApproval]  
  FROM [IDM_SendStatus] 
  WHERE
  [IDM_SendStatus].[SendStatusID] = @SendStatusID
GO
