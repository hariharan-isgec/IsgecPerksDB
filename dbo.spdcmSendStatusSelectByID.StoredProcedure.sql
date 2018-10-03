USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmSendStatusSelectByID]
  @SendStatusID NVarChar(2) 
  AS
  SELECT
		[DCM_SendStatus].[SendStatusID],
		[DCM_SendStatus].[Description] 
  FROM [DCM_SendStatus] 
  WHERE
  [DCM_SendStatus].[SendStatusID] = @SendStatusID
GO
