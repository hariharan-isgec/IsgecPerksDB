USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLorryReceiptStatusSelectByID]
  @LoginID NVarChar(8),
  @LRStatusID Int 
  AS
  SELECT
    [VR_LorryReceiptStatus].*  
  FROM [VR_LorryReceiptStatus] 
  WHERE
  [VR_LorryReceiptStatus].[LRStatusID] = @LRStatusID
GO
