USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmReceiveStatusSelectByID]
  @ReceiveStatusID NVarChar(3) 
  AS
  SELECT
		[IDM_ReceiveStatus].[ReceiveStatusID] ,
		[IDM_ReceiveStatus].[Description]  
  FROM [IDM_ReceiveStatus] 
  WHERE
  [IDM_ReceiveStatus].[ReceiveStatusID] = @ReceiveStatusID
GO
