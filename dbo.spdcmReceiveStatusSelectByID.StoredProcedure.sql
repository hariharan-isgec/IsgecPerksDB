USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmReceiveStatusSelectByID]
  @ReceiveStatusID NVarChar(2) 
  AS
  SELECT
		[DCM_ReceiveStatus].[ReceiveStatusID],
		[DCM_ReceiveStatus].[Description] 
  FROM [DCM_ReceiveStatus] 
  WHERE
  [DCM_ReceiveStatus].[ReceiveStatusID] = @ReceiveStatusID
GO
