USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakReceiveStatusSelectByID]
  @LoginID NVarChar(8),
  @ReceiveStatusID Int 
  AS
  SELECT
    [PAK_ReceiveStatus].*  
  FROM [PAK_ReceiveStatus] 
  WHERE
  [PAK_ReceiveStatus].[ReceiveStatusID] = @ReceiveStatusID
GO
